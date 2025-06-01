{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    
    appimage = {
      enable = true;
      binfmt = true;
    };
    
    # obs-studio = {
    #   enable = true;
    #   plugins = with pkgs.obs-studio-plugins; [
    #     wlrobs
    #     obs-backgroundremoval
    #     obs-pipewire-audio-capture
    #   ];
    # };

    # HYPRLAND
    hyprland.enable = true;
  };
}
