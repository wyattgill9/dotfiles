{ inputs, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = "false";
      preload = [
        "/home/wyattgill/nx/wallpapers/frieren.jpg"
        "/home/wyattgill/nx/wallpapers/cat_lofi_cafe.jpg"
      ];
      wallpaper = [
        "DP-3, /home/wyattgill/nx/config/wallpapers/frieren.jpg"
        "HDMI-A-1, /home/wyattgill/nx/config/wallpapers/cat_lofi_cafe.jpg"
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
