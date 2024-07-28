find_package(fmt CONFIG REQUIRED)

add_library(lib
    STATIC
    lib.cpp
)

target_include_directories(lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(lib PRIVATE
    fmt::fmt-header-only
)
