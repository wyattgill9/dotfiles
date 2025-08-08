{ pkgs, ...} :
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager

    gnumake cmake

    git

    clang-tools # clangd
    llvmPackages_latest.lldb
    llvmPackages_latest.clang
    llvmPackages_latest.libcxx
    linuxPackages_latest.perf      

    perl # Flamegraph

    foot
    curl
  ];
 
  environment.variables.PATH = "${pkgs.clang-tools}/bin:$PATH";
}
