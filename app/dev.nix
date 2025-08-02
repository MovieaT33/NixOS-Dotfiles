{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    atuin
    bat
    eza
    fd
    fzf
    # delta
    # difftastic
    # docker
    git
    # jless
    just
    # kondo
    # lazygit
    # lf
    neovim
    ranger
    tldr
    tig
    tmux
    tree
    wordgrinder
    # python314
    # ripgrep
    # tokei
    # yazi
    # zoxide
    zellij
  ];
}