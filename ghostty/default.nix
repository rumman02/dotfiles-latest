{ lib, ... }:
let
  ghosttyDir = ./.; # ghostty file directory (this directory)
  ghosttyFiles = builtins.attrNames (builtins.readDir ghosttyDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/ghostty/${fileName}" = {
        source = "${ghosttyDir}/${fileName}";
        recursive = true;
      };
    }) ghosttyFiles);
  };
}
