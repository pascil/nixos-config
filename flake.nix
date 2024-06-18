{
  description = "NixOS Flake";

  inputs = {
    nixpkgs = {url = "github:NixOS/nixpkgs/nixos-24.05";};

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};

    nixvim = {
        url = "github:nix-community/nixvim/nixos-24.05";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    utils = import ./nix/utils.nix {inherit inputs outputs;};
  in {
   overlays = import ./nix/overlays.nix {inherit inputs;};
   nixosConfigurations = utils.mkHosts ["Pascal-Server" "Pascal-X240"];
  };
}
