{ config, pkgs, ... }:
{
  imports = [
    # ./steam.nix
    ./discord.nix
  ];
}
