{ lib, pkgs, ... }: {
  home = {
    file = {
      ".zshrc" = {
        source = ../zsh/.zshrc;
        recursive = true;
      };
    };

    activation = {
      nvim_lazy_lock = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [ -f "$HOME/.dotfiles/nvim/lazy-lock.json" ]; then
           ln -sf "$HOME/.dotfiles/nvim/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"
         fi
      '';
    };
  };
  xdg = {
    configFile = {
      ghostty = {
        source = ../ghostty;
        recursive = true;
      };
      hypr = {
        source = pkgs.buildEnv {
          name = "hypr";
          paths = [ ../hypr/hyprland ../hypr/hyprpaper ];
          pathsToLink = [ "/" ];
        };
        recursive = true;
      };
      "hypr/scripts" = {
        source = ../scripts/hyprland;
        executable = true;
        recursive = true;
      };
      kitty = {
        source = ../kitty;
        recursive = true;
      };
      lazygit = {
        source = ../lazygit;
        recursive = true;
      };
      mpv = {
        source = ../mpv;
        recursive = true;
      };
      # nvim = {
      #   source = lib.cleanSourceWith {
      #     src = ../nvim;
      #     filter = path: type: !(lib.hasSuffix "lazy-lock.json" path);
      #   };
      #   recursive = true;
      # };
      tmux = {
        source = ../tmux;
        recursive = true;
      };
      waybar = {
        source = ../waybar;
        recursive = true;
      };
      wezterm = {
        source = ../wezterm;
        recursive = true;
      };
      xremap = {
        source = ../xremap;
        recursive = true;
      };
      yazi = {
        source = ../yazi;
        recursive = true;
      };
    };
  };
}
