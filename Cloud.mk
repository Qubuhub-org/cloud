.PHONY: all build test clean

all:
	cmake -S . -B build
	cmake --build build -j

build:
	cmake -S . -B build
	cmake --build build -j

test:
	ctest --test-dir build --output-on-failure

clean:
	rm -rf build
