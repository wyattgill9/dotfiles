{
  description = "Wyatt Gill's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { 
        inherit system;
        
        config = {
           allowUnfree = true;
        };
     };
    in 
    {

    nixosConfigurations = {
      # Zen (desktop)
      zen = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; }; 
        modules = [
            ./hosts/zen/configuration.nix 
        ];
      };
    };

    homeConfigurations = {
      "wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs self; };
        modules = [ ./modules/home/home.nix ];
      };
    };
  };
}
