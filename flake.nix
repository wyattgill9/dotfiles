{
  description = "RaiinyZen's NixOS & Darwin flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix/24.11";
  };
  
  outputs = { self, nixpkgs, darwin, home-manager, zen-browser, spicetify-nix, ... }@inputs:
  let
    system-linux = "x86_64-linux";
    pkgs-linux = import nixpkgs {
      system = system-linux;
      config = { allowUnfree = true; };
    };
    
    system-darwin = "aarch64-darwin";
    pkgs-darwin = import nixpkgs {
      system = system-darwin;
      config = { allowUnfree = true; };
    };
    
    mkSystem = attrs: nixpkgs.lib.nixosSystem (attrs // {
      system = system-linux;
      specialArgs = { inherit inputs; system = system-linux; };
    });
  in {

    nixosConfigurations = {
      zen = mkSystem {
        modules = [ ./hosts/zen/configuration.nix ];
      };
    };
    
    darwinConfigurations = {
      "Wyatts-MacBook-Air" = darwin.lib.darwinSystem {
        system = system-darwin;
        specialArgs = { inherit inputs; };
        modules = [


          ./hosts/darwin/configuration.nix
        ];
      };
    };
    
    homeConfigurations = {
      "wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs-linux;
        extraSpecialArgs = { inherit inputs self; };
        modules = [
          ./modules/home/zen/home.nix
          spicetify-nix.homeManagerModules.spicetify
        ];
      };
    };
  };
}
