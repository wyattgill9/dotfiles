{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
      }
      {
        name = "rust";
        auto-format = true;
      }
      {
        name = "toml";
        auto-format = true;
         
      }
      {
        name = "cpp";
        auto-format = true;
      } 
      {
        name = "python";
        auto-format = true;
      } 
      {
        name = "c";
        auto-format = true;
      } 
    ];
  };
}
