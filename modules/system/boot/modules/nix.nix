{ system, ... }:

{
  nix = {
    settings = {
      sandbox = true;
      auto-optimise-store = true;

      # Binary cache settings
      # FIXME: Check `substituters` order
      substituters = [
        "https://nix-community.cachix.org/"
      ];  # default: `https://cache.nixos.org/`

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    optimise.automatic = true;

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