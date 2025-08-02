{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aalib
    asciiquarium
    boxes
    cbonsai
    cmatrix
    cowsay
    figlet
    fortune
    hello
    hollywood
    libcaca
    lolcat
    mapscii
    nyancat
    ponysay
    rig
    sl
    starfetch
    toilet
    typespeed
  ];
}