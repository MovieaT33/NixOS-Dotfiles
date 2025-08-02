{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # gnupg
    nmap
    # pass
    whois
  ];
}