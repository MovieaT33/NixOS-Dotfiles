{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    bsd-finger
    httpie
    iftop
    inxi
    iproute2
    net-tools
    tcpdump
    wireshark
    xh
  ];
}