{ config, ... }:

{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        nnoremap <Tab> <Esc>
        vnoremap <Tab> <Esc>
        inoremap <Tab> <Esc>

        set number
        syntax on
      '';
    };
  };
}