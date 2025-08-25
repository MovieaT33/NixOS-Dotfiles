{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      monet-nvim
      lualine-nvim
      nvim-web-devicons
    ];

    extraLuaConfig = ''
      -- Basic options
      vim.o.number = true
      vim.o.relativenumber = true
      vim.o.termguicolors = true

      -- Theme
      require("monet").setup {
        dark_mode = true,
      }
      vim.cmd.colorscheme("monet")

      -- Statusline with full mode names
      require("lualine").setup {
        options = {
          theme = "auto",
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