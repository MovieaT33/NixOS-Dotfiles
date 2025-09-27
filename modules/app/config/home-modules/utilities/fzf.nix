{ ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    tmux.enableShellIntegration = true;
  };
}