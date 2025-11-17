{
  description = "Project Euler solutions in Haskell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    haskell-nix.url = "github:input-output-hk/haskell.nix";
    haskell-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, haskell-nix }:
    flake-utils.lib.eachSystem [ "aarch64-darwin" "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ haskell-nix.overlay ];
          inherit (haskell-nix) config;
        };

        hsPkgs = pkgs.haskell-nix.cabalProject' {
          src = ./.;
          compiler-nix-name = "ghc9122";
          shell.tools = {
            cabal = "latest";
            hlint = "latest";
            haskell-language-server = "latest";
          };
          shell.buildInputs = [
            # pkgs.zlib
            # pkgs.pkg-config
          ];
        };

        project = hsPkgs.flake {};
      in
      {
        packages.default = project.packages."project-euler:exe:project-euler";

        devShells.default = project.devShells.default;

        # makes `nix run` work
        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
        };
      });
}
