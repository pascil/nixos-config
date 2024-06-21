{lib, config, pkgs, ... }: with lib; {
    services.samba = {
    	enable = true;
    	ecurityType = "user";
      openFirewall = true;
    	extraConfig = ''
      		workgroup = WORKGROUP
      		server string = smbnix
      		netbios name = smbnix
      		security = user
      		#use sendfile = yes
      		#max protocol = smb2
      		# note: localhost is the ipv6 localhost ::1
      		hosts allow = 100.77.20.113 100.102.46.12 192.168.178.1/24 127.0.0.1 localhost
      		hosts deny = 0.0.0.0/0
      		guest account = nobody
      		map to guest = bad user
    	   '';
    	shares = {
				private = {
        		path = "/mnt/storage";
        		browseable = "yes";
        		"read only" = "no";
        		"guest ok" = "no";
        		"create mask" = "0644";
        		"directory mask" = "0755";
        		"force user" = "pl";
        		"force group" = "users";
      		};
    	   };
  	};

  	services.samba-wsdd = {
    		enable = true;
    		openFirewall = true;
  	};

  	networking.firewall.enable = true;
  	networking.firewall.allowPing = true;
}
