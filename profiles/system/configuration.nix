{ config, lib, pkgs, ... }:

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
    mtr
    nethogs
    pfetch
    tcpdump
    wget
    xh
  ];
}