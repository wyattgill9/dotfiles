{ pkgs, ... }:
{
  services = {
    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "wyattgill" ];
      };
    };

    printing.enable = true;

    flatpak.enable = true;
    dbus.enable = true;

    blueman.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
  ];
}
