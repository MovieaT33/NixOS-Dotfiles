{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--long"
      "--grid"
      "--all"
      "--group-directories-first"
      "--group"
      "--header"
      "--links"
      "--inode"
      "--mounts"
      "--flags"
      "--blocksize"
      "--total-size"
      "--octal-permissions"
    ];
    icons = "auto";
    git = true;
  };

  imports = [
    ./zoxide.nix
    ./command-not-found.nix
  ];

  # TODO: Update aliases
  home.shellAliases = {
    # Utilities
    # l  = "exa -lG --icons -git-ignore";
    # ll = "exa -lG --icons -a --group-directories-first --git";
    # ls = "exa -lG --icons -a --group-directories-first -ghHiMOS --total-size -o --git";
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