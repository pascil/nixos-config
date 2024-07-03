{
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}: let
    systemModules = "../../systemModules";
    userModules = "../../userModules";
   in {
    imports = [
      ../../apple-silicon-support
      ./hardware-configuration.nix
      ./users.nix
      ../../systemModules/desktop/hyprland
      ../../systemModules/packages
      ../../systemModules/packages/ruby
      ../../systemModules/programs/adb
      ../../systemModules/system/bluetooth
      ../../systemModules/system/fstrim
      ../../systemModules/system/network
      ../../systemModules/system/plymouth
      ../../systemModules/system/zram
      ../../systemModules/services
      ../../systemModules/services/tailscale

    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = false;

    boot.extraModprobeConfig = ''
         options hid_apple iso_layout=1 fnmode=1
    '';

    hardware.asahi.peripheralFirmwareDirectory = /etc/nixos/firmware;
   
    
    # Set your time zone.
    time.timeZone = "Europe/Berlin";


    # Select internationalisation properties.
    i18n.defaultLocale = "de_DE.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = lib.mkDefault "de";
        useXkbConfig = true; # use xkb.options in tty.
    };

    nix = {
      package = pkgs.nixFlakes;
      extraOptions = ''
           experimental-features = nix-command flakes
      '';
    };  

    sops = {
	    defaultSopsFile = ../../secrets.yaml;
	    validateSopsFiles = false;
	
	    age = {
	      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
	      keyFile = "/var/libs/sops-nix/key.txt";
	      generateKey = true;
	    };
    };

    networking.hostName= "Pascal-Asahi";
    system.stateVersion = "24.11";
  }
