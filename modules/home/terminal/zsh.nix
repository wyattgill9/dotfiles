{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initContent = ''
      eval "$(starship init zsh)"

      # PROMPT=$'\n'"%n@%m:%~ λ "

      eval "$(zoxide init zsh)"
      
      autoload -U compinit
      compinit
    '';

    shellAliases = {
       cd = "z";
       c = "clear";
       cat = "bat"; 
       ls = "lsd";
    };
  };
}
