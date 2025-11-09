{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "tokyo_night";

    settings = {
      window.opacity = 1;

      env = {
        TERM = "xterm-256color";
      };

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
