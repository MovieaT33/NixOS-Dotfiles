{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      lualine-nvim
      nvim-web-devicons
    ];

    extraLuaConfig = ''
      -- Basic options
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.termguicolors = true

      -- Theme
      require("catppuccin").setup({
        flavour = "mocha",
        -- show_end_of_buffer = false,
        term_colors = false,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        },
      })

      vim.cmd.colorscheme("catppuccin")

      -- Transparent background 
      vim.cmd [[
        hi Normal      guibg=NONE
        hi NormalNC    guibg=NONE
        hi NormalFloat guibg=NONE
        hi FloatBorder guibg=NONE
      ]]

      require("lualine").setup {
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return ({
                  ["NORMAL"]   = "NORMAL",
                  ["INSERT"]   = "INSERT",
                  ["VISUAL"]   = "VISUAL",
                  ["V-LINE"]   = "VISUAL LINE",
                  ["V-BLOCK"]  = "VISUAL BLOCK",
                  ["REPLACE"]  = "REPLACE",
                  ["COMMAND"]  = "COMMAND",
                  ["TERMINAL"] = "TERMINAL",
                })[str] or str
              end,
            },
          },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    '';
  };

  # FIXME: Do not work correctly
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}