{
  description = "rainyzen's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # flake-utils.url = "github:numtide/flake-utils";
    flake-utils = ./lib.nix;
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix/24.11";
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    flake-utils,
    spicetify-nix,
    vicinae,
    ...
  }@inputs:
    {
      nixosConfigurations.zen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/zen/configuration.nix ];
      };

      homeConfigurations."wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages.${systemLinux};
        extraSpecialArgs = { inherit inputs self; };
        modules = [
          ./hosts/zen/home.nix
          spicetify-nix.homeManagerModules.spicetify
          vicinae.homeManagerModules.spicetify
        ];
      };

      homeConfigurations."wyattgill@mac" = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages.${systemDarwin};
        extraSpecialArgs = { inherit inputs self; };
        modules = [
          ./hosts/macos/home.nix
        ];
      };
    } //

    # Devshells  
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells = {
          cpp      = import ./devshells/cpp.nix     { inherit pkgs; };
          python   = import ./devshells/python.nix  { inherit pkgs; };
          haskell  = import ./devshells/haskell.nix { inherit pkgs; };
        };
      }
    );
} 
