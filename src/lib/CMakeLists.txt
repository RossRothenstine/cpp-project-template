find_package(fmt CONFIG REQUIRED)

include(Sources.cmake)

add_library(lib
    STATIC
)

add_sources_to_target(lib)

target_include_directories(lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_include_directories(lib PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include/lib
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

target_link_libraries(lib PRIVATE
    fmt::fmt-header-only
)
