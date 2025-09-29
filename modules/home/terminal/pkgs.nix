{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fzf
    tldr
    fastfetch
    lsd
  ];
}
