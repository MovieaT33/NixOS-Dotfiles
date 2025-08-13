{ config, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      j = "just";
    };
  };
}