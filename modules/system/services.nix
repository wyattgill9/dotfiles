{ pkgs, ... }:

{
   services = {
      printing.enable = true;
      
      xserver = {
         enable = true;
         extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };
      printing.enable = true;
   }
   systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
