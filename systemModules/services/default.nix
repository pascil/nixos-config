{config, lib, ...}: with lib; {
  options = {
    modules.system.services.enable = mkEnableOption "Enable default root services";
  };

  config = mkIf config.modules.system.services.enable {
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
  };
}
