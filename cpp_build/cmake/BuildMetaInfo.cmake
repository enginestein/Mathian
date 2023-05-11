include("${CMAKE_CURRENT_LIST_DIR}/GuessCompilerPrefix.cmake")

function(GetBuildMetaInfo _ret)
    GUESS_COMPILER_PREFIX(_compiler)
    
    # Check multi-config generators
#    if (CMAKE_CONFIGURATION_TYPES)
        # Multi-config generators define properties for all configurations
#        set(${_ret} "${_compiler}" PARENT_SCOPE)
#    else()
        set(${_ret} "${_compiler}.${CMAKE_BUILD_TYPE}" PARENT_SCOPE)
#    endif()
endfunction()
