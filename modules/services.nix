{ pkgs, ... }: {

 services.openssh.enable = true;  
 
 services.xserver = {
    xkb.layout = "de";
    xkb.variant = "nodeadkeys";
  };
  
  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
  };  

  services.davfs2.enable = true;
  services.autofs = {
    enable = true;
    autoMaster = let
      mapConf = pkgs.writeText "auto" ''
        nextcloud -fstype=davfs,conf=/home/pl/.config/davfs2/davfs2.conf, uid=1000 :https:\:cloud.plnetlab.sbs/remote.php/webdav/ '';
    in ''
      /home/pl/Nextcloud file:${mapConf}
    '';
  };
 
}
