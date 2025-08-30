{ home-manager, pkgs, ... }:

{
  home-manager.users.mvt33 = import ./git.nix;

  environment.systemPackages = with pkgs; [
    just                                    # system
    lynis kernel-hardening-checker          # security
  ];
}