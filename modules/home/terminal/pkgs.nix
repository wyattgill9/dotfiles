{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    thefuck
    yazi
    jujutsu 
    fzf
  
    zoom-us
  ];
}
