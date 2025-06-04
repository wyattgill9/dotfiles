{ config, pkgs, ... }:
{
  imports = [ 
    ./hyprland.nix 
    ./hyprpaper.nix 
    ./hyprlock.nix 
  ];
}
