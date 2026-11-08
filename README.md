# Rooted Engine

A C++ game engine I am building to learn how engines are structured and how they work underneath. The goal is a reusable engine library that can later be used in other projects.

## Status

Early stage. The repository currently contains:

- `Rooted/`: the engine, built as a shared library (`RootedEngine`). It exposes one function, `PrintMessage`, which prints a string.
- `game/`: a sample program, `KillOrDie`, that links against the engine and prints a message.

There is no window, rendering, input, main loop or entity system yet.

## Requirements

- CMake 3.15 or newer
- A C++20 compiler (GCC, Clang or MSVC)
- On Windows, `make` is optional; the Makefile uses `rmdir` and the `Debug` output path for Windows builds

## Build

With CMake:

```bash
cmake -B build
cmake --build build
./build/bin/KillOrDie
```

With the Makefile:

```bash
make          # configures and builds into build/
make run      # builds and runs KillOrDie
make clean    # removes build/
```

The Makefile's Windows branch expects the executable at `build/bin/Debug/KillOrDie.exe`.

## Project layout

```
CMakeLists.txt             # top level: adds Rooted and game
Rooted/                    # engine library
├── CMakeLists.txt
├── include/rooted/Rooted.h
└── src/Rooted.cpp
game/                      # sample game
├── CMakeLists.txt
└── src/main.cpp
Makefile                   # convenience wrapper around CMake
```

The engine generates an export header (`rootedengine_export.h`) with `generate_export_header`, so the `ROOTEDENGINE_EXPORT` macro works on both Windows DLLs and Unix shared libraries.

## Known issues

- **Linux configuration fails.** The top-level `CMakeLists.txt` calls `add_subdirectory("rooted")`, but the folder is named `Rooted`. Windows and macOS file systems ignore case, so it works there. On Linux, CMake stops with `add_subdirectory given source "rooted" which is not an existing directory`. Tested on Linux with GCC 13 and CMake 3.28: after changing the call to `add_subdirectory("Rooted")`, the library and the sample build and `KillOrDie` runs.


## To do

- [ ] Make the folder name and the CMake call match (`Rooted` or `rooted`), and commit the rename with `git mv`.
- [ ] Check that the build passes on Linux after the change.
- [ ] Open a window and run a main loop.
- [ ] Add input handling.
- [ ] Add a basic rendering layer.
- [ ] Add a simple entity system.

## License

See [LICENSE](LICENSE).
