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
    d  = "${nixosDir}";
    l  = "eza";
    la = "eza";
    lg = "lazygit";
    ll = "eza";
    s  = "doas";
    j  = "just";
    jj = "${nixosDir}; just";
  };

  programs.zsh.shellAliases = {
    # TODO: Temporary aliases for training muscle memory
    ls = "sl";
    cd = "sl";

    # System, dotfiles, utilities and nix
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
    stats = "atuin stats";
    sys   = "nix-info -m";
    t     = "tldr";                                         # tldr pages
    ta    = "type -a";                                      # show all locations of a command
    tm    = "tmux";                                         # terminal multiplexer
    v     = "nvim";                                         # neovim
    zj    = "zellij";                                       # terminal workspace manager

    # LUKS encryption
    luks-add     = "sudo cryptsetup luksAddKey";     # add a new key  (rotate periodically)
    luks-remove  = "sudo cryptsetup luksRemoveKey";  # remove old key (rotate periodically)
    secure-open  = "sudo cryptsetup open /dev/vda3 crypt_data && sudo vgchange -ay vg_data; sudo mount --mkdir /dev/vg_data/secure /secure";
    secure-close = "sudo umount /secure && sudo vgchange -an vg_data && sudo cryptsetup close crypt_data; sudo rmdir /secure";
    sc           = "cd /security";

    # Security
    # TODO: `block-net = "";`
    dsec   = "systemd-analyze security";
    sec    = "sudo lynis audit system";
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