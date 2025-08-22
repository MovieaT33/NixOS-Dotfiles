{ config, ... }:

{
  imports = [ ./eza.nix ]; 

  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "exa -l --icons";
      ls = "exa -la --icons";

      # NixOS config
      s = "cd /etc/nixos";
      j = "just";
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