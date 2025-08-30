{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git just                                # repository and system
    lynis kernel-hardening-checker          # security
  ];
}