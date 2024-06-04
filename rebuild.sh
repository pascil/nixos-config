#!/usr/bin/env bash

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
sudo nixos-rebuild switch --flake . &>nixos-switch.log \ 
  || ( cat nixos-switch.log | grep --color error && exit 1)

# Get current NixOS generation
nixos-current=$(nixos-rebuild list-generations | grep current)

echo "home-manager Rebuilding!"
home-manager switch --flake . &>hm-switch.log \
  || ( cat hm-switch.log | grep --color error && exit 1)

# Get current home-manager generation
hm-current=$(home-manager generations | grep -m1 "")

# Commit changes with the generation metadata

git ci "NixOS: $nixos-current, HM: $hm-current"

popd

# Echo at success

echo  "All changes committed to Git!"
