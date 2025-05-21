{ lib, ... }:
let
  zshDir = ./.; # nvim file directory (this directory)
  zshFiles = builtins.attrNames (builtins.readDir zshDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      "${fileName}" = {
        source = "${zshDir}/${fileName}";
        recursive = true;
      };
    }) zshFiles);
  };
}

