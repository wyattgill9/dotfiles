{ pkgs, inputs, ... }:
{
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    
    appimage = {
      enable = true;
      binfmt = true;
    };

    # HYPRLAND
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    }; 
  };
}
