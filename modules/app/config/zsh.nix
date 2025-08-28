{ pkgs, ... }:

{
  imports = [ ./eza.nix ]; 
  environment.systemPackages = with pkgs; [ atuin ];  # Atuin

  programs.zsh = {
    enable = true;
    shellAliases = {
      # Utilities
      l  = "exa -l --icons --git-ignore";
      ll = "exa -lG --icons -a --group-directories-first -ghHiMOS --total-size -o --git";
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
      p           = "sudo systemctl poweroff -i";
    };

    ohMyZsh = {
      enable = true;
      theme = "afowler";
      plugins = [ "git" ];
    };

    # FIXME: Do not work correctly
    interactiveShellInit = ''
      eval "$(atuin init zsh)"
    '';
  };
}