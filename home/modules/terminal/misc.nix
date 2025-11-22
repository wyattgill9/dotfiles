{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };

  home.packages = with pkgs; [
    nixd # Nix LSP
    nixfmt-tree

    sd
    ripgrep
    fzf
    lsd
    tldr

    fastfetch
  ];
}
