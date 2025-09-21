{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inetutils
    # mprocs
    tty-clock
  ];
}