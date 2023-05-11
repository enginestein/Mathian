cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(Sigmath.Cpp CXX)

set(SRC_ROOT "${CMAKE_CURRENT_SOURCE_DIR}")
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

if(DEFINED ASPOSE_ROOT)
    message(STATUS "Using ASPOSE_ROOT value from cmake execute: ${ASPOSE_ROOT}")
elseif(DEFINED ENV{ASPOSE_ROOT})
    set(ASPOSE_ROOT $ENV{ASPOSE_ROOT})
    message(STATUS "Using ASPOSE_ROOT value from environment: ${ASPOSE_ROOT}")
else()
    set(ASPOSE_ROOT "C:/translator_cs2cpp")
endif()
file(TO_CMAKE_PATH "${ASPOSE_ROOT}" ASPOSE_ROOT)

option(USE_PCH "Use precompiled header" ${MSVC})
option(USE_COTIRE "Use compile time reducer" OFF)
option(USE_FASTLINK "Use /debug:fastlink option for MSVC" OFF)
option(BUILD_SHARED_LIBS "Build shared libraries" FALSE)
option(BUILD_PORTED_PROJECT "Build ported project" TRUE)
option(BUILD_TESTS "Build tests" TRUE)
option(OPTIMIZE_ALL "Enable optimization options for any build configuration" OFF)
option(NO_CHECKED_CASTS "Disable checked casts" OFF)
option(ENABLE_COVERAGE_REPORT "Enable code coverage report" OFF)

if(OPTIMIZE_ALL)
    if (MSVC)
        STRING(REPLACE "/Zi" "" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})
        STRING(REPLACE "/Od" "/O2" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})        
        STRING(REPLACE "/Ob0" "/Ob2" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})        
        STRING(REPLACE "/RTC1" "" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})        
    else()
        set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O3")
    endif()
endif()

set(ASPOSECPP_NO_CHECKED_CASTS "")
if (NO_CHECKED_CASTS)
    set(ASPOSECPP_NO_CHECKED_CASTS "ASPOSECPP_NO_CHECKED_CASTS")
endif()

# PORTED_PROJECT_TYPE = LIBRARY, APP
set(PORTED_PROJECT_TYPE LIBRARY)


include(./user.cmake OPTIONAL)
include(../common.cmake OPTIONAL)

include(OptionsCommon)
include(SetLibraryOutputName)
include(GroupSources) 
list(APPEND CMAKE_PREFIX_PATH ${ASPOSE_CPPLIBS_ROOT})

# Defines "CodePorting.Translator.Cs2Cpp.Framework" imported targets and find all dependencies
# Aspose::CodePorting.Translator.Cs2Cpp.Framework - imported target with all dependencies
find_package(CodePorting.Translator.Cs2Cpp.Framework REQUIRED CONFIG PATHS ${ASPOSE_ROOT})

message(STATUS "Project name: ${PROJECT_NAME}")

file(GLOB_RECURSE srcs "source/*.cpp" "source/*.h")
file(GLOB_RECURSE hdrs "include/*.h")
file(GLOB_RECURSE tests_srcs "gtest_custom/*.cpp")

# Additional global definitions



# Define interface library for dependencies
add_library(${PROJECT_NAME}_dependencies INTERFACE)

get_filename_component(GTEST_FUSED "${CMAKE_CURRENT_SOURCE_DIR}/gtest/fused-src" ABSOLUTE)
if(EXISTS "${GTEST_FUSED}/gtest" AND BUILD_TESTS)
    set(GTEST_APP 1)
    add_subdirectory(gtest/fused-src gtest)
	target_include_directories(${PROJECT_NAME}_dependencies INTERFACE 
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>  
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>  
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/source>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/gtest/fused-src>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/gtest>)
else()
	target_include_directories(${PROJECT_NAME}_dependencies INTERFACE 
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>  
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>  
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/source>)
endif()

