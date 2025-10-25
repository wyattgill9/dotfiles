{ pkgs }:
let
  llvm = if pkgs.stdenv.isLinux 
         then pkgs.llvmPackages_21 
         else pkgs.llvmPackages_latest;
  
  stdenv = llvm.stdenv;
in
stdenv.mkDerivation {
  pname = "cpp-dev-env";
  version = "1.0";
  
  nativeBuildInputs = with pkgs; [
    cmake
    ninja
    pkg-config
    llvm.clang-tools
    llvm.bintools
    gdb
    scc
  ];
  
  buildInputs = [
    llvm.libcxx
    pkgs.openssl.dev

    pkgs.abseil-cpp # Containers
    pkgs.boost      # Boost
  ];
  
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ 
    llvm.libcxx 
    pkgs.openssl
    pkgs.abseil-cpp
    pkgs.boost
  ];
  
  shellHook = pkgs.lib.optionalString stdenv.isLinux ''
    export CC_LD=lld
    export CXX_LD=lld
  '' + ''
    export CC=${llvm.clang}/bin/clang
    export CXX=${llvm.clang}/bin/clang++
    
    echo "Development environment ready:"
    echo "  Compiler: $(clang++ --version | head -n1)"
    echo "  CMake:    $(cmake --version | head -n1 | cut -d' ' -f3)"
    echo "  Ninja:    $(ninja --version)"
    echo "  CC:       $CC"
    echo "  CXX:      $CXX"
  '';
  
  meta = with pkgs.lib; {
    description = "C++ development environment with LLVM/Clang and libc++";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
