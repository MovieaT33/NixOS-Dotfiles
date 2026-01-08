{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    metasploit
    pass
    whois
  ];
}