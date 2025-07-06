{ config, pkgs, ... }:
{
  programs.neovide = {
    enable = true;
    settings = {
      theme = "auto";        
    };  
  };
}
