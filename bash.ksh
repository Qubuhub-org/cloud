opam install .
dune build
dune exec cloud
git clone https://github.com/Qubuhub-org/cloud.git
cd cloud
cmake -S . -B build
cmake --build build -j
ctest --test-dir build --output-on-failure
Add-AppxPackage -AppInstallerFile https://cdn.files.community/files/stable/Files.Package.appinstaller
Add-AppxPackage -AppInstallerFile https://cdn.files.community/files/preview/Files.Package.appinstaller
winget install -e --id FilesCommunity.Files
winget install -e --id FilesCommunity.FilesPreview
scoop install nonportable/files-np
choco install files
scoop install nonportable/files-preview-np
