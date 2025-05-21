{ lib, ... }:
let
  yaziDir = ./.; # yazi file directory (this directory)
  yaziFiles = builtins.attrNames (builtins.readDir yaziDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/yazi/${fileName}" = {
        source = "${yaziDir}/${fileName}";
        recursive = true;
      };
    }) yaziFiles);
  };
}

