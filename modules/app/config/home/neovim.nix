{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox
    ];

    extraConfig = ''
      set number relativenumber
      syntax enable
      colorscheme gruvbox

      hi Normal     guibg=NONE
      hi StatusLine guibg=NONE
      hi LineNr     guibg=NONE
      hi VertSplit  guibg=NONE

      nnoremap <Tab> <Esc>
      vnoremap <Tab> <Esc>
      inoremap <Tab> <Esc>
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}