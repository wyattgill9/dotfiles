{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    anki-bin
  ];
}
