{ config, pkgs, ... }:
{
  imports = [
    ./hypr
    ./terminal
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
