# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./nixos/packages.nix
      ./nixos/programs.nix
      ./nixos/services.nix
      ./nixos/user.nix
      ./nixos/zram.nix
      ./nixos/trim.nix
      ./nixos/env.nix
      ./nixos/bootloader.nix
      ./nixos/networking.nix
      ./nixos/intel.nix
      ./nixos/sound.nix
      ./nixos/plasma6.nix
    ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure console keymap
  console.keyMap = "de";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
