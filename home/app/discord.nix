{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord-canary
    discord
  ];
}
