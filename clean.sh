#!/usr/bin/env bash
set -e

read -p "Remove all old generations and unused packages? (yes/no): " confirm
[ "$confirm" != "yes" ] && exit 0

# delete generations
if [ -f /etc/NIXOS ]; then
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
else
    command -v darwin-rebuild &> /dev/null && \
        sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
fi
nix-env --delete-generations old
[ -d "$HOME/.local/state/nix/profiles" ] && \
    nix-env --delete-generations old --profile "$HOME/.local/state/nix/profiles/home-manager"

# garbage collect
nix-collect-garbage -d
sudo nix-collect-garbage -d 2>/dev/null || true

# optimize (optional)
read -p "Optimize store? (yes/no): " opt
[ "$opt" == "yes" ] && nix-store --optimise

# clean artifacts
find ~ -maxdepth 3 -name 'result*' -type l -delete 2>/dev/null || true
rm -rf /tmp/nix-{build,shell}-* "$HOME/.cache/nix" 2>/dev/null || true

echo "✓ Done"
