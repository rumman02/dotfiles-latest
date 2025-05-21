{ lib, ... }:
let
  xremapDir = ./.; # xremap file directory (this directory)
  xremapFiles = builtins.attrNames (builtins.readDir xremapDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/xremap/${fileName}" = {
        source = "${xremapDir}/${fileName}";
        recursive = true;
      };
    }) xremapFiles);
  };
}
