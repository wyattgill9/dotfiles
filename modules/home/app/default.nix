{ config, pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./spotify.nix
    ./zen.nix
    ./minecraft.nix
  ];
}
