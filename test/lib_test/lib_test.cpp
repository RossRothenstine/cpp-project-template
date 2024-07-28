#include <catch2/catch_test_macros.hpp>

#include <lib.hpp>

TEST_CASE("lib::magic() returns 42") {
    REQUIRE(lib::magic() == 42);
}
