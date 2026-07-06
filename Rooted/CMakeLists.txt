project(RootedEngine)

set(ENGINE_SOURCES
    src/Rooted.cpp
    include/rooted/Rooted.h
)

add_library(RootedEngine SHARED  ${ENGINE_SOURCES})

target_include_directories(RootedEngine PUBLIC include ${CMAKE_CURRENT_BINARY_DIR})

include(GenerateExportHeader)
generate_export_header(RootedEngine)