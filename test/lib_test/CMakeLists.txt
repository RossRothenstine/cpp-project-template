find_package(Catch2 3 REQUIRED)

add_executable(lib_test
    lib_test.cpp
)

target_link_libraries(lib_test PRIVATE
    lib
    Catch2::Catch2WithMain
)
