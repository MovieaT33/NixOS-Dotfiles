{ ... }:

{
  # FIXME: Check if actually work
  boot.extraModprobeConfig = ''
    install tipc true
    install sctp true
    install dccp true
    install rds  true
  '';
}