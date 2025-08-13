let
  dropNix = name:
    let m = builtins.match "^(.*)\\.nix$" name;
    in if m == null then name else builtins.elemAt m 0;

  importDir = dir:
    let
      listing = builtins.readDir dir;
      names   = builtins.attrNames listing;

      nixFiles = builtins.filter (n:
        listing.${n} == "regular"
        && builtins.match ".*\\.nix$" n != null
        && n != "default.nix"
      ) names;

      subdirs = builtins.filter (n: listing.${n} == "directory") names;
    in
      builtins.listToAttrs (
        (map (n: { name = dropNix n; value = import (dir + "/${n}"); }) nixFiles)
        ++
        (map (d: { name = d; value = importDir (dir + "/${d}"); }) subdirs)
      );
in
  importDir ./. 