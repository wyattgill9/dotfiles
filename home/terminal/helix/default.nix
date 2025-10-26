{ ... }:
{
  programs.helix.enable = true;
  programs.lazygit.enable = true;

  home.file.".config/helix" = {
    source = ./.;
    recursive = true;
  };
}
