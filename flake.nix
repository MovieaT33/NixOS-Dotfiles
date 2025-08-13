{
  description = "A NixOS configuration by MovieaT33";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      personal = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./profiles/personal.nix ];
      };
    };
  };
}