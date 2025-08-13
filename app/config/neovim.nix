{ config, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
    ];

    extraConfig = ''
      nnoremap <Tab> <Esc>
      vnoremap <Tab> <Esc>
      inoremap <Tab> <Esc>

      set number relativenumber

      syntax enable
      colorscheme tokyonight-nvim
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}