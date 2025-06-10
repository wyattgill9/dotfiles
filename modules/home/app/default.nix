{ config, pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./email.nix 
    ./spotify.nix
    ./obs.nix 
  ];
}
