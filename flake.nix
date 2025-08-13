{
  description = "A NixOS configuration by MovieaT33";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      personal = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/personal/config.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    homeConfigurations = {
      mvt33 = home-manager.lib.homeManagerConfiguration {
        inherit system;
        username = "mvt33";
        homeDirectory = "/home/mvt33";
        configuration = ./profiles/home.nix;
      };
    };
  };
}