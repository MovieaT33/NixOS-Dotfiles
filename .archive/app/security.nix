{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # age
    # gnupg
    # metasploit
    nmap
    # pass
    # websploit
    # whois
  ];
}