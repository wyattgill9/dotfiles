{ pkgs, ... }:

{
   services = {
      printing.enable = true;

      displayManager.sddm = {
         enable = true;
         wayland.enable = true;
      };
   };
   systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
