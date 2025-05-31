{ config, pkgs, inputs ? {}, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/system/default.nix 
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;
 
  # nix.settings = {
    # experimental-features = [ "nix-command" "flakes" ];
  # };

  # # Bootloader
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos";
  # networking.networkmanager.enable = true;

  # Locale and time
  # time.timeZone = "America/Los_Angeles";
  # i18n.defaultLocale = "en_US.UTF-8";
  # i18n.extraLocaleSettings = {
  #   LC_ALL = "en_US.UTF-8";
  # };

  # User setup
  users.users.wyattgill = {
    isNormalUser = true;
    description = "wyattgill";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Enable X11 and SDDM for Wayland login
  # services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;

  # # Pipewire audio stack
  # services.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  # Printing
  # services.printing.enable = true;

  # Flatpak & Portals
  # services.flatpak.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  # Programs
  # programs = {
  #   zsh.enable = true;
  #   steam.enable = true;
  #   nix-ld.enable = true;
  #   appimage = {
  #     enable = true;
  #     binfmt = true;
  #   };
  #   hyprland.enable = true;
  #   firefox.enable = true;
  # };

  # Fonts
  # fonts = {
  #   enableDefaultPackages = true;
  #   packages = with pkgs; [ nerd-fonts._0xproto ];
  #   fontconfig.enable = true;
  # };

  # System packages (organized)
  environment.systemPackages = with pkgs; [
    home-manager

    zsh nushell tmux wget

    neovim gcc clang gnumake rustc cargo

    grim dunst libnotify wl-clipboard
    waybar rofi-wayland hyprpaper hyprlock hyprsunset hyprland

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    gvfs

    google-chrome spotify 
    adwaita-icon-theme
    ghostty

    unzip
  ];

  system.stateVersion = "24.11";
}
