{ nixpkgs-unstable, home-manager-unstable, nix-flatpak-unstable, sops-nix-unstable, lix-module-unstable, apple-silicon-support, ... }:
nixpkgs-unstable.lib.nixosSystem {
    system = "aarch64-linux";
    modules = [
        apple-silicon-support.nixosModules.default
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