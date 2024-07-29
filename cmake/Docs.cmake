
function (add_docs_target)
    find_package(Doxygen)
    if (NOT ${DOXYGEN_FOUND})
        message("Doxygen not found, skipping docs generation")
        return()
    endif()

    set(DOXYGEN_DOCS_DIR ${CMAKE_SOURCE_DIR}/docs)
    set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    configure_file(${DOXYGEN_DOCS_DIR}/Doxyfile.in ${DOXYGEN_OUT} @ONLY)

    add_custom_target(
        docs ALL
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM
    )
endfunction()
