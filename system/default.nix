{ lib, config, ... }:

let
  importAll = dir:
    let
      entries = builtins.attrNames (builtins.readDir dir);
    in
      builtins.concatLists (map (name:
        let path = dir + "/" + name;
        in if builtins.isDirectory path
           then importAll path
           else if lib.strings.hasSuffix ".nix" name
                then [ (import path) ]
                else []
      ) entries);
in
{ imports = importAll ./.; }