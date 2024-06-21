{
  description = "NixOS Flake";

  inputs = {
    nixpkgs-stable = {url = "github:NixOS/nixpkgs/nixos-24.05";};

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    nix-flatpak = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};

    nixvim-stable = {
        url = "github:nix-community/nixvim/nixos-24.05";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
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
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs-unstable";
    };


  };

  outputs = inputs@{self, nixpkgs-stable, nixpkgs-unstable, home-manager-stable, home-manager-unstable, ... }: {
    nixosConfigurations = {
        Pascal-Server = nixpkgs-stable.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/Pascal-Server/configuration.nix
              home-manager-stable.nixosModules.home-manager
            ];
        };
        Pascal-X240 = nixpkgs-unstable.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/Pascal-Server/configuration.nix
              home-manager-unstable.nixosModules.home-manager
              nix-flatpak.nixosModules.nix-flatpak
            ];
        };
    };
  };
}
