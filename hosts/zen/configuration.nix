{ config, pkgs, inputs ? {}, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/system/zen
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.wyattgill = {
    isNormalUser = true;
    description = "wyattgill";
    extraGroups = [ "libvirtd" "networkmanager" "wheel" "kvm" ];
    shell = pkgs.zsh;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

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
  
  system.stateVersion = "24.11";
}
