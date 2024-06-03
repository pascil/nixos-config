{ pkgs, ... }: {

 services.openssh.enable = true;  

 services.flatpak.enable = true;
 
 services.xserver = {
    xkb.layout = "de";
    xkb.variant = "nodeadkeys";
  };
  
  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };
  
}
