{ config, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      nnoremap <Tab> <Esc>
      vnoremap <Tab> <Esc>
      inoremap <Tab> <Esc>

      set number relativenumber
      syntax on
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}