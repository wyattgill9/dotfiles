{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  
  imports = [
    ./hardware-configuration.nix
    outputs.nixosModules.ghostty
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

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };

    channel.enable = false;

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };


  networking.hostName = "nix";

  users.users = {

    wyattgill = {

      packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.nushell

    };

  };

  system.stateVersion = "23.05";
}
