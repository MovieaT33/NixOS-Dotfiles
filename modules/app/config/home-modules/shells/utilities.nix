{ home, pkgs, ... }:

let
  configDir = "/etc/nixos";
in
{
  imports = [
    # a
    ../utilities/atuin.nix              # shell history manager
    # b
    ../utilities/bat.nix                # `cat` alternative
    ../utilities/broot.nix              # directory navigation
    ../utilities/btop.nix               # resource monitor
    # c
    ../utilities/carapace.nix           # shell argument completion
    ../utilities/command-not-found.nix  # suggests packages for unknown commands
    # TODO: ../utilities/curl.nix       # network downloader
    # d
    # TODO: ../utilities/delta.nix      # git diff viewer
    # e
    ../utilities/eza.nix                # `ls` alternative
    # f
    ../utilities/fd.nix                 # `find` alternative
    ../utilities/fzf.nix                # fuzzy finder
    # g
    ../utilities/git.nix                # git configuration
    # h
    # j
    # k
    # l
    ../utilities/lazydocker.nix         # docker UI
    ../utilities/lazygit.nix            # git UI
    # m
    # n
    ../utilities/navi.nix               # interactive cheatsheet
    # ../utilities/ncdu.nix             # disk usage analyzer
    ../utilities/neovim.nix             # neovim editor
    # o
    # p
    # q
    # r
    ../utilities/ripgrep.nix            # `grep` alternative
    ../utilities/ripgrep-all.nix        # `grep` alternative with more features
    # s
    ../utilities/starship.nix           # shell prompt
    ../utilities/superfile.nix          # the best file manager
    # t
    ../utilities/tmux.nix               # terminal multiplexer
    # ../utilities/tree.nix             # directory tree
    # u
    # v
    # w
    # ../utilities/wget.nix             # network downloader
    # x
    # y
    # z
    ../utilities/zellij.nix             # terminal workspace manager
    ../utilities/zoxide.nix             # `cd` alternative
  ];

  # TODO: Check which packages are really needed
  home.packages = with pkgs; [
    nix-info  # does not work
    # gnumake
    # coreutils
    # findutils
    # diffutils
    # gnused
    # gawk
    # gzip
    # unzip
    # zip
    # xz
    # file
    # which
    # shadow  # for `chage` command (password expiration management)
  ];

  home.shellAliases = {
    d  = "${configDir}";
    l  = "eza";
    la = "eza";
    lg = "lazygit";
    ll = "eza";
    s  = "doas";
    j  = "just";
    jj = "${configDir}; just";
  };
}