{ config, ghostty, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "0xProto Nerd Font"; 
      window-decoration = false;
      gtk-titlebar = false;
      background-opacity = 0.8;
      theme = "tokyonight"; 
      # custom-shader-animation = true;
    };
    
    themes.tokyonight = {
      background = "#24283b";
      foreground = "#c0caf5";
      cursor-color = "#c0caf5";
      cursor-text = "#1d202f";
      palette = [
        "0=#1d202f"
        "1=#f7768e"
        "2=#9ece6a"
        "3=#e0af68"
        "4=#7aa2f7"
        "5=#bb9af7"
        "6=#7dcfff"
        "7=#a9b1d6"
        "8=#414868"
        "9=#f7768e"
        "10=#9ece6a"
        "11=#e0af68"
        "12=#7aa2f7"
        "13=#bb9af7"
        "14=#7dcfff"
        "15=#c0caf6"
      ];
      selection-background = "#364a82";
      selection-foreground = "#c0caf5";
    };
  };
}
