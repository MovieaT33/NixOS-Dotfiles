{ pkgs, ... }:

let
  nixosDir = "/etc/nixos";
in
{
  imports = [
    # a
    ../utilities/atuin.nix              # shell history manager
    # b
    ../utilities/bat.nix                # `cat` alternative
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
    s = "doas"
  };

  programs.zsh.shellAliases = {
    # TODO: Temporary aliases for training muscle memory
    ls = "sl";
    cd = "sl";
    l  = "eza";
    ll = "eza";

    # System, dotfiles, utilities and nix
    # FIXME: `l` is slow, `ls` is faster
    b     = "bat";                                          # `cat` alternative
    c     = "doas sh -c 'printf c > /proc/sysrq-trigger'";  # crash system (REISUB)
    d     = "${nixosDir}";
    doc   = "doas nix config check";
    dump  = "coredumpctl";
    e     = "superfile";                                    # file manager
    f     = "fzf";                                          # fuzzy finder
    fonts = "gnome-font-viewer";
    j     = "just";
    jj    = "${nixosDir}; just";
    i     = "uname -a";
    m     = "btop";                                         # monitor: `htop` alternative
    n     = "navi";                                         # interactive cheatsheet
    ns    = "nix-shell --run zsh -p";
    nl    = "nix-shell --run zsh -p !!";
    stats = "atuin stats";
    sys   = "nix-info -m";
    t     = "tldr";                                         # tldr pages
    ta    = "type -a";                                      # show all locations of a command
    tm    = "tmux";                                         # terminal multiplexer
    v     = "nvim";                                         # neovim
    zj    = "zellij";                                       # terminal workspace manager

    # LUKS encryption
    luks-add     = "doas cryptsetup luksAddKey";     # add a new key  (rotate periodically)
    luks-remove  = "doas cryptsetup luksRemoveKey";  # remove old key (rotate periodically)
    secure-open  = "doas cryptsetup open /dev/vda3 crypt_data && doas vgchange -ay vg_data && doas mkdir -p /secure; doas mount /dev/vg_data/secure /secure";
    secure-close = "doas umount /secure && doas vgchange -an vg_data && doas cryptsetup close crypt_data; doas rmdir /secure";
    sc           = "cd /security";

    # Security
    # TODO: `block-net = "";`
    dsec   = "systemd-analyze security";
    sec    = "doas lynis audit system";
    # TODO: `unblock-net = "";`
  };

  programs.zsh = {
    enable = true;

    history = {
      save = 0;
      size = 0;
    };

    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "afowler";
      plugins = [
        "git"
        "sudo"
        "vi-mode"
      ];
    };
  };
}