{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
      
      alias vim="nvim"

      autoload -U compinit
      compinit
    '';

    shellAliases = {
       cd = "z";
       c = "clear";
       cat = "bat"; 
    };
  };
}
