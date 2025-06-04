{ inputs, pkgs, ... }:
{
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        
        preload = [
          "~/nx/wallpapers/frieren.jpg"
          "~/nx/wallpapers/cat_lofi_cafe.jpg"
        ];
        
        wallpaper = [
          "DP-3,~/nx/wallpapers/frieren.jpg"
          "HDMI-A-1,~/nx/wallpapers/cat_lofi_cafe.jpg"
        ];
      };
    };   
}
