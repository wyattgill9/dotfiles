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

  environment.systemPackages = with pkgs; [
    home-manager
    zsh
    cargo 

    grim 
    dunst 
    libnotify 
    wl-clipboard
   
    waybar 
    rofi-wayland 
    
    # hyprpaper 
    # hyprlock 
    # hyprsunset 
    # hyprland
    
    adwaita-icon-theme
    ghostty

    unzip
  ];

  system.stateVersion = "24.11";
}
