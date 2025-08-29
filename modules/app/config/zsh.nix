{ home-manager, ... }:

{
  imports = [ ./eza.nix ];

  # Home-manager
  home-manager.users.mvt33 = 
    (import ./home-manager/zsh.nix) // (./home-manager/command-not-found.nix;)
}