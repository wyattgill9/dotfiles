{ config, pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./programs.nix
    ./steam.nix 
    ./bootloader.nix
    ./system.nix
    ./hardware.nix
    ./network.nix
    ./services.nix 
  ];
}
