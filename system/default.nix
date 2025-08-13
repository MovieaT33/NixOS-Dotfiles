{}
# { lib, config, ... }:
# 
# with lib; with builtins;
# 
# let
#   getDir = dir:
#     mapAttrs
#       (file: type: if type == "directory"
#                    then getDir (dir + "/" + file)
#                    else type)
#       (readDir dir);
# 
#   files = dir:
#     let
#       collectFiles = mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir);
#     in
#       builtins.attrValues collectFiles;
# 
#   nixFiles = dir:
#     map (file: dir + "/" + file)
#       (filter (file: hasSuffix ".nix" file) (files dir));
# 
# in
# { imports = nixFiles ./.; }