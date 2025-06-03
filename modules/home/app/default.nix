{ config, pkgs, ... }:
{
  imports = [
    ./discord.nix
    ./email.nix 
  ];
}
