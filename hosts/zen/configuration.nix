{ config, pkgs, inputs ? {}, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/system/default.nix 
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.wyattgill = {
    isNormalUser = true;
    description = "wyattgill";
    extraGroups = [ "libvirtd" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # nix.settings.auto-optimise-store = true;
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };


  environment.systemPackages = with pkgs; [
    home-manager

    grim 
    dunst 
    libnotify 
    wl-clipboard
   
    waybar 
    rofi-wayland 
    
    adwaita-icon-theme
    ghostty

    unzip
  ];

  system.stateVersion = "24.11";
}
