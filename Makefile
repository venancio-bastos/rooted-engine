GAME = KillOrDie
BUILD_PATH = build

ifeq ($(OS),Windows_NT)
	EXEC_PATH = ./$(BUILD_PATH)/bin/Debug/$(GAME).exe
	RM = rmdir /S /Q $(BUILD_PATH)
else
	EXEC_PATH = ./$(BUILD_PATH)/bin/$(GAME)
	RM = rm -rf $(BUILD_PATH)
endif

run: build
	$(EXEC_PATH)

build:
	cmake -B build
	cmake --build build

clean:
	$(RM)

.PHONY: run build clean