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
      # General  
      cd  = "z";
      c   = "clear";
      cat = "bat"; 
      ls  = "lsd";

      # Dev
      cmk     = "cmake -S . -B build -G Ninja && cmake --build build";
      cpp-dev = "nix develop ~/nx#cpp -c zsh";
    };
  };
}
