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
    ./ghostty
    ./helix.nix 
    ./starship.nix
  ];
}
