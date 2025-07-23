{ config, pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;

    package = inputs.helix.packages.${pkgs.system}.default;

    settings = {
      theme = "tokyonight";
      
      editor = {
        idle-timeout = 50;
        true-color = true;
        mouse = false;   

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "block";
        };

        file-picker = {
          hidden = false;
        };
      }; 
    };
  };
}
