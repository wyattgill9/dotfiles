{ pkgs, ... }:

{
  networking = {
    hostName = "zen"; 
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
