{ config, pkgs, ... }:
let
  homePath = ../../modules/home;
in
{
  imports = [
    (homePath + /common.nix)
  ];
 
  home.username = "wyattgill";
  home.homeDirectory = "/Users/wyattgill";
  home.stateVersion = "25.05";
  
  programs.home-manager.enable = true;
}
