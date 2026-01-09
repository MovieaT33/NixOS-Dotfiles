{ home, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # a
    # b
    bibata-cursors
    # c
    # calc
    # calcure
    # calcurse
    # d
    # e
    # f
    # g
    # h
    # i
    # j
    # k
    kdePackages.kolourpaint
    # l
    # m
    # n
    # o
    # p
    # q
    # r
    # s
    # t
    # u
    # v
    # viddy
    # w
    wl-clipboard
    # x
    # y
    # z
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}