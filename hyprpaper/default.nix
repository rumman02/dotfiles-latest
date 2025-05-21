{ lib, ... }:
let
  hyprpaperDir = ./.; # hyprpaper file directory (this directory)
  hyprpaperFiles = builtins.attrNames (builtins.readDir hyprpaperDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/hypr/${fileName}" = {
        source = "${hyprpaperDir}/${fileName}";
        recursive = true;
      };
    }) hyprpaperFiles);
  };
  services = { hyprpaper = { enable = true; }; };
}
