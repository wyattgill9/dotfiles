{ config, pkgs, ... }:
{
  imports = [ 
    ./hyprland.nix 
    ./hyprpaper.nix 
    ./hyprlock.nix 
    ./hyprsunset.nix 
    ./rofi/default.nix
    ./waybar.nix
  ];
}
