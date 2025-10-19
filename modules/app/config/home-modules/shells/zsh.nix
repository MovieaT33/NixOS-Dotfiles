{ ... }:

{
  programs.zsh.shellAliases = {
    # TODO: Temporary aliases for training muscle memory
    # ls = "sl";
    # cd = "sl";

    # System, dotfiles, utilities and nix
    # FIXME: `l` is slow, `ls` is faster
    b     = "bat";                                          # `cat` alternative
    c     = "sudo sh -c 'printf c > /proc/sysrq-trigger'";  # crash system (REISUB)
    doc   = "sudo nix config check";
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