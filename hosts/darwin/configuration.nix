{ inputs, pkgs, config, ... }:

{
  nix.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  system = {
    primaryUser  = "wyattgill";
    stateVersion = 6;
  };

  users.users.${config.system.primaryUser} = {
    name = config.system.primaryUser;
    home = "/Users/${config.system.primaryUser}";
  };

  home-manager = {
    useGlobalPkgs = true;
    # useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.wyattgill = import ../../modules/home/darwin/home.nix;
  };
}
