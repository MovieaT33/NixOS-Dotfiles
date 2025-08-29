{ ... }:

{
  imports = [ ./command-not-found.nix ];

  home.shellAliases = {
    # Utilities
    l  = "exa -l --icons --group-directories-first --git-ignore";
    ll = "exa -lG --icons -a --group-directories-first --git";
    ls = "exa -lG --icons -a --group-directories-first -ghHiMOS --total-size -o --git";
    v  = "nvim";

    # Atuin
    stats = "atuin stats";

    # Cryptsetup
    luks-add    = "sudo cryptsetup luksAddKey /dev/vda2";     # add a new key  (rotate periodically)
    luks-remove = "sudo cryptsetup luksRemoveKey /dev/vda2";  # remove old key (rotate periodically)

    # Security
    sudo             = "doas";
    lynis-security   = "sudo lynis audit system";
    systemd-security = "systemd-analyze security";

    # Dotfiles
    d  =  "cd /etc/nixos";
    j  =  "just";
    D  = "cd /etc/nixos; just";
    dj = "cd /etc/nixos; just";

    # System and Nix
    system-info = "nix-info -m";
    nix-info    = "nix show-config";
    r           = "sudo reboot now";
    s           = "sudo shutdown now";
    p           = "sudo poweroff -i";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

    oh-my-zsh = {
      enable  = true;
      theme   = "afowler";
      plugins = [ "git" "sudo" ];
    };
  };

  programs.atuin.enable = true;
}