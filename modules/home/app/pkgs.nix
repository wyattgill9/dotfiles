{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zoom-us
    google-chrome
    xfce.thunar
  ];
}
