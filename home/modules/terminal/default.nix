{ ... }:
{
  imports = [
    ./ghostty
    ./tmux.nix
    ./helix

    ./zsh.nix

    ./starship.nix
    ./zoxide.nix
    ./btop.nix
    ./bat.nix

    ./vcs.nix

    ./foot.nix
    ./pkgs.nix
  ];
}
