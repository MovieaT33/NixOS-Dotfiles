{ ... }:

let
  luksDevice = "/dev/vda2";
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

    # Cryptsetup
    luks-add    = "doas cryptsetup luksAddKey    ${luksDevice}";  # add a new key  (rotate periodically)
    luks-remove = "doas cryptsetup luksRemoveKey ${luksDevice}";  # remove old key (rotate periodically)

    # Security
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