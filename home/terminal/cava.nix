{ config, pkgs, ... }:
{
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
}
