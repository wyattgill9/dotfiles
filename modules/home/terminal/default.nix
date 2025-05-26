{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./helix.nix
    ./zsh.nix
    ./cava.nix
    ./pkgs.nix
    ./nitch.nix
  ];
}
