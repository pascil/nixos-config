{ nixpkgs-unstable, home-manager-unstable, nix-flatpak-unstable, sops-nix-unstable, lix-module-unstable, ... }:
nixpkgs-unstable.lib.nixosSystem {
    system = "aarch64-linux";
    modules = [
        ./configuration.nix
        lix-module-unstable.nixosModules.default
        sops-nix-unstable.nixosModules.sops
        home-manager-unstable.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true; 
            home-manager.useUserPackages = true;
            home-manager.users.pl = {
                imports = [ 
              	    ./home.nix
 		            nix-flatpak-unstable.homeManagerModules.nix-flatpak
                    sops-nix-unstable.homeManagerModules.sops 
                ];
     		};
        }
    ];
}