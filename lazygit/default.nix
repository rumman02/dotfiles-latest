{ lib, ... }:
let
  lazygitDir = ./.; # lazygit file directory (this directory)
  lazygitFiles = builtins.attrNames (builtins.readDir lazygitDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/lazygit/${fileName}" = {
        source = "${lazygitDir}/${fileName}";
        recursive = true;
      };
    }) lazygitFiles);
  };
}
