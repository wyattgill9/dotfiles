{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "tokyo_night_storm";

    settings = {
      window.opacity = 0.8;
    };
  };
}
