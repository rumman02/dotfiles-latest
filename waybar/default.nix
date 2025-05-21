{ lib, ... }:
let
  waybarDir = ./.; # hyprpaper file directory (this directory)
  waybarFiles = builtins.attrNames (builtins.readDir waybarDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/waybar/${fileName}" = {
        source = "${waybarDir}/${fileName}";
        recursive = true;
      };
    }) waybarFiles);
  };
}
