{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "scheme-dev-env";
  version = "1.0";

  nativeBuildInputs = with pkgs; [
    steel
  ];

  shellHook = ''
    echo "Development environment ready!"
    echo "  Steel: $(steel --version)"
  '';

  meta = with pkgs.lib; {
    description = "Scheme development environment with Steel";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
