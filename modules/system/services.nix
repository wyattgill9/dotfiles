{ pkgs, ... }:

{
  services = {
    openssh = {
      enable = true;
      port = 22;
      
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "wyattgill" ];
      };
    };

    printing.enable = true;
   
    flatpak.enable = true;
    dbus.enable = true; 

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
