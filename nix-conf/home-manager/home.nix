# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
 
  imports = [
    ./modules/home-manager/nvim.nix
    ./modules/home-manager/starship.nix
    ./modules/home-manager/ghostty
    ./modules/home-manager/nushell.nix
    ./modules/home-manager/fastfetch.nix
    /modules/home-manager/vscodium.nix
  ];

  nixpkgs = {
    overlays = [

      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "wyattgill";
    homeDirectory = "/home/wyattgill";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
