{ config, pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./programs.nix
    ./steam.nix 
    ./bootloader.nix
    ./locale.nix
    ./hardware.nix
    ./network.nix
    ./services.nix 
    ./virt.nix 
  ];
}
