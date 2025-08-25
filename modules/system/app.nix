{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git just                            # repository
    lynis kernel-hardening-checker      # security
  ];
}