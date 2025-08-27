{ ... }:

{
  imports = [ ./eza.nix ]; 

  programs.zsh = {
    enable = true;
    shellAliases = {
      sudo = "doas";
      l  = "exa -l --icons --git-ignore";
      ls = "exa -lG --icons -a --group-directories-first -ghHiMOS --total-size -o --git";
      L  = "exa -lG --icons -a --group-directories-first -ghHiMOS --total-size -o --git -Z";

      v  = "nvim";

      # Cryptsetup
      luks-add =    "sudo cryptsetup luksAddKey /dev/vda2";
      luks-remove = "sudo cryptsetup luksRemoveKey /dev/vda2";

      # Security
      security       = "systemd-analyze security";
      lynis-security = "sudo lynis audit system";

      # Nix
      info = "nix-info -m";

      # Dotfiles
      d  =  "cd /etc/nixos";
      j  =  "just";
      dj = "cd /etc/nixos; just";

      ddd = "cd /etc/nixos; just";
      D   = "cd /etc/nixos; just";

      # System
      r = "sudo reboot now";
      s = "sudo shutdown now";
    };

    ohMyZsh = {
      enable = true;

      theme = "afowler";
      plugins = [ "git" ];
    };
  };
}