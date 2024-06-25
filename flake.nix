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

  outputs = inputs@{self, nixpkgs-stable, nixpkgs-unstable, home-manager-stable, home-manager-unstable, nix-flatpak, sops-nix-stable, sops-nix-unstable,  ... }: {
    nixosConfigurations = {
        Pascal-Server = nixpkgs-stable.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/Pascal-Server/configuration.nix
              home-manager-stable.nixosModules.home-manager
              sops-nix-stable.nixosModules.sops
              proxmox-nixos.overlays.${system}
            ];
        };
        Pascal-X240 = nixpkgs-unstable.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/Pascal-X240/configuration.nix
              home-manager-unstable.nixosModules.home-manager
              nix-flatpak.nixosModules.nix-flatpak
              sops-nix-unstable.nixosModules.sops
            ];
        };
        x64iso-server = nixpkgs-stable.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/x64iso-minimal/configuration.nix
              home-manager-stable.nixosModules.home-manager
              sops-nix-stable.nixosModules.sops
            ];
        };
        x64iso-kde = nixpkgs-unstable.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/x64iso-kde/configuration.nix
              home-manager-unstable.nixosModules.home-manager
              sops-nix-unstable.nixosModules.sops
            ];
        };
    };
  };
}
