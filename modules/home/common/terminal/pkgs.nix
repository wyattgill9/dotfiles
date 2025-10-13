{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    ripgrep
    fzf
    tldr
    fastfetch
    lsd
  ];
}
