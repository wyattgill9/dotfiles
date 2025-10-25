{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "python-dev-env";
  version = "1.0";

  nativeBuildInputs = with pkgs; [
    uv
    ruff
  ];

  shellHook = ''
    echo "Development environment ready!"
    echo "  Python: $(python3 --version)"
    echo "  Ruff:   $(ruff --version)"
    echo "  uv:     $(uv --version)"
  '';

  meta = with pkgs.lib; {
    description = "Python development environment with uv and ruff";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
