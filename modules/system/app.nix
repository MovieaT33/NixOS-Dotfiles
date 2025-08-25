{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git just
    lynis kernel-hardening-checker
  ];
}