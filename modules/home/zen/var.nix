{ config, pkgs, ... }:
{
 home.sessionVariables = {
    GTK_IM_MODULE = "";
        
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    
    # WAYLAND_DISPLAY = "$WAYLAND_DISPLAY";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };
}
