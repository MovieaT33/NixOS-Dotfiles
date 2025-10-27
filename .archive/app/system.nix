{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    bsd-finger
    dig
    glances
    # gdu
    # htop
    httpie
    iftop
    inxi
    # iproute2
    # mtr
    net-tools
    tcpdump
    wget
    # wireshark
    xh
  ];
}