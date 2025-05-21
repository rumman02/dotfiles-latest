{ lib, ... }:
let
  tmuxDir = ./.; # tmux file directory (this directory)
  tmuxFiles = builtins.attrNames (builtins.readDir tmuxDir);
in {
  home = {
    file = lib.mkMerge (map (fileName: {
      ".config/tmux/${fileName}" = {
        source = "${tmuxDir}/${fileName}";
        recursive = true;
      };
    }) tmuxFiles);
  };

  nixpkgs.overlays = [
    (final: prev: {
      tmux = prev.tmux.overrideAttrs (old: {
        src = prev.fetchFromGitHub {
          owner = "tmux";
          repo = "tmux";
          rev = "3.4";
          # if you don't know the hash, just run for the first time as (hash = "")
          # after that in the terminal you will see the
          # got: sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
          # take it and put into the hash = value
          hash = "sha256-RX3RZ0Mcyda7C7im1r4QgUxTnp95nfpGgQ2HRxr0s64=";
        };
      });
    })
  ];
}
