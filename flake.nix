{
  description = "rainyzen's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix/24.11";
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      spicetify-nix,
      vicinae,
      ...
    }@inputs:
    let
      util = import ./lib.nix {
        defaultSystems = [
          "x86_64-linux"
          "aarch64-darwin"
        ];
      };
    in
    {
      nixosConfigurations.zen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/zen/configuration.nix ];
      };

      homeConfigurations."wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs self;
          system = "x86_64-linux";
        };
        modules = [
          ./hosts/zen/home.nix
          spicetify-nix.homeManagerModules.spicetify
          vicinae.homeManagerModules.spicetify
        ];
      };

      homeConfigurations."wyattgill@mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = {
          inherit inputs self;
          system = "aarch64-darwin";
        };
        modules = [
          ./hosts/macos/home.nix
        ];
      };
    }
    //
      # Devshells
      util.eachDefaultSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells = {
            cpp = import ./devshells/cpp.nix { inherit pkgs; };
            rust = import ./devshells/rust.nix { inherit pkgs; };
            haskell = import ./devshells/haskell.nix { inherit pkgs; };
            scheme = import ./devshells/scheme.nix { inherit pkgs; };
            python = import ./devshells/python.nix { inherit pkgs; };
          };
        }
      );
}
