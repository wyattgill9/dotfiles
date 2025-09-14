{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "tokyo_night_storm";

    settings = {
      window.opacity = 0.9;

      font = {
        normal = {
          family = "0xProto Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "0xProto Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "0xProto Nerd Font";
          style = "Italic";
        };
        size = 12.0;
      };
   };
  };
}
