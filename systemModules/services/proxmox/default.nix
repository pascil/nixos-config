{lib, config, pkgs, ... }: with lib; {

 services.proxmox-ve.enable = true;
 nixpkgs.overlays = [
   proxmox-nixos.overlays."x86_64-linux"
 ]; 

}
