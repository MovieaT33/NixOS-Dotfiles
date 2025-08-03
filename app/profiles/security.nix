{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # age
    # gnupg
    nmap
    # pass
    # whois
  ];
}