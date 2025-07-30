{
  description = "RaiinyZen's NixOS flake";

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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix/24.11"; 
     
    ghostty.url = "github:ghostty-org/ghostty";

    helix.url = "github:helix-editor/helix";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, hyprland, spicetify-nix, ghostty, helix, ... }@inputs:
    let
      system = "x86_64-linux";

      ghosttyPkg = inputs.ghostty.packages.${system}.default;

      pkgs = import nixpkgs { 
        inherit system;
              
        config = {
           allowUnfree = true;
        };
     };
    in 
    {

    nixosConfigurations = {
      # Zen (Desktop)
      zen = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; }; 
        modules = [
            ./hosts/zen/configuration.nix 
        ];
      };

      # Ryu (Server)
      ryu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          ./hosts/ryu/configuration.nix
        ];
      };    
    };

    homeConfigurations = {
      "wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;      
        extraSpecialArgs = { inherit inputs self; };
        modules = [ 
            ./modules/home/home.nix 
            inputs.spicetify-nix.homeManagerModules.spicetify
            ({ pkgs, ... }: {
              programs.ghostty.package = ghosttyPkg;
            })
        ];
      };
    };
  };
}
