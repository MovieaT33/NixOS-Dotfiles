{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    bandwhich
    bmon
    bottom
    bsd-finger
    btop
    dig
    disfetch
    duf
    dysk
    fastfetch
    # gdu
    htop
    httpie
    iftop
    inxi
    # iproute2
    # mtr
    ncdu
    neofetch
    net-tools
    nethogs
    nload
    pfetch
    screenfetch
    speedtest-cli
    tcpdump
    wget
    # wireshark
    xh
  ];
}