function(AddAsposeNatvis target)
	if (MSVC AND (EXISTS "${ASPOSE_ROOT}/misc/natvis/aspose_types.natvis"))
		target_sources(${target} PRIVATE "${ASPOSE_ROOT}/misc/natvis/aspose_types.natvis")
	endif()
endfunction()

