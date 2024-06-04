{
  description = "Pascal-X240 Flake";

  inputs = {
    nixpkgs = {url = "github:NixOS/nixpkgs/nixos-24.05";};

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosModules = import ./nixos/modules;
    homeManagerModules = import ./home/modules;

    nixosConfigurations = {
      Pascal-X240 = lib.nixosSystem {
        inherit system;
        modules = [./nixos/configuration.nix];
      };
    };
    homeConfigurations = {
      pl = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nix-flatpak.homeManagerModules.nix-flatpak
          ./home/home.nix
        ];
      };
    };
  };
}
