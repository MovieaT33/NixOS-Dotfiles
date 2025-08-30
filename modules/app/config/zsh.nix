{ home-manager, ... }:

{
  imports = [ ./eza.nix ];

  home-manager.users.mvt33 = import ./home-modules/zsh.nix;
}