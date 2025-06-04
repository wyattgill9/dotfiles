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

# $wallpaper_main = ~/nx/config/wallpapers/frieren.jpg
#
# $wallpaper_secondary = ~/nx/config/wallpapers/cat_lofi_cafe.jpg
#
# preload = $wallpaper_main
# preload = $wallpaper_secondary
#
# wallpaper = DP-3, $wallpaper_main
#
# wallpaper = HDMI-A-1, $wallpaper_secondary
#
# splash = false
#
# ipc = on
