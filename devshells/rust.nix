{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "rust-dev-env";
  version = "1.0";

  nativeBuildInputs = with pkgs; [
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer
  ];

  shellHook = ''
    echo "Development environment ready!"
    echo "  Rust:    $(rustc --version)"
    echo "  Cargo:   $(cargo --version)"
    echo "  Clippy:  $(cargo clippy --version)"
    echo "  Rustfmt: $(rustfmt --version)"
  '';

  meta = with pkgs.lib; {
    description = "Rust development environment with cargo, clippy, and rustfmt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
