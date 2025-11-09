{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd # Nix LSP
    nixfmt-tree

    ripgrep
    fzf
    lsd
    tldr
    fastfetch
  ];
}