if (BUILD_PORTED_PROJECT AND PORTED_PROJECT_TYPE STREQUAL "LIBRARY")
	target_include_directories(${PROJECT_NAME}_dependencies INTERFACE 
		$<INSTALL_INTERFACE:include>  
		$<INSTALL_INTERFACE:source>)
endif()


# Dependencies

include(GuessCompilerPrefix)
GUESS_COMPILER_PREFIX(compiler_prefix)

function(CopyAsposeCppLibrary target)
	add_custom_command(TARGET ${target} POST_BUILD 
		COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Aspose::CodePorting.Translator.Cs2Cpp.Framework> $<TARGET_FILE_DIR:${target}>)
endfunction()


target_link_libraries(${PROJECT_NAME}_dependencies INTERFACE CodePorting.Translator.Cs2Cpp.Framework)

function(SetCommonTargetSettings target)
	target_link_libraries(${target} PUBLIC ${PROJECT_NAME}_dependencies PRIVATE ${CMAKE_DL_LIBS})
	
	if (DEFINED WORKING_DIR)
		set_target_properties(${target} PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${WORKING_DIR}") 
	endif()

	set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${target})
	
    if (MSVC)
		set_property(TARGET ${target} APPEND_STRING PROPERTY COMPILE_FLAGS " /wd4250 /wd4100")
    endif()

	GroupSources(${target} "${CMAKE_CURRENT_SOURCE_DIR}")
	AsposeCommonTargetProperties(${target})
endfunction()

set(targets "")
set(COTIRE_PCH_MEMORY_SCALING_FACTOR "300")
include(cotire)
include(PrecompiledHeader)
include(AsposeNatvis)

if(EXISTS "${GTEST_FUSED}/gtest" AND BUILD_TESTS)
    set(target "${PROJECT_NAME}_gtest")
    add_executable(${target} ${srcs} ${hdrs} ${tests_srcs})

    target_link_libraries(${target} PRIVATE gtest)
    target_compile_definitions(${target} PRIVATE UNIT_TEST SIGMATH_UNIT_TEST ${ASPOSECPP_NO_CHECKED_CASTS} )

    enable_testing()
    if (DEFINED WORKING_DIR)
        add_test(NAME ${target}
            COMMAND ${target} --gtest_output=xml
            WORKING_DIRECTORY "${WORKING_DIR}")
    else()
        add_test(NAME ${target} COMMAND ${target} --gtest_output=xml)
    endif()
	
	SetCommonTargetSettings(${target})
	
	list(APPEND targets ${target})

    foreach (dependency IN ITEMS ${DEPENDENCIES_TO_COPY})
        string(REPLACE "@" ";" dependency_names ${dependency})
        list(LENGTH dependency_names dependency_length)
        if(dependency_length EQUAL "2")
            list(GET dependency_names 0 assembly)            
            list(GET dependency_names 1 csproject) 
        else()
            set(assembly  ${dependency})
            set(csproject ${dependency})
        endif()

        add_custom_command(TARGET ${target} POST_BUILD 
            COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/../${csproject}.Cpp/${OUTPUT_SUBDIR}/${CMAKE_SHARED_LIBRARY_PREFIX}${assembly}.Cpp_${compiler_prefix}$<$<CONFIG:Debug>:d>${CMAKE_SHARED_LIBRARY_SUFFIX} $<TARGET_FILE_DIR:${target}>)
    endforeach()

	AddAsposeNatvis(${target})
	
	CopyAsposeCppLibrary(${target})

	# Copy Asposecpplib's dependencies 
	set(INDEX 0)
	list(LENGTH ASPOSECPPLIB_DEPENDENCIES_DEBUG NUM_OF_BINARIES)
	while (INDEX LESS NUM_OF_BINARIES)
		list(GET ASPOSECPPLIB_DEPENDENCIES_DEBUG ${INDEX} DEPENDENCY_ITEM_DEBUG)
		list(GET ASPOSECPPLIB_DEPENDENCIES_RELEASE ${INDEX} DEPENDENCY_ITEM_RELEASE)
		get_filename_component(DEPENDENCY_ITEM_FNAME_DEBUG ${DEPENDENCY_ITEM_DEBUG} NAME)
		get_filename_component(DEPENDENCY_ITEM_FNAME_RELEASE ${DEPENDENCY_ITEM_RELEASE} NAME)
		add_custom_command(TARGET ${target} POST_BUILD 
			COMMAND ${CMAKE_COMMAND} -E copy_if_different $<$<CONFIG:Debug>:${DEPENDENCY_ITEM_DEBUG}> $<$<CONFIG:Debug>:$<TARGET_FILE_DIR:${target}>/${DEPENDENCY_ITEM_FNAME_DEBUG}> $<$<CONFIG:Release>:${DEPENDENCY_ITEM_RELEASE}> $<$<CONFIG:Release>:$<TARGET_FILE_DIR:${target}>/${DEPENDENCY_ITEM_FNAME_RELEASE}>
		)  
		math(EXPR INDEX "${INDEX} + 1")
	endwhile()

