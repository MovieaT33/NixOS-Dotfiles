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
      nnoremap <Tab> <Esc>
      vnoremap <Tab> <Esc>
      inoremap <Tab> <Esc>

      set number relativenumber

      syntax enable
      colorscheme gruvbox
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}