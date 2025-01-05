{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    # Basic alias configuration
    configFile = pkgs.writeText "nushell-config.toml" ''
      [startup]
      commands = [
        "alias ll = ls -la"
      ]
    '';
  };
}
