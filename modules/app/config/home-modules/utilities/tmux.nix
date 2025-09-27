{ pkgs, ... }:

{
  # TODO: Update tmux configuration
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    historyLimit = 10000;
    clock24 = true;
    extraConfig = ''
      # Use 256 colors
      set -g default-terminal "screen-256color"

      set  -g mouse on
      setw -g mode-keys vi
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      # Clock mode
      setw -g clock-mode-colour yellow

      # Copy mode
      setw -g mode-style 'fg=black bg=red bold'

      # Panes
      set -g pane-border-style 'fg=red'
      set -g pane-active-border-style 'fg=yellow'

      # Statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style 'fg=red'

      set -g status-left ""
      set -g status-left-length 10

      set -g status-right-style 'fg=black bg=yellow'
      set -g status-right '%Y-%m-%d %H:%M '
      set -g status-right-length 50

      setw -g window-status-current-style 'fg=black bg=red'
      setw -g window-status-current-format ' #I #W #F '

      setw -g window-status-style 'fg=red bg=black'
      setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '

      setw -g window-status-bell-style 'fg=yellow bg=red bold'

      # Messages
      set -g message-style 'fg=yellow bg=red bold'
    '';
  };
}