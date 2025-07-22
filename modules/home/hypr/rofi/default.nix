{ config, pkgs, ... }:
{
  home.file.".config/rofi" = {
    source = ./.;
    recursive = true;
  };
  home.packages = with pkgs; [
    rofi-wayland      
  ];  
}
