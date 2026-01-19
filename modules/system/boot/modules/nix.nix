{ system, ... }:

{
  nix = {
    download-buffer-size = 8388608;
    settings = {
      sandbox = true;
      auto-optimise-store = true;

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