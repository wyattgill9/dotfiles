{ pkgs, input, ...}:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  time.timeZone = "America/Los_Angeles";
  
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        rime-data
        fcitx5-rime
        fcitx5-gtk
      ];
    };
    extraLocaleSettings = {
      LC_ALL = "en_US.UTF-8";
    };
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ nerd-fonts._0xproto ];
    fontconfig.enable = true;
  };
}
