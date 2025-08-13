let
  importDir = dir:
    let
      entries = builtins.readDir dir;
    in
      builtins.listToAttrs (
        [ for name in builtins.attrNames entries
          : { name = builtins.replaceStrings [".nix"] [""] name;
              value = import (dir + "/${name}");
            }
          | entries.${name} == "regular"
          && name != "default.nix"
          && builtins.match ".*\\.nix$" name != null
        ]
        ++
        [ for name in builtins.attrNames entries
          : { name = name; value = importDir (dir + "/${name}"); }
          | entries.${name} == "directory"
        ]
      );
in
  importDir ./. 