{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fzf
    tldr
    zoom-us

    fastfetch

    # notify
    dunst
    libnotify
    wl-clipboard
    
    # icons
    adwaita-icon-theme
    
    xfce.thunar
    
    google-chrome                
  ];
}
