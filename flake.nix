{
  description = "Anthony's NixOS configurations flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      unstablePkgs = import nixpkgs-unstable {
        inherit system;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nabu = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix ];
	};
      };
    };
}
