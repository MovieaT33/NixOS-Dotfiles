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
    disfetch
    duf
    dysk
    fastfetch
    # gdu
    # htop
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
    speedtest-cli
    tcpdump
    wget
    # wireshark
    xh
  ];
}