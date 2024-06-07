#!/usr/bin/env sh

set -e

pushd ~/.nixconf

# Abort if no changes were made
if git diff --quiet '*nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

# Autoformating *.nix files
alejandra . &>/dev/null || ( alejandra . ; echo "Formatting failed!" && exit 1 )

# Show changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding!"
sudo nixos-rebuild switch --verbose --flake . &>nixos-switch.log || ( cat nixos-switch.log | grep --color error && echo "NixOS rebuild failed!" && exit 1)

# Get current NixOS generation
nixoscurrent=$(nixos-rebuild list-generations | grep current)

echo "home-manager Rebuilding!"
home-manager switch --verbose --flake . &>hm-switch.log

# Get current home-manager generation
hmcurrent=$(home-manager generations | grep -m1 "")

# Commit changes with the generation metadata

git ci "NixOS: $nixoscurrent, HM: $hmcurrent"

popd

# Echo at success

echo  "All changes committed to Git!"
