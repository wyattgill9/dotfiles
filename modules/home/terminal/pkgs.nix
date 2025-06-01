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

    clang gnumake

    neovim

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman         
    xfce.tumbler                
    google-chrome                
    spotify                       
  ];
}
