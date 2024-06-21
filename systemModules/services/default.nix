{config, lib, ...}: with lib; {
    services = {
      openssh = {
    	enable = true;
    	ports = [22];
    	settings = {
      	    PasswordAuthentication = true;
      	    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
            UseDns = true;
            X11Forwarding = false;
            PermitRootLogin = "yes"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
        };
      };
      printing.enable = true;
    };
}
