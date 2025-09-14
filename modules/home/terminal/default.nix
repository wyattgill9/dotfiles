{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./zsh.nix
    ./zoxide.nix
    ./btop.nix
    ./bat.nix
    ./gh.nix
    ./tmux.nix
    ./helix.nix 
    ./starship.nix
    ./alacritty.nix
    ./ghostty.nix
  ];
}
