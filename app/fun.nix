{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aalib
    asciiquarium
    boxes
    cbonsai
    # charasay
    cmatrix
    cowsay
    figlet
    fortune
    genact
    hello
    hollywood
    libcaca
    lolcat
    mapscii
    nyancat
    # pokemonsay
    ponysay
    rig
    sl
    starfetch
    # tewisay
    toilet
    typespeed
  ];
}