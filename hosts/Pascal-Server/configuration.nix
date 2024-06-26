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
      ../../systemModules/system/intel
      ../../systemModules/system/network
      ../../systemModules/system/network/proxmox-vlan
      ../../systemModules/system/zram
      ../../systemModules/services
      ../../systemModules/services/samba
      ../../systemModules/services/proxmox
      ../../systemModules/virt/docker

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

    networking.hostName= "Pascal-Server";
    system.stateVersion = "24.05";
  }
