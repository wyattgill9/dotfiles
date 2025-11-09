{
  inputs,
  config,
  ...
}:
{
  nix.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  system = {
    primaryUser = "wyattgill";
    stateVersion = 6;
  };

  users.users.${config.system.primaryUser} = {
    name = config.system.primaryUser;
    home = "/Users/${config.system.primaryUser}";
  };

  # why are we configuring home brew with global and not home manager?
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "ghostty"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.wyattgill = import ./home.nix;
  };
}
