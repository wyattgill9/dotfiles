{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "wyattgill";
  home.homeDirectory = "/home/wyattgill";
  home.stateVersion = "25.11";

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

  programs.git = {
    enable = true;
    userName = "Wyatt Gill";
    userEmail = "101477459+wyattgill9@users.noreply.github.com";
  };

  programs.starship = {
    enable = true;
  };
  
  programs.cava = {
    enable = true;
    
    settings = {
      general = {
        framerate = 240;
        autosens = 4;
        overshoot = 0;
        sensitivity = 50;
        bars = 0;
        bar_width = 6.0;
        bar_spacing = 1.0;
      };
      
      smoothing = {
        monstercat = 0;
        waves = 0;
        gravity = 100;
      };
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
      }
    ];
  };

  home.packages = with pkgs; [
    hello
    ripgrep
    fastfetch
    thefuck
    zoxide
    yazi
    starship
    jujutsu 
    fzf
  
    zoom-us
  ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
}
