#include "lib.hpp"

#include <iostream>
#include <fmt/format.h>

namespace lib {
    void hello(std::string_view name) {
        fmt::print("Hello, {}!\n", name);
    }
    int magic() {
        return 42;
    }
}
