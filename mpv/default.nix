{ lib, ... }:
let
  mpvDir = ./.; # mpv file directory (this directory)
  mpvFiles = builtins.attrNames (builtins.readDir mpvDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/mpv/${fileName}" = {
        source = "${mpvDir}/${fileName}";
        recursive = true;
      };
    }) mpvFiles);
  };
}
