{ home, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # a
    # b
    # c
    # calc
    # calcure
    # calcurse
    # d
    # delta
    # e
    # f
    # g
    gcc
    # h
    # i
    # j
    # k
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
    # x
    # y
    # z
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}