endif()

if (BUILD_PORTED_PROJECT)
    if (PORTED_PROJECT_TYPE STREQUAL "LIBRARY")
        set(target "${PROJECT_NAME}")
        add_library(${target} ${srcs} ${hdrs})
        if(BUILD_SHARED_LIBS AND EXISTS "${GTEST_FUSED}/gtest" AND BUILD_TESTS)
            target_link_libraries(${target} PRIVATE gtest)
        endif()
        SetCommonTargetSettings(${target})
        SetPortedLibraryOutputName(${target})
        list(APPEND targets ${target})
        target_compile_definitions(${target} PRIVATE SIGMATH_SHARED_EXPORTS ${ASPOSECPP_NO_CHECKED_CASTS} )
		AddAsposeNatvis(${target})
    endif()

    if (PORTED_PROJECT_TYPE STREQUAL "APP")
        set(target "${PROJECT_NAME}")
        add_executable(${target} ${srcs} ${hdrs})
        SetCommonTargetSettings(${target})
        list(APPEND targets ${target})
        target_compile_definitions(${target} PRIVATE SIGMATH_SHARED_EXPORTS ${ASPOSECPP_NO_CHECKED_CASTS} )
		AddAsposeNatvis(${target})
		CopyAsposeCppLibrary(${target})
    endif()
endif()



AddPrecompiledHeader("${targets}")

if (USE_COTIRE)
    set_property(SOURCE source/version_compatibility.cpp PROPERTY COTIRE_EXCLUDED ON)
    cotire(${target})
endif()

if (BUILD_PORTED_PROJECT AND PORTED_PROJECT_TYPE STREQUAL "LIBRARY")
# CPack configuration
include(BuildMetaInfo)
GetBuildMetaInfo(CPACK_SYSTEM_NAME)
set(CPACK_PACKAGE_VERSION "snapshot")
set(CPACK_GENERATOR "ZIP")
set(CPACK_PACKAGE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/package")
include(CPack)
# You can create zip package of asposecpp with the following command
# cpack -G ZIP

# Install commands
install(DIRECTORY include/ DESTINATION include OPTIONAL FILES_MATCHING PATTERN "*.h")
install(DIRECTORY source DESTINATION . OPTIONAL PATTERN "*.*" EXCLUDE)
install(TARGETS ${target} ${target}_dependencies  DESTINATION lib EXPORT ${target}Config)
export(TARGETS ${target} ${target}_dependencies FILE ${CMAKE_CURRENT_SOURCE_DIR}/${OUTPUT_SUBDIR}/${target}Config.cmake)
install(EXPORT ${target}Config DESTINATION lib)

endif()

include(./user2.cmake OPTIONAL)
