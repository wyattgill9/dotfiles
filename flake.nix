{
  description = "Wyatt Gill's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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

      ryu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [ 
            ./hosts/ryu/configuration.nix 
        ];
      };
    };

    homeConfigurations = {
      "wyattgill@zen" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs self; };
        modules = [ ./home/home.nix ];
      };

      "wyattgill@ryu" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs self; };
        modules = [ ./home/home.nix ];
      };
    };

  };
}
