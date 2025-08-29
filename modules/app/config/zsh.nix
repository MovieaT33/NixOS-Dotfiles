{ home-manager, ... }:

{
  imports = [ ./eza.nix ];
  home-manager.users.mvt33 = import ./home/zsh.nix;
}