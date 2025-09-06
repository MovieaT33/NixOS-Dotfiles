{ ... }:

let
  nixosDir   = "/etc/nixos";
in
{
  imports = [
    ./atuin.nix
    ./zoxide.nix              # `cd` alternative
    ./eza.nix                 # `ls` alternative
    ./command-not-found.nix
    ./git.nix                 # git configuration
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
    fonts       = "gnome-font-viewer";
    c           = "doas sh -c 'printf c > /proc/sysrq-trigger'";
    r           = "doas reboot now";
    s           = "doas shutdown now";
    p           = "doas poweroff -i";

    # Utilities
    v     = "nvim";         # neovim
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

  # home.file.".oh-my-zsh/custom/themes/headline.zsh-theme".text = builtins.readFile ../dotfiles/oh-my-zsh/headline.zsh-theme;

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