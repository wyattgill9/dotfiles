{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    yazi
    fzf
    tldr
    zoom-us
    clang cmake lldb gnumake

    neovim
    
    # notify
    dunst
    libnotify
    wl-clipboard
    
    # rofi 
    rofi-wayland 
    
    # icons
    adwaita-icon-theme
    
    # Xfce
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman         
    xfce.tumbler                
    google-chrome                
    
    # SDL 
    SDL2 
  ];
}
