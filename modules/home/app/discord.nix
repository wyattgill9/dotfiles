{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    discord-canary
    vesktop
  ];
}
