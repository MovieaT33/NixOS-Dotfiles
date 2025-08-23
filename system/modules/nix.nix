{ system, ... }:

{
  nix.settings.sandbox = true;

  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = system;
}