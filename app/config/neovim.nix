{ config, ... }:

{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        inoremap <Tab> <Esc>
        set number
        syntax on
      '';
  };
}