{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fzf
    tldr
    zoom-us

    obsidian

    cargo
  
    fastfetch

    # notify
    dunst
    libnotify
    wl-clipboard
    
    # icons
    adwaita-icon-theme
    
    # Xfce
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman         
    xfce.tumbler                
    
    google-chrome                
  ];
}
