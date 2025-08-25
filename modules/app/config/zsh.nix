{ ... }:

{
  imports = [ ./eza.nix ]; 

  programs.zsh = {
    enable = true;
    shellAliases = {
      sudo = "doas";
      l  = "exa -l --icons";
      ls = "exa -laGhh --icons --group-directories-first --octal-permissions";
      v  = "nvim";

      # Cryptsetup
      luks-add =    "sudo cryptsetup luksAddKey /dev/vda2";
      luks-remove = "sudo cryptsetup luksRemoveKey /dev/vda2";

      # Security
      security       = "systemd-analyze security";
      lynis-security = "sudo lynis audit system";

      # System
      r = "sudo reboot now";
      s = "sudo shutdown now";

      # Dotfiles
      d  =  "cd /etc/nixos";
      j  =  "just";
      dj = "cd /etc/nixos; just";

      ddd = "cd /etc/nixos; just";
      D   = "cd /etc/nixos; just";
    };

    ohMyZsh = {
      enable = true;

      theme = "afowler";
      plugins = [ "git" ];
    };
  };
}