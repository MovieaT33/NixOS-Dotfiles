{ config, ... }:

{
  imports = [ ./eza.nix ]; 

  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "exa -l --icons";
      ls = "exa -la --icons";
      j = "just";
    };

    ohMyZsh = {
      enable = true;

      theme = "afowler";
      plugins = [ "git" ];
    };

    # interactiveShellInit = ''
    #   command-not-found
    # '';
  };
}