{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    hello
    ripgrep
    fastfetch
    thefuck
    zoxide
    yazi
    starship
    jujutsu 
    fzf
  
    zoom-us
  ];
}
