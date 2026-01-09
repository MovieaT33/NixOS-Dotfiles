{ home, pkgs, ... }:

{
  home.file = {
    ".config/nvim" = {
      recursive = true;
      source = "../../dotfiles/nvim";
    };
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withPython3 = true;
      withNodeJs = true;
    };
  };

  home = {
    packages = with pkgs; [
      gcc
      go
      # FIXME: `make`
      neovide

      # nix
      nil # Language Server
      statix # Lints and suggestions
      deadnix # Find and remove unused
      alejandra # Code Formatter

      # lua
      luarocks

      # ts
      typescript

      gdu
      ripgrep
    ];
  };

  # FIXME: Do not work correctly
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}