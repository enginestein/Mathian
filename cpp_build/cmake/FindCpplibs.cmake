# Looking for cpplibs directory, it should have precomiled boost and icu libraries
# This script tries to find it and set corresponding variables

function(FindSubDirStartsWith ROOT PREFIX OUTVAR)
    file(GLOB names RELATIVE ${ROOT} ${ROOT}/${PREFIX}*)
    if (names)
        set(${OUTVAR} ${names} PARENT_SCOPE)
    else()
        set(${OUTVAR} "NOTFOUND" PARENT_SCOPE)
    endif()
endfunction()

function(CheckRoot ROOT OUTVAR)
    file(TO_CMAKE_PATH "${ROOT}" _root)
    FindSubDirStartsWith(${_root} "boost" _BOOST_ROOT)
    FindSubDirStartsWith(${_root} "ICU" _ICU_ROOT)
    if (_BOOST_ROOT AND _ICU_ROOT)
        set(${OUTVAR} ${_root} PARENT_SCOPE)
    else()
        set(${OUTVAR} "NOTFOUND" PARENT_SCOPE)
    endif()
    unset(_root)
endfunction()

function(SetupLibraryRootHints ROOT PREFIX)
    file(GLOB files RELATIVE ${ROOT} ${ROOT}/*)
    foreach(child ${files})
        if(IS_DIRECTORY ${ROOT}/${child})
            string(REGEX MATCH "^[a-zA-Z0-9]+" library_name ${child})
            if (library_name)
                string(TOUPPER ${library_name} library_name)
                set(${PREFIX}${library_name}_ROOT ${ROOT}/${child} PARENT_SCOPE)
            endif()
        endif()
    endforeach()
endfunction()

function(CalcRelativePath OUTVAR)
    file(TO_CMAKE_PATH "${CMAKE_SOURCE_DIR}" _current)
    string(REGEX MATCH "^.*/asposecpplib/?" _current "${_current}")
    string(REGEX REPLACE "/asposecpplib/?$" "/cpplibs" _current "${_current}")
    set(${OUTVAR} "${_current}" PARENT_SCOPE)
endfunction()

unset(_ROOT)

# Try to find by variable
if (DEFINED ASPOSE_CPPLIBS_ROOT)
    CheckRoot(${ASPOSE_CPPLIBS_ROOT} _ROOT)
endif()

# Try to find by env
if (NOT _ROOT AND DEFINED ENV{ASPOSE_CPPLIBS_ROOT})
    CheckRoot($ENV{ASPOSE_CPPLIBS_ROOT} _ROOT)
endif()

# Try to find by relative path to ASPOSE_ROOT
if (NOT _ROOT)
    CheckRoot("${ASPOSE_ROOT}/../cpplibs" _ROOT)
endif()

# Try to find by relative path
if (NOT _ROOT)
    CalcRelativePath(relroot)
    CheckRoot(${relroot} _ROOT)
    unset(relroot)
endif()

if (NOT _ROOT)
    message(FATAL_ERROR "Aspose cpplibs library not found. Please setup ASPOSE_CPPLIBS_ROOT environment variable before run cmake")
endif()

FindSubDirStartsWith(${_ROOT} "boost" _BOOST_ROOT)
FindSubDirStartsWith(${_ROOT} "ICU" _ICU_ROOT)

# Primitive check for boost and icu files
find_path(ASPOSE_CPPLIBS_ROOT
    NAMES
        ${_BOOST_ROOT}/boost/version.hpp
        ${_ICU_ROOT}/include/unicode/uvernum.h
    HINTS
        ${_ROOT}
    DOC "Aspose cpplibs libraries"
)

unset(_BOOST_ROOT)
unset(_ICU_ROOT)

if (NOT ASPOSE_CPPLIBS_ROOT)
    message(FATAL_ERROR "Can't find boost and icu in the Aspose cpplibs library directory : ${_ROOT}")
endif()

unset(_ROOT)

# Setup library hints
SetupLibraryRootHints(${ASPOSE_CPPLIBS_ROOT} ASPOSE_)
