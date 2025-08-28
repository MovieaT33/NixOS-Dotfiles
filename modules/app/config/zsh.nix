{ ... }:

{
  imports = [ ./atuin.nix ./eza.nix ]; 

  programs.zsh = {
    enable = true;
    shellAliases = {
      # Utilities
      l  = "exa -l --icons --git-ignore";
      ll = "exa -lG --icons -a --group-directories-first -ghHiMOS --total-size -o --git";
      v  = "nvim";

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

      # System
      system-info = "nix-info -m";
      r           = "sudo reboot now";
      s           = "sudo shutdown now";
    };

    ohMyZsh = {
      enable = true;
      theme = "afowler";
      plugins = [ "git" ];
    };

    shellInit = ''
      eval "$(atuin init zsh)"
    '';
  };
}