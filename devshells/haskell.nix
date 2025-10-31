{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "haskell-dev-env";
  version = "1.0";

  nativeBuildInputs = with pkgs; [
    ghc
    cabal-install
    haskell-language-server
    haskellPackages.fourmolu
  ];

  shellHook = ''
    echo "Development environment ready!"
    echo "  GHC:    $(ghc --version)"
    echo "  Cabal:  $(cabal --version | head -n 1)"
    echo "  HLS:    $(haskell-language-server --version)"
    echo "  Fourmolu: $(fourmolu --version)"
  '';

  meta = with pkgs.lib; {
    description = "Haskell development environment with GHC & Cabal";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
