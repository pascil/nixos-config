{config, lib, ...}: with lib; {
    networking = {
      networkmanager.enable = true;
      firewall = {
        enable = true;
        allowedTCPPorts = [22 80 443];
      };
    };
}
