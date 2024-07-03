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

    nix-flatpak-stable.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

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

    nix-flatpak-unstable.url = "github:gmodena/nix-flatpak";

  };

  outputs = inputs@{
    self, 
    nixpkgs-stable, 
    nixpkgs-unstable, 
    home-manager-stable, 
    home-manager-unstable, 
    nix-flatpak-stable,
    nix-flatpak-unstable,
    sops-nix-stable, 
    sops-nix-unstable,  
    ... }:
    {
      nixosConfigurations.Pascal-X240 = import ./hosts/Pascal-X240 inputs;
      nixosConfigurations.Pascal-Server = import ./hosts/Pascal-Server inputs;
      nixosConfigurations.Pascal-Asahi = import ./hosts/Pascal-Asahi inputs;
    };
}
