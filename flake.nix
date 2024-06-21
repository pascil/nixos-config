{
  description = "NixOS Flake";

  inputs = {
    nixpkgs = {url = "github:NixOS/nixpkgs/nixos-unstable";};

    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};

    nixvim = {
        url = "github:nix-community/nixvim/";
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
