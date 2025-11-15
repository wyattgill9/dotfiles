{ lib, ... }:
{
  imports = [
    ../../home/profiles/macos.nix
  ];

  home.username = "wyattgill";
  home.homeDirectory = "/Users/wyattgill";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # targets.darwin.copyApps.enable = false;

  # fonts.fontconfig.enable = false;
  # home.activation.installFonts = lib.mkForce "";
}
