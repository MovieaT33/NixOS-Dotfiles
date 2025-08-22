{ inputs, ... }: let
   modulesPath = "${inputs.nixpkgs}/nixos/modules";
in {
  imports = [ "${modulesPath}/profiles/hardened.nix" ];
}