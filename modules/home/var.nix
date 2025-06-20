{ config, pkgs, ... }:
{
 home.sessionVariables = {
    # Unset GTK_IM_MODULE to let GTK auto-detect
    GTK_IM_MODULE = "";
        
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    
    WAYLAND_DISPLAY = "$WAYLAND_DISPLAY";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };
}
