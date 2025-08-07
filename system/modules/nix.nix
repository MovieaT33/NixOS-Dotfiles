{ config, ... }:

{
  nix.settings.sandbox = true;
  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}