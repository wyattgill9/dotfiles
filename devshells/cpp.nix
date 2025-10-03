{ pkgs }:
let
  llvm = pkgs.llvmPackages_21;
in
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "cpp-dev-env";
  version = "1.0";

  nativeBuildInputs = with pkgs; [
    llvm.clang
    llvm.lldb

    clang-tools

    cmake
    ninja

    pkg-config
    openssl.dev
  ];

  shellHook = ''
    export CC=${llvm.clang}/bin/clang
    export CXX=${llvm.clang}/bin/clang++
    export CMAKE_OSX_SYSROOT=""
    export CMAKE_OSX_DEPLOYMENT_TARGET=""

    echo "  clang:  $(clang --version | head -n1 | cut -d' ' -f3)"
    echo "  CMake:  $(cmake --version | head -n1 | cut -d' ' -f3)"
    echo "  ninja:  $(ninja --version)"
  '';

  meta = with pkgs.lib; {
    description = "C++ development environment with Clang and LLVM 21";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
