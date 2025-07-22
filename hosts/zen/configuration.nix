{ config, pkgs, inputs ? {}, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/system
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.wyattgill = {
    isNormalUser = true;
    description = "wyattgill";
    extraGroups = [ "libvirtd" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  environment.systemPackages = with pkgs; [
    home-manager
    
    git
    clang-tools
    llvmPackages_latest.clang
    llvmPackages_latest.libcxx
    llvmPackages_latest.lldb
    
    foot
    curl
  ];
  
  environment.variables.PATH = "${pkgs.clang-tools}/bin:$PATH";
  
  system.stateVersion = "24.11";
}
