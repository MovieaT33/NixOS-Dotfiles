{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    gnupg
    pass
    whois
  ];
}