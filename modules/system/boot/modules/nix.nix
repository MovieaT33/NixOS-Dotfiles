{ system, ... }:

{
  nix = {
    optimise.automatic = true;
    settings = {
      sandbox = true;
      auto-optimise-store = true;

      # Binary cache settings
      substituters = [ ];       # default: `https://cache.nixos.org/`

      experimental-features = [ "nix-command" "flakes" ];
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