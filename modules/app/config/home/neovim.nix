{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Aliases
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Plugins
    plugins = with pkgs.vimPlugins; [
      gruvbox-material
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      mini-nvim
    ];

    extraLuaConfig = ''
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.termguicolors = true
      vim.cmd.colorscheme("gruvbox-material")

      vim.cmd [[
        hi Normal     guibg=NONE
        hi StatusLine guibg=NONE
        hi LineNr     guibg=NONE
        hi VertSplit  guibg=NONE
      ]]

      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true }
      }

      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup {}
      lspconfig.tsserver.setup {}

      -- Mini.nvim (example: statusline)
      require("mini.statusline").setup()
    '';
  };

  # FIXME: Do not work correctly
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}