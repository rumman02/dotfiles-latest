{ lib, ... }:
let
  weztermDir = ./.; # wezterm file directory (this directory)
  weztermFiles = builtins.attrNames (builtins.readDir weztermDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/wezterm/${fileName}" = {
        source = "${weztermDir}/${fileName}";
        recursive = true;
      };
    }) weztermFiles);
  };
}
