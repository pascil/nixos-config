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

  outputs = {self, nixpkgs-stable, nixpkgs-unstable, ... } @ inputs:
    let
      mkHost = host: sys: pkgs: {
        ${host} = nixpkgs-${pkgs}.lib.nixosSystem {
          system = ${sys};
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${host}/configuration.nix
            home-manager-${pkgs}.nixosModules.home-manager
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
      };

    in {
      nixosConfigurations =
        # mkHost "${host}" "${sys}" "${pkgs}" //
        mkHost "Pascal-Server" "x86_64-linux" "stable" //
        mkHost "Pascal-X240" "x86_64-linux" "unstable";
    };
}
