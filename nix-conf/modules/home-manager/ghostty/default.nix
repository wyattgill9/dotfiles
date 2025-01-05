{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.programs.ghostty;
in {
  options.programs.ghostty = {
    enable = mkEnableOption "Ghostty terminal emulator";
    
    package = mkOption {
      type = types.package;
      default = inputs.ghostty.packages.${pkgs.system}.default;
      defaultText = literalExpression "inputs.ghostty.packages.${pkgs.system}.default";
      description = "The Ghostty package to use.";
    };

    systemWide = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to install Ghostty system-wide.";
    };

    defaultTerminal = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to set Ghostty as the default terminal.";
    };

    settings = mkOption {
      type = types.attrs;
      default = {};
      example = literalExpression ''
        {
          background-opacity = "0.9";
          font-family = "JetBrains Mono";
          font-size = "12";
          cursor-style = "block";
        }
      '';
      description = "Ghostty configuration settings.";
    };
  };

  config = mkIf cfg.enable {
    # System-wide installation if requested
    environment.systemPackages = mkIf cfg.systemWide [ cfg.package ];

    # Set as default terminal if requested
    environment.sessionVariables = mkIf cfg.defaultTerminal {
      TERMINAL = "ghostty";
    };

    # Ensure XDG directories exist
    environment.pathsToLink = [ "/share/ghostty" ];

    # Add system-wide configuration
    environment.etc."ghostty/config".text = 
      concatStrings (mapAttrsToList (name: value: "${name}=${toString value}\n") cfg.settings);
  };
}