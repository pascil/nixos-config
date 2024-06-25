{lib, config, pkgs, ... }: with lib; {

  nixpkgs.overlays = [ (import ./firefox-overlay.nix) ];
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        latest.firefox-nightly-bin
      ];
	
}
