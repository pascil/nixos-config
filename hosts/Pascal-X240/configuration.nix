{
  inputs,
  outputs,
  ...
}: let
    systemModules = "../../systemModules";
    userModules = "../../userModules";
   in {
    imports = [
      ./hardware-configuration.nix
      ./users.nix
      ../../systemModules/general
      ../../systemModules/desktop/kde
      ../../systemModules/desktop/wayland
      ../../systemModules/desktop/xorg
      ../../systemModules/hardware/lenovo
      ../../systemModules/packages
      ../../systemModules/packages/ruby
      ../../systemModules/programs/adb
      ../../systemModules/packages/firefox-nightly
      ../../systemModules/services
      ../../systemModules/services/tailscale
      ../../systemModules/system/bluetooth
      ../../systemModules/system/fstrim
      ../../systemModules/system/intel
      ../../systemModules/system/network
      ../../systemModules/system/powerManagement
      ../../systemModules/system/zram
    ];

    sops = {
	    defaultSopsFile = ../../secrets.yaml;
	    validateSopsFiles = false;
	
	    age = {
	      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
	      keyFile = "/var/libs/sops-nix/key.txt";
	      generateKey = true;
	    };
    };
	
    networking.hostName= "Pascal-X240";
    system.stateVersion = "24.05";
  }
