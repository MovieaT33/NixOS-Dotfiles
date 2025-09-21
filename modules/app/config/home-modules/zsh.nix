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
    # TODO: Temporary aliases for training muscle memory
    ls = "sl";
    cd = "sl";

    # Dotfiles
    d  = "cd ${nixosDir}";
    j  = "just";
    D  = "cd ${nixosDir}; just";
    dj = "cd ${nixosDir}; just";

    # System, utilities and nix
    # FIXME: `l` is slow, `ls` is faster
    b     = "bat";                                          # `cat` alternative
    c     = "doas sh -c 'printf c > /proc/sysrq-trigger'";  # crash system (REISUB)
    doc   = "doas nix config check";
    dump  = "coredumpctl";
    e     = "superfile";                                    # file manager
    f     = "fzf";                                          # fuzzy finder
    fonts = "gnome-font-viewer";
    i     = "uname -a";
    m     = "btop";                                         # monitor: `htop` alternative
    n     = "navi";                                         # interactive cheatsheet
    ns    = "nix-shell --run zsh -p";
    nl    = "nix-shell --run zsh -p !!";
    p     = "doas poweroff -i";
    r     = "doas reboot now";
    s     = "doas shutdown now";
    stats = "atuin stats";
    sys   = "nix-info -m";
    t     = "tldr";                                         # tldr pages
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