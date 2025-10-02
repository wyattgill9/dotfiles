{ pkgs }:
let
  llvm = pkgs.llvmPackages_19;
in
pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
  packages = with pkgs; [
    llvm.clang
    llvm.lldb
    llvm.libcxx  # Add this
    
    clang-tools
    cmake
    ninja
    pkg-config
    openssl.dev
  ];
  
  shellHook = ''
    export CC=${llvm.clang}/bin/clang
    export CXX=${llvm.clang}/bin/clang++
    export CPLUS_INCLUDE_PATH="${llvm.libcxx.dev}/include/c++/v1:$CPLUS_INCLUDE_PATH"
        
    echo "  Clang:  $(${llvm.clang}/bin/clang --version | head -n1 | cut -d' ' -f3)"
    echo "  CMake:  $(${pkgs.cmake}/bin/cmake --version | head -n1 | cut -d' ' -f3)"
    echo "  Ninja:  $(${pkgs.ninja}/bin/ninja --version)"
  '';
}
