man git-clone https://github.com/Qubuhub-org/cloud.git
cd cloud

cmake -S . -B build
cmake --build build -j
ctest --test-dir build --output-on-failure
