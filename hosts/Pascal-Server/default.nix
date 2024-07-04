{ nixpkgs-stable, home-manager-stable, sops-nix-stable, lix-module-stable, ... }:
nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
        ./configuration.nix
        lix-module-stable.nixosModules.default
        sops-nix-stable.nixosModules.sops
        home-manager-stable.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true; 
            home-manager.useUserPackages = true;
            home-manager.users.pl = {
                imports = [ 
              	    ./home.nix
                    sops-nix-stable.homeManagerModules.sops
                ];
     		};
        }
    ];
}