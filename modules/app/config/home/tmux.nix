{ ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set  -g mouse on
      setw -g mode-keys vi
      set  -g history-limit 10000
    '';
  };
}