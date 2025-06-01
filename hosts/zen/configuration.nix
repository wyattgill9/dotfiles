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
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    home-manager

    zsh nushell tmux wget

    neovim gcc clang gnumake rustc cargo

    grim dunst libnotify wl-clipboard
    waybar rofi-wayland hyprpaper hyprlock hyprsunset hyprland

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    gvfs

    google-chrome spotify 
    adwaita-icon-theme
    ghostty

    unzip
  ];

  system.stateVersion = "24.11";
}
