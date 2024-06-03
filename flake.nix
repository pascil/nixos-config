{
  description = "Pascal-Server Flake";
  
  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-24.05"; };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	config = {
          allowUnfree = true;
 	};
      };
    in {
    nixosConfigurations = {
      Pascal-X240 = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs system;  };
        modules = [ ./configuration.nix ];
      };
    };
  };
}
