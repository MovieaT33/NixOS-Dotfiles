{
  description = "A NixOS configuration by MovieaT33 - see more at https://github.com/MovieaT33/NixOS-Dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tnvim = {
      url = "github:tuxdotrs/tnvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    tnvim,
    zen-browser,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    stateVersion = "25.11";
  in {
    nixosConfigurations = {
      "boot" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit system stateVersion;
        };
        modules = [
          ./profiles/boot.nix
        ];
      };

      "system" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit system stateVersion;
        };
        modules = [
          ./profiles/system.nix
        ];
      };

      "personal" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit system stateVersion;
        };
        modules = [
          ./profiles/personal.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = { inherit inputs tnvim; };
          }
        ];
      };

      # NixOS alias (see `nixos-rebuild switch --upgrade`)
      "nixos" = self.nixosConfigurations.personal;
    };
  };
}