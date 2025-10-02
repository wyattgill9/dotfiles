{ inputs, pkgs, ... }:
{
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        
        preload = [
          "~/nx/wallpapers/nix-snowflake.png"
          # "~/nx/wallpapers/cat_lofi_cafe.jpg"
        ];
        
        wallpaper = [
          "DP-3,~/nx/wallpapers/nix-snowflake.png"
          "HDMI-A-1,~/nx/wallpapers/nix-snowflake.png"
        ];
      };
    };   
}
