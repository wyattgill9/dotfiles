{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    initContent = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"

      alias cd="z"

      autoload -U compinit
      compinit
      source <(jj util completion zsh)
    '';
  };

  programs.starship = {
    enable = true;
  };
}
