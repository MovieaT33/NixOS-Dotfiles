{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Aliases
    viAlias = true;
    vimAlias = true;

    # Plugins
    plugins = with pkgs.vimPlugins; [
      gruvbox
    ];

    # Config
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

  # FIXME: Check if this really work correctly
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}