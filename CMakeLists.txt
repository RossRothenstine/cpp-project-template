cmake_minimum_required(VERSION 3.22)

project(
    "CppProjectStarter"
    VERSION 1.0.0
    LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)

option(ENABLE_WARNINGS "Enable to add warnings to a target." ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable to treat warnings as errors." ON)
option(ENABLE_LINTING "Enable to add linting to a target." ON)
option(ENABLE_CLANG_TIDY "Enable to add clang tidy." ON)
option(ENABLE_CPPCHECK "Enable to add cppcheck." ON)
option(ENABLE_IWYU "Enable to add include what you use." ON)
option(ENABLE_CLANG_FORMAT "Enable to add clang-format." ON)
option(ENABLE_TESTS "Enable to build tests." ON)

include(Docs)
include(Warnings)
include(Tools)
include(ConfigSafeGuards)

add_clang_format_target()

# vcpkg setup
set (VCPKG_DIR ${CMAKE_SOURCE_DIR}/external/vcpkg)
include(${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake)

add_subdirectory(src)

if (ENABLE_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()

set(TARGETS lib app)
foreach (target ${TARGETS})
    add_linter_tool_to_target(
        TARGET ${target}
        ENABLE ${ENABLE_LINTING}
        ENABLE_CPPCHECK ${ENABLE_CPPCHECK}
        ENABLE_IWYU ${ENABLE_IWYU}
        ENABLE_CLANG_TIDY ${ENABLE_CLANG_TIDY}
    )

    target_set_warnings(TARGET ${target}
        ENABLE ${ENABLE_WARNINGS}
        AS_ERRORS ${ENABLE_WARNINGS_AS_ERRORS})
endforeach()

add_docs_target(docs)
