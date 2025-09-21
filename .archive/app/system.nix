{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    bandwhich
    bmon
    bottom
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
    ncdu
    net-tools
    nethogs
    nload
    speedtest-cli
    tcpdump
    wget
    # wireshark
    xh
  ];
}