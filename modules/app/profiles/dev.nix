{ home, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # a
    # b
    # c
    calc
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
    tldr
    # u
    # v
    # w
    # x
    # y
    # z
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}