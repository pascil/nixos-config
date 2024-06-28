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
      ../../systemModules/packages
      ../../systemModules/packages/ruby
      ../../systemModules/system/fstrim
      ../../systemModules/system/network
      ../../systemModules/system/zram
      ../../systemModules/services

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

    networking.hostName= "Pascal-Asahi";
    system.stateVersion = "24.05";
  }
