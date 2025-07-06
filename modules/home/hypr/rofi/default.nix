{ config, pkgs, ... }:
{
  home.file.".config/rofi" = {
    source = ./.;
    recursive = true;
  };
}
