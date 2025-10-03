{ pkgs }:
let
  llvm = pkgs.llvmPackages_21;
in
pkgs.mkShell {
  name = "cpp-dev-env";
  
  stdenv = llvm.libcxxStdenv;
  
  buildInputs = with pkgs; [
    llvm.clang
    llvm.lldb

    clang-tools

    cmake
    ninja

    pkg-config
    openssl.dev
  ];
  
  shellHook = ''
    echo "  Clang:  $(clang --version | head -n1 | cut -d' ' -f3)"
    echo "  CMake:  $(cmake --version | head -n1 | cut -d' ' -f3)"
    echo "  Ninja:  $(ninja --version)"
  '';
}
