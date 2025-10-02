{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    baseIndex = 1;
    
    plugins = [
      pkgs.tmuxPlugins.yank
      pkgs.tmuxPlugins.tokyo-night-tmux
    ];

    extraConfig = '' 
        set -g allow-passthrough all 
        set -ga update-environment TERM 
        set -ga update-environment TERM_PROGRAM
	      set -g default-terminal "tmux-256color"    
        set -sg escape-time 0
    '';
  };
}
