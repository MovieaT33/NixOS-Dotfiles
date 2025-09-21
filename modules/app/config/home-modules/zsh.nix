{ pkgs, ... }:

let
  nixosDir = "/etc/nixos";
in
{
  imports = [
    # a
    ./atuin.nix               # shell history manager
    # b
    ./bat.nix                 # `cat` alternative
    ./btop.nix                # resource monitor
    # c
    ./command-not-found.nix   # suggests packages for unknown commands
    # TODO: ./curl.nix        # network downloader
    # d
    # TODO: ./delta.nix       # git diff viewer
    # e
    ./eza.nix                 # `ls` alternative
    # f
    ./fd.nix                  # `find` alternative
    ./fzf.nix                 # fuzzy finder
    # g
    ./git.nix                 # git configuration
    # h
    # j
    # k
    # l
    # m
    # n
    ./navi.nix                # interactive cheatsheet
    # ./ncdu.nix              # disk usage analyzer
    ./neovim.nix              # neovim editor
    # o
    # p
    # q
    # r
    ./ripgrep.nix             # `grep` alternative
    ./ripgrep-all.nix         # `grep` alternative with more features
    # s
    # TODO: ./starship.nix    # shell prompt
    ./superfile.nix           # the best file manager
    # t
    ./tmux.nix                # terminal multiplexer
    # ./tree.nix              # directory tree
    # u
    # v
    # w
    # ./wget.nix              # network downloader
    # x
    # y
    # z
    ./zellij.nix              # terminal workspace manager
    ./zoxide.nix              # `cd` alternative
  ];

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
    # Dotfiles
    d  = "cd ${nixosDir}";
    j  = "just";
    D  = "cd ${nixosDir}; just";
    dj = "cd ${nixosDir}; just";

    # System and Nix
    m           = "btop";  # monitor: `htop` alternative
    system-info = "nix-info -m";  # does not work
    ns          = "nix-shell --run zsh -p";
    nsl         = "nix-shell --run zsh -p !!";
    i           = "uname -a";
    doc         = "doas nix config check";
    fonts       = "gnome-font-viewer";
    c           = "doas sh -c 'printf c > /proc/sysrq-trigger'";
    dump        = "coredumpctl";
    r           = "doas reboot now";
    s           = "doas shutdown now";
    p           = "doas poweroff -i";

    # FIXME: `l` is slow, `ls`

    # Utilities
    v     = "nvim";         # neovim
    t     = "tldr";         # simplified
    f     = "fzf";          # fuzzy finder
    n     = "navi";         # interactive cheatsheet
    e     = "superfile";    # file manager
    b     = "bat";          # `cat` alternative
    stats = "atuin stats";

    # LUKS encryption
    luks-add     = "doas cryptsetup luksAddKey";     # add a new key  (rotate periodically)
    luks-remove  = "doas cryptsetup luksRemoveKey";  # remove old key (rotate periodically)
    secure-open  = "doas cryptsetup open /dev/vda3 crypt_data && doas vgchange -ay vg_data && doas mkdir -p /secure; doas mount /dev/vg_data/secure /secure";
    sc           = "cd /security";
    secure-close = "doas umount /secure && doas vgchange -an vg_data && doas cryptsetup close crypt_data; doas rmdir /secure";

    # Security
    # TODO: `block-net = "";`
    # TODO: `unblock-net = "";`
    sec    = "doas lynis audit system";
    dsec   = "systemd-analyze security";
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