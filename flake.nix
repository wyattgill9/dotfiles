{
  description = "RaiinyZen's NixOS flake";
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
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix/24.11";
    helix.url = "github:helix-editor/helix";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, hyprland,
               spicetify-nix, helix, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    mkSystem = attrs: nixpkgs.lib.nixosSystem (attrs // {
      inherit system;
      specialArgs = { inherit inputs system; };
    });

  in {

    nixosConfigurations = {
      zen = mkSystem {
        modules = [ ./hosts/zen/configuration.nix ];
      };

      ryu = mkSystem {
        modules = [ ./hosts/ryu/configuration.nix ];
      };
    };

    homeConfigurations = {
      "wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs self; };
        modules = [
          ./modules/home/home.nix
          spicetify-nix.homeManagerModules.spicetify
        ];
      };
    };
  };
}

