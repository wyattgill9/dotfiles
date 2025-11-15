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

    ./git.nix
    ./gh.nix

    ./foot.nix
    ./pkgs.nix
  ];
}
