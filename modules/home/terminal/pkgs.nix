{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    thefuck
    yazi
    jujutsu 
    fzf
    cmatrix
    tldr
    zoom-us
  ];
}
