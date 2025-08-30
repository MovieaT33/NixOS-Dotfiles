{ ... }:

{
  programs.ccache = {
    enable = true;
    packageNames = [ "linux_hardened" ];    # TODO: Check
  };
}