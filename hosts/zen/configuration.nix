{ config, pkgs, inputs ? {}, ... }:

{
  imports = [
    ./hardware.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locale and time
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };

  # User setup
  users.users.wyattgill = {
    isNormalUser = true;
    description = "wyattgill";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Home Manager integration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.wyattgill = import ../../home/home.nix;
    backupFileExtension = "backup";
  };

  # Enable X11 and SDDM for Wayland login
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  # Pipewire audio stack
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # Flatpak & Portals
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Programs
  programs = {
    zsh.enable = true;
    steam.enable = true;
    nix-ld.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    hyprland.enable = true;
    firefox.enable = true;
  };

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ nerd-fonts._0xproto ];
    fontconfig.enable = true;
  };

  # System packages (organized)
  environment.systemPackages = with pkgs; [
    #  --- Core ---
    home-manager

    # Shells & Tools
    zsh nushell tmux wget
    jujutsu

    # Dev
    neovim gcc clang gnumake rustc cargo

    # GUI / Wayland
    grim dunst libnotify wl-clipboard
    waybar rofi hyprpaper hyprlock hyprsunset hyprland

    # XFCE tools
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    gvfs

    # Misc GUI
    ghostty google-chrome spotify discord vesktop adwaita-icon-theme

    # Version control & helpers
    gh unzip btop
  ];

  # System state version
  system.stateVersion = "24.11";
}
