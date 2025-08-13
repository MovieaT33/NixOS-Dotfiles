let
  importDir = dir:
    let
      entries = builtins.readDir dir;
      names   = builtins.attrNames entries;

      nixFiles = builtins.filter (n:
        entries.${n} == "regular"
        && n != "default.nix"
        && builtins.match ".*\\.nix$" n != null
      ) names;

      dirs = builtins.filter (n: entries.${n} == "directory") names;

      importedFiles = map (n: {
        name  = builtins.replaceStrings [".nix"] [""] n;
        value = import (dir + "/" + n);
      }) nixFiles;

      importedDirs = map (n: {
        name  = n;
        value = importDir (dir + "/" + n);
      }) dirs;
    in
      if nixFiles == [] && dirs == [] then
        import dir
      else
        builtins.listToAttrs (importedFiles ++ importedDirs);
in
  importDir ./. 