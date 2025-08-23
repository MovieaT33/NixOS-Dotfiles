{ config, ... }:

{
  imports = [ ./eza.nix ]; 

  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "exa -l --icons";
      ls = "exa -laGhh --icons --group-directories-first --octal-permissions";

      v = "nvim";

      # NixOS dotfiles
      d = "cd /etc/nixos";
      j = "just";
      dj = "cd /etc/nixos; just";

      r = "sudo reboot now";
      s = "sudo shutdown now";
    };

    ohMyZsh = {
      enable = true;

      theme = "afowler";
      plugins = [ "git" ];
    };

    # TODO: add
    # interactiveShellInit = ''
    #   command-not-found
    # '';
  };
}