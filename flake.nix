{
  description = "NixOS Flake";

  inputs = {

    # Stable

    nixpkgs-stable = {url = "github:NixOS/nixpkgs/nixos-24.05";};

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nixvim-stable = {
        url = "github:nix-community/nixvim/nixos-24.05";
        inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    sops-nix-stable = { 
      url = github:Mic92/sops-nix;
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    # Unstable

    nixpkgs-unstable = {url = "github:NixOS/nixpkgs/nixos-unstable";};

    home-manager-unstable = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixvim-unstable = {
        url = "github:nix-community/nixvim/";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    sops-nix-unstable = { 
      url = github:Mic92/sops-nix;
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Other

    nix-flatpak = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";

  };

  outputs = inputs@{
    self, 
    nixpkgs-stable, 
    nixpkgs-unstable, 
    home-manager-stable, 
    home-manager-unstable, 
    nix-flatpak, 
    sops-nix-stable, 
    sops-nix-unstable, 
    proxmox-nixos,  
    ... }:
    let
      system = "x86_64_linux";
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
    nixosConfigurations = {
        Pascal-Server = nixpkgs-stable.lib.nixosSystem {
            inherit system;
            modules = [
              ./hosts/Pascal-Server/configuration.nix
              sops-nix-stable.nixosModules.sops
              home-manager-stable.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true; 
                home-manager.useUserPackages = true;
                home-manager.users.pl = {
                  imports = [ 
              	     ./hosts/Pascal-Server/home.nix
 		                 nix-flatpak.homeManagerModules.nix-flatpak
                     sops-nix-stable.homeManagerModules.sops 
                  ];
     		        };
              }
            ];
        };
        Pascal-X240 = nixpkgs-unstable.lib.nixosSystem {
            inherit system;
            modules = [
              ./hosts/Pascal-X240/configuration.nix
              nix-flatpak.nixosModules.nix-flatpak
              sops-nix-unstable.nixosModules.sops
              home-manager-unstable.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true; 
                home-manager.useUserPackages = true;
                home-manager.users.pl = {
                  imports = [ 
              	     ./hosts/Pascal-X240/home.nix
 		                 nix-flatpak.homeManagerModules.nix-flatpak
                     sops-nix-unstable.homeManagerModules.sops 
                  ];
     		        };
              }
            ];
        };
        Pascal-Asahi = nixpkgs-unstable.lib.nixosSystem {
            system = "aarch64-linux";
            modules = [
              ./hosts/Pascal-Asahi/configuration.nix
              sops-nix-unstable.nixosModules.sops
              home-manager-unstable.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true; 
                home-manager.useUserPackages = true;
                home-manager.users.pl = {
                  imports = [ 
              	     ./hosts/Pascal-Asahi/home.nix
 		                 nix-flatpak.homeManagerModules.nix-flatpak
                     sops-nix-unstable.homeManagerModules.sops 
                  ];
     		        };
              }
            ];
        };
        x64iso-server = nixpkgs-stable.lib.nixosSystem {
            inherit system;
            modules = [
              ./hosts/x64iso-minimal/configuration.nix
              home-manager-stable.nixosModules.home-manager
              sops-nix-stable.nixosModules.sops
            ];
        };
        x64iso-kde = nixpkgs-unstable.lib.nixosSystem {
            inherit system;
            modules = [
              ./hosts/x64iso-kde/configuration.nix
              home-manager-unstable.nixosModules.home-manager
              sops-nix-unstable.nixosModules.sops
            ];
        };
    };
  };
}
