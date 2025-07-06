{ config, pkgs, ... }:
{
  imports = [
    ./fastfetch/default.nix
    ./nvim/neovide.nix 
    ./git.nix
    ./helix.nix
    ./zsh.nix
    ./cava.nix
    ./starship.nix
    ./zoxide.nix
    ./btop.nix
    ./bat.nix
    ./gh.nix
    ./tmux.nix
    ./ghostty.nix 
    ./alacritty.nix 
  ];
}
