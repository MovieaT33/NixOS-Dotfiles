{ pkgs, ... }:

let
  nixosDir = "/etc/nixos";
in
{
  imports = [
    ./atuin.nix
    ./zoxide.nix              # `cd` alternative
    ./eza.nix                 # `ls` alternative
    ./command-not-found.nix
    ./git.nix                 # git configuration
    ./superfile.nix           # the best file manager
    ./fzf.nix                 # fuzzy finder
    ./btop.nix                # resource monitor
    ./fd.nix                  # `find` alternative
    ./ripgrep.nix             # `grep` alternative
    ./ripgrep-all.nix         # `grep` alternative with more features
    ./tmux.nix                # terminal multiplexer
    ./neovim.nix              # neovim editor
    # ./ncdu.nix                # disk usage analyzer
    # ./tree.nix                # directory tree
    # ./wget.nix                # network downloader
    # ./curl.nix                # network downloader
    ./bat.nix                 # `cat` alternative
    # TODO: ./delta.nix               # git diff viewer
    ./navi.nix                # interactive cheatsheet
    # TODO: ./starship.nix            # shell prompt
  ];

  environment.systemPackages = with pkgs; [
    nix-info
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
    system-info = "nix-info -m";
    nix-info    = "nix show-config";
    doctor      = "doas nix config check";
    fonts       = "gnome-font-viewer";
    c           = "doas sh -c 'printf c > /proc/sysrq-trigger'";
    dump        = "coredumpctl";
    r           = "doas reboot now";
    s           = "doas shutdown now";
    p           = "doas poweroff -i";

    # Utilities
    v     = "nvim";         # neovim
    t     = "tldr";         # simplified
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
    sudo             = "doas";
    please           = "doas";
    lynis-security   = "doas lynis audit system";
    systemd-security = "systemd-analyze security";
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