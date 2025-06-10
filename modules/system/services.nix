{ pkgs, ... }:

{
  services = {
    printing.enable = true;
    
    blueman.enable = true;
    
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  
  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
  ];

  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
