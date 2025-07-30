{ config, pkgs, inputs ? {}, ... }:

{
  imports = [
    ./hardware.nix
  ];

  system.stateVersion = "24.11";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  nixpkgs.config.allowUnfree = true;

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
  };

  time.timeZone = "America/Los_Angeles";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_ALL = "en_US.UTF-8";
    inputMethod.enable = true;
  };

  networking = {
    hostName = "ryu";
    networkmanager.enable = true;
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      nerd-fonts._0xproto
    ];
  };

  users.users.wyattgill = {
    isNormalUser = true;
    description = "wyattgill";
    extraGroups = [ "libvirtd" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "wyattgill" ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git
      curl
      gnumake cmake
      clang-tools
      llvmPackages_latest.clang
      llvmPackages_latest.libcxx
    ];
    variables.PATH = "${pkgs.clang-tools}/bin:$PATH";
  };
}
