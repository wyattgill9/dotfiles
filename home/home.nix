{ config, pkgs, ... }:

{
  home.username = "wyattgill";
  home.homeDirectory = "/home/wyattgill";
  home.stateVersion = "25.11";

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.git = {
    enable = true;
    userName = "wyattgill9";
    userEmail = "101477459+wyattgill9@users.noreply.github.com";
  };

  programs.starship = {
    enable = true;
  };

  home.packages = with pkgs; [
    hello
    ripgrep
    fastfetch
    thefuck
    zoxide
    yazi 
  ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
