{ ... }:

let
  starshipSettings = {
    add_newline = false;
    format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    shlvl = {
      disabled = false;
      symbol = "ﰬ";
    };
    git_branch = {
      symbol = " ";
    };
    git_commit = {
      symbol = "";
      style = "bold yellow";
    };
    git_state = {
      ahead = "⇡";
      behind = "⇣";
      diverged = "⇕";
      untracked = "…";
      staged = "✓";
      renamed = "➜";
      unmerged = "≠";
      dirty = "✗";
      style = "bold red";
    };
    git_status = {
      added = "✚";
      modified = "✹";
      deleted = "✖";
      renamed = "➜";
      untracked = "…";
      style = "bold yellow";
    };
    directory = {
      style = "bold blue";
      read_only = " ";
      truncate_to_repo = true;
      max_len = 3;
    };
    jobs = {
      symbol = " ";
      style = "bold green";
    };
    cmd_duration = {
      enabled = true;
      min_time = 1000;
      format = "took [$duration]($style)";
      style = "bold red";
    };
    character = {
      symbol = "❯";
      style = "bold cyan";
      use_symbol_for_newline = true;
    };
  };
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    settings = starshipSettings;
  };
}