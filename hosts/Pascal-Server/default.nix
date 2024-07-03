{ nixpkgs-stable, home-manager-stable, sops-nix-stable, ... }:
nixpkgs-stable.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
        ./configuration.nix
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