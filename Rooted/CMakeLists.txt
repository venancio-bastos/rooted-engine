project(RootedEngine)

set(ENGINE_SOURCES
    src/Rooted.cpp
    include/rooted/Rooted.h
)

add_library(RootedEngine SHARED  ${ENGINE_SOURCES})

target_include_directories(RootedEngine PUBLIC include)

target_compile_definitions(RootedEngine PRIVATE ROOTED_BUILD_DLL)