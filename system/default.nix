let
  importDir = dir: 
    let
      entries = builtins.attrNames (builtins.readDir dir);
      nixFiles = builtins.filter (name: builtins.match ".+\\.nix$" name != null) entries;
      dirs = builtins.filter (name: builtins.pathExists (dir + "/" + name) && builtins.isDirectory (dir + "/" + name)) entries;
    in
      builtins.listToAttrs (
        (map (name: { name = name; value = import (dir + "/" + name); }) nixFiles) ++
        (map (name: { name = name; value = importDir (dir + "/" + name); }) dirs)
      );
in
  importDir ./. 