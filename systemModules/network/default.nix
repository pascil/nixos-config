{config, lib, ...}: with lib; {
  options = {
    modules.system.network.enable = mkEnableOption "Enable default networking configuration";
  };
  config = lib.mkIf config.modules.system.network.enable {
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
      firewall = {
        enable = true;
        allowedTCPPorts = [22 80 443];
      };
    };
  };
}
