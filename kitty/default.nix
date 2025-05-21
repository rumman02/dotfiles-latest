{ lib, ... }:
let
  kittyDir = ./.; # kitty file directory (this directory)
  kittyFiles = builtins.attrNames (builtins.readDir kittyDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/kitty/${fileName}" = {
        source = "${kittyDir}/${fileName}";
        recursive = true;
      };
    }) kittyFiles);
  };
}
