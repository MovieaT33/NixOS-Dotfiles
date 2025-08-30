{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    extraOptions = [
      "--long"
      "--grid"
      "--all"
      "--group-directories-first"
      "--group"
      "--header"
      "--links"
      "--inode"
      "--mounts"
      "--flags"
      "--blocksize"
      "--total-size"
      "--octal-permissions"
    ];
    icons = "auto";
    git = true;
  };
}