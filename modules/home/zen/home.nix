{ config, pkgs, ... }:
{
  imports = [
    ../common/terminal
    ./wm
    ./app
    ./var.nix
    ./pkgs.nix 
  ];
 
  nixpkgs.config.allowUnfree = true;
  home.username = "wyattgill";
  home.homeDirectory = "/home/wyattgill";
  home.stateVersion = "25.11";
  
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
