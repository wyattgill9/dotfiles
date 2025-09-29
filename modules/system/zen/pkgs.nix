{ pkgs, ...} :
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    vim

    cmake

    git

    clang-tools # clangd

    # core C++
    openssl.dev
    ninja
    llvmPackages_latest.lldb
    llvmPackages_latest.clang
    vcpkg

    perf      
    foot
    curl
  ];
 
  environment.variables.PATH = "${pkgs.clang-tools}/bin:$PATH";
}
