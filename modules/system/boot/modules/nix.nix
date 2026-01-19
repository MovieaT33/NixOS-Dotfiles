{ system, ... }:

{
  nix = {
    settings = {
      download-attempts = 5;
      download-buffer-size = 8388608;
      http-connections = 50;
      id-count = 8388608;
      max-call-depth = 10000;
      max-jobs = 22;

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