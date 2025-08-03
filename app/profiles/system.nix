{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bandwhich
    bmon
    bottom
    btop
    dig
    duf
    dysk
    fastfetch
    # gdu
    htop
    iftop
    inxi
    # mtr
    ncdu
    neofetch
    net-tools
    nethogs
    pfetch
    screenfetch
    speedtest-cli
    tcpdump
    wget
    xh
  ];
}