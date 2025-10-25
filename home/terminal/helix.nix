{ config, pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "tokyonight";
            
      editor = {
        idle-timeout = 50;
        true-color = true;
        mouse = false;   

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "block";
        };

        file-picker = {
          hidden = false;
        };
      }; 

      keys.normal = {
        # Git integration
        "C-g" = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw"];

        # Split the screen
        "C-p" = [":run-shell-command tmux split-window -h"];      
      };
    };

    languages = {
      language = [
        {
          name = "cpp";
          file-types = [ "cpp" "hpp" "c" "h" "cppm" ];
          indent = { tab-width = 4; unit = "    ";};
        }
      ];
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
