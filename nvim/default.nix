{ lib, ... }: {
  home = {
    file = {
      ".config/nvim" = {
        source = lib.cleanSourceWith {
          src = ./.;
          filter = path: type:
            !(lib.hasSuffix ".nix" path || lib.hasSuffix "lazy-lock.json" path);
        };
        recursive = true;
      };

    };
    activation = {
      myCommand = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ln ~/.dotfiles/nvim/lazy-lock.json ~/.config/nvim
      '';
    };
  };
}

