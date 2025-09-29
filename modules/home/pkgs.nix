{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    dunst
    libnotify
    wl-clipboard
    mplayer     
    adwaita-icon-theme  
  ];
}
