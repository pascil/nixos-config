#!/usr/bin/env sh

set -e

pushd ~/.nixconf

# Autoformating *.nix files
alejandra . &>/dev/null || ( alejandra . ; echo "Formatting failed!" && exit 1 )

# Show changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding!"
sudo nixos-rebuild switch --verbose --flake .#$hostname &>nixos-switch.log || ( cat nixos-switch.log | grep --color error && echo "NixOS rebuild failed!" && exit 1)

# Abort if no changes were made
if git diff --quiet '*nix'; then
    echo "No changes detected, no commit made."
    popd
    exit 0
else
    # Get current NixOS generation
    nixoscurrent=$(nixos-rebuild list-generations | grep current)
    # Commit changes with the generation metadata
    git ci "$nixoscurrent"
    popd
    # Echo at success
    echo  "All changes committed to Git!"
fi
