{ pkgs, ... }:

{
   services = {
      printing.enable = true;
      
      displayManager.sddm.enable = true; 
      xserver = {
         enable = true;
         # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };
   };
   systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
