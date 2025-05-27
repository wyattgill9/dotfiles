{ config, pkgs, ... }:
{
  imports = [
    ./terminal/default.nix
    ./browser/default.nix
    ./games/default.nix
    ./app/default.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.username = "wyattgill";
  home.homeDirectory = "/home/wyattgill";
  home.stateVersion = "25.11";
  
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
