{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd # Nix LSP
    steel

    
    neovim
    
    just
    ripgrep
    fzf
    lsd
    tldr
    fastfetch
  ];
}
