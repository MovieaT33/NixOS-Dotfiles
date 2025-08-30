{ ... }:

{
  imports = [
    ./zoxide.nix              # `cd` alternative
    ./eza.nix                 # `ls` alternative
    ./command-not-found.nix
    ./git.nix                 # git configuration
  ];

  # TODO: Update aliases
  home.shellAliases = {
    # Utilities
    v  = "nvim";

    # Atuin
    stats = "atuin stats";

    # Cryptsetup
    luks-add    = "doas cryptsetup luksAddKey /dev/vda2";     # add a new key  (rotate periodically)
    luks-remove = "doas cryptsetup luksRemoveKey /dev/vda2";  # remove old key (rotate periodically)

    # Security
    sudo             = "doas";
    lynis-security   = "doas lynis audit system";
    systemd-security = "systemd-analyze security";

    # Dotfiles
    d  = "cd /etc/nixos";
    j  = "just";
    D  = "cd /etc/nixos; just";
    dj = "cd /etc/nixos; just";

    # System and Nix
    system-info = "nix-info -m";
    nix-info    = "nix show-config";
    fonts       = "gnome-font-viewer";
    c           = "doas sh -c 'printf c > /proc/sysrq-trigger'";
    r           = "doas reboot now";
    s           = "doas shutdown now";
    p           = "doas poweroff -i";
  };

  programs.zsh = {
    enable = true;

    localVariables = {
      HISTFILE = "/dev/null";
    };

    autosuggestion.enable = true;

    oh-my-zsh = {
      enable  = true;
      theme   = "afowler";
      plugins = [ "git" "sudo" ];
    };
  };

  programs.atuin.enable = true;
}