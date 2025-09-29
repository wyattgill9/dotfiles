{ config, pkgs, inputs, ... }:
{
  programs.anki = {
    enable   = true;
    language = "en_US";    
  };
}
