{ ... }:
{
  nix.settings = {
    auto-optimise-store = true;
    trusted-substituters = [
      "https://cache.nixos.org/"
      "https://wyattgill9.cachix.org"
    ];

    trusted-public-keys = [
      "wyattgill9.cachix.org-1:o7wwgwm7n42DP4ps1GIAkVuxmYDxGZeHl1XMSs2sITU="
    ];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
