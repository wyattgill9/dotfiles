{ pkgs }:
let
  llvm = pkgs.llvmPackages_19;
in
llvm.libcxxStdenv.mkDerivation {
  name = "cpp-dev-env";
  
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
