{ config, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

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

  environment.variables.EDITOR = "nvim";
}