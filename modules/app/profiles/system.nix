{ home, pkgs, ... }:

{
  home.packages = with pkgs; [
    # a
    # b
    bandwhich
    bmon
    bottom
    # c
    cava
    # d
    dig
    disfetch
    duf
    dust
    dysk
    # e
    # f
    fastfetch
    # g
    g-ls
    gdu
    glances
    gping
    # h
    htop
    # j
    # k
    # l
    lazyjournal
    librespeed-cli
    # m
    macchina
    mc
    mtr
    # n
    ncdu
    neofetch
    nerdfetch
    nethogs
    nload
    nnn
    # o
    # p
    pfetch
    procs
    # q
    # r
    ranger
    # s
    s-tui
    screenfetch
    speedtest-cli
    # t
    tmate
    # u
    # v
    # w
    wget
    # x
    # y
    yazi
    # z
  ];
}