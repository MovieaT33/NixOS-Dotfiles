{ home-manager, ... }:

{
  home-manager.users.mvt33 = import ./home-modules/zsh.nix;
}