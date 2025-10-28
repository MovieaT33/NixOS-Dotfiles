{ home, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # a
    # b
    # c
    calc
    calcure
    calcurse
    # d
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
    # tree
    # u
    # v
    viddy
    # w
    # x
    # y
    # z
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}