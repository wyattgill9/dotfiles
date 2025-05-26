{ config, pkgs, ... }:
{
  imports = [
    # ./steam.nix
    ./minecraft.nix
  ];
}
