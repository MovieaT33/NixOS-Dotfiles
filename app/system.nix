{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bandwhich
    bmon
    bottom
    btop
    duf
    dysk
    fastfetch
    htop
    iftop
    inxi
    # mtr
    nethogs
    neofetch
    pfetch
    screenfetch
    speedtest-cli
    tcpdump
    wget
    xh
  ];
}