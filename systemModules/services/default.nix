{config, lib, ...}: with lib; {
  options = {
    modules.system.services.enable = mkEnbaleOption "Enable default root services";
  };

  config = mkIf config.modules.system.services.enable {
    services = {
      openssh.enable = true;
      printing.enable = true;
    };
  };
}