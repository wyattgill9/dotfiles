{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    
    appimage = {
      enable = true;
      binfmt = true;
    };

    # HYPRLAND
    hyprland.enable = true;
  };
}
