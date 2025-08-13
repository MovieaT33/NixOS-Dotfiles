{ config, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      inoremap <Tab> <Esc>
      set number
      syntax on
    '';
  };
}