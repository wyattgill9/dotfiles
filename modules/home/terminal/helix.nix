{ config, pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;

    package = inputs.helix.packages.${pkgs.system}.default;

    settings = {
      theme = "tokyonight";
      
      editor = {
        idle-timeout = 50;
        completion-timeout = 50;
        preview-completion-insert = true;
        true-color = true;
        undercurl = true;
        auto-format = true;
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
