{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./helix.nix
    ./zsh.nix
    ./cava.nix
    ./pkgs.nix
    ./starship.nix
    ./zoxide.nix
    ./btop.nix
    ./fastfetch/default.nix
    ./bat.nix
    ./gh.nix
    ./tmux.nix
    ./ghostty.nix 
    ./alacritty.nix 
  ];
}
