{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./helix.nix
    ./zsh.nix
    ./cava.nix
    ./pkgs.nix
    ./nitch.nix
    ./starship.nix
    ./zoxide.nix
    ./btop.nix
    ./fastfetch/default.nix
    ./bat.nix
    ./gh.nix
    ./tmux.nix
    ./zed.nix
    ./ghostty.nix 
    ./alacritty.nix 
  ];
}
