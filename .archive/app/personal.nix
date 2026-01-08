{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inetutils
    mprocs
    procs
    tealdeer
    curlie
    tty-clock
  ];
}