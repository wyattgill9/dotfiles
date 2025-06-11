{ config, pkgs, inputs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
       "nix" 
    ];
  };
}
