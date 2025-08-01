{ config, libs, pkgs, ... }:

{
  environment.systemPackages = [
    gnupg
    pass
    whois
  ];
}