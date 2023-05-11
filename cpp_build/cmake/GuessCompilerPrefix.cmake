# Extract from FindBoost.cmake

#
# Runs compiler with "-dumpversion" and parses major/minor
# version with a regex.
#
function(COMPILER_DUMPVERSION _OUTPUT_VERSION)
  exec_program(${CMAKE_CXX_COMPILER}
    ARGS ${CMAKE_CXX_COMPILER_ARG1} --version
    OUTPUT_VARIABLE _COMPILER_VERSION
  )
  string(REGEX REPLACE "^[^0-9]*([0-9]+)\\.[0-9]+\\.[0-9]+.*$" "\\1"
    _COMPILER_VERSION ${_COMPILER_VERSION})

  set(${_OUTPUT_VERSION} ${_COMPILER_VERSION} PARENT_SCOPE)
endfunction()

# GCC-specific implementation
function(COMPILER_DUMPVERSION_GCC _OUTPUT_VERSION)
  exec_program(${CMAKE_CXX_COMPILER}
    ARGS ${CMAKE_CXX_COMPILER_ARG1} --version
    OUTPUT_VARIABLE _COMPILER_VERSION
  )
  string(REGEX REPLACE "^.*[^0-9]*([0-9]+)\\.[0-9]+\\.[0-9]+.*$" "\\1"
    _COMPILER_VERSION ${_COMPILER_VERSION})

  set(${_OUTPUT_VERSION} ${_COMPILER_VERSION} PARENT_SCOPE)
endfunction()

function(LIBC_DUMPVERSION _OUTPUT_VERSION)
  execute_process(
    COMMAND ${CMAKE_CXX_COMPILER} -print-file-name=libc.so.6
    OUTPUT_VARIABLE libc_path
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  execute_process(
    COMMAND ${libc_path}
    OUTPUT_VARIABLE libc_output
    RESULT_VARIABLE libc_ret
  )

  if (libc_ret EQUAL 0)
    string(REGEX MATCH "version[ \t]+[0-9]\.[0-9]+" libc_version ${libc_output})
    string(REGEX MATCH "[0-9\\.]+" libc_version ${libc_version})
  else()
    # executing libc.so.6 doesn't work
    get_filename_component(libc_path ${libc_path} REALPATH)
    get_filename_component(libc_version ${libc_path} NAME)
    string(REPLACE "${CMAKE_SHARED_LIBRARY_PREFIX}c-" "" libc_version ${libc_version})
    string(REPLACE "${CMAKE_SHARED_LIBRARY_SUFFIX}" "" libc_version ${libc_version})
  endif()

  if(NOT libc_version MATCHES "^[0-9.]+$")
    message(FATAL_ERROR "Unknown glibc version: ${GLIBC_VERSION}")
  endif()

  set(${_OUTPUT_VERSION} ${libc_version} PARENT_SCOPE)
endfunction()

# Guesses compiler prefix used in built library names
# Returns the guess by setting the variable pointed to by _ret
function(GUESS_COMPILER_PREFIX _ret)
  if(CMAKE_CXX_COMPILER_ID STREQUAL "Intel"
      OR CMAKE_CXX_COMPILER MATCHES "icl"
      OR CMAKE_CXX_COMPILER MATCHES "icpc")
    if(WIN32)
      set (_COMPILER "iw")
    else()
      set (_COMPILER "il")
    endif()
  elseif (GHSMULTI)
    set(_COMPILER "_ghs")
  elseif("x${CMAKE_CXX_COMPILER_ID}" STREQUAL "xMSVC")
    if(NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 19)
      set(_COMPILER "vc14")
    else()
      message(FATAL_ERROR "MSVC ${CMAKE_CXX_COMPILER_VERSION} (${_COMPILER_VERSION}) is unsupported")
    endif()
	if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "8")
      set(_COMPILER "${_COMPILER}x64")
	elseif ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4")
      set(_COMPILER "${_COMPILER}x86")
    endif()
  elseif (BORLAND)
    set(_COMPILER "bcb")
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "SunPro")
    set(_COMPILER "sw")
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "XL")
    set(_COMPILER "xlc")
  elseif (MINGW)
    COMPILER_DUMPVERSION(_COMPILER_VERSION)
    set(_COMPILER "mgw${_COMPILER_VERSION}")
  elseif (UNIX)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
      LIBC_DUMPVERSION(libc_version)
      set(_COMPILER "x86_64_libstdcpp_libc${libc_version}")
    elseif (CMAKE_COMPILER_IS_GNUCXX)
      COMPILER_DUMPVERSION_GCC(_COMPILER_VERSION)
      # Determine which version of GCC we have.
      set(_COMPILER "gcc")
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
      COMPILER_DUMPVERSION(_COMPILER_VERSION)
      set(_COMPILER "appleclang")
    endif()
  else()
    set(_COMPILER "")
  endif()
  set(${_ret} ${_COMPILER} PARENT_SCOPE)
endfunction()
