{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    outputFormat = "color";  
  };
}
