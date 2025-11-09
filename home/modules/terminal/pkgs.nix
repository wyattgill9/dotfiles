{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd  # Nix LSP
    # steel # Scheme my beloved
    
    ripgrep
    fzf
    lsd
    tldr
    fastfetch
  ];
}
