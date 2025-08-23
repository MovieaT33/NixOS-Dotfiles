{
  description = "A NixOS configuration by MovieaT33 - see more at https://github.com/MovieaT33/NixOS-Dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: let
    system = "x86_64-linux";
    stateVersion = "25.05";
  in {
    nixosConfigurations = {
      personal = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./profiles/personal/config.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit system;
          inherit stateVersion;
        };
      };
    };
  };
}