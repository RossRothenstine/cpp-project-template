set(HEADERS
    include/lib/lib.hpp
)

set(SOURCES
    src/lib.cpp
)

function (add_sources_to_target target)
    target_sources(${target} PRIVATE ${SOURCES})
    target_sources(${target} PUBLIC ${HEADERS})
endfunction()
