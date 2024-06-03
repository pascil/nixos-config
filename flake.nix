{
  description = "Pascal-X240 Flake";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-24.05"; };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      Pascal-X240 = lib.nixosSystem {
	inherit system;
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      pl = home-manager.lib.homeManagerConfiguration {
     	inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
  };
}
