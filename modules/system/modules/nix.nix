{ system, ... }:

{
  nix = {
    optimise.automatic = true;
    settings = {
      sandbox = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];

      # Binary cache settings
      substituters = [ "https://cache.nixos.org/" ];
      trusted-public-keys = [
        "cache.nixos.org-1:nhB9nTcrtoOgd6k0k0gqKId3+JRxF6YkIDt/vy4QmY="
      ];
      require-sigs = true;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };

  };

  nixpkgs = {
    hostPlatform = system;
    config = {
      allowBroken = false;
      allowUnfree = false;
    };
  };
}