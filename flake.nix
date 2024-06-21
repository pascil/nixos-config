{
  description = "NixOS Flake";

  inputs = {
<<<<<<< HEAD
    nixpkgs = {url = "github:NixOS/nixpkgs/nixos-unstable";};

    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
=======
    # Stable
    nixpkgs-stable = {url = "github:NixOS/nixpkgs/nixos-24.05";};

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs-stable.follows = "nixpkgs";
>>>>>>> d006de4 (unstable / stable test)
    };
    nix-flatpak-stable = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};

<<<<<<< HEAD
    nix-flatpak = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};

    nixvim = {
        url = "github:nix-community/nixvim/";
=======
    nixvim-stable = {
        url = "github:nix-community/nixvim/nixos-24.05";
>>>>>>> d006de4 (unstable / stable test)
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    # Unstable

    nixpkgs-unstable = {url = "github:NixOS/nixpkgs/nixos-unstable";};

    home-manager-unstable = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };
    nix-flatpak-unstable = {url = "github:gmodena/nix-flatpak/?ref=v0.4.1";};

    nixvim-unstable = {
        url = "github:nix-community/nixvim/nixos-unstable";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs-unstable.follows = "nixpkgs";
    };


  };

  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    inherit (self) outputs;
    utils-stable = import ./nix/utils-stable.nix {inherit inputs outputs;};
    utils-unstable = import ./nix/utils-unstable.nix {inherit inputs outputs;};
  in {
   overlays = import ./nix/overlays.nix {inherit inputs;};
   nixosConfigurations.stable = utils-stable.mkHosts ["Pascal-Server"];
   nixosConfigurations.unstable = utils-unstable.mkHosts ["Pascal-X240"];
  };
}
