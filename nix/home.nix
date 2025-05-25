{ pkgs, inputs, system, nixVersion, userName, homePath, ... }: {
  imports = [
    ./global.nix
    ../ghostty
    ../hyprland
    ../hyprpaper
    ../kitty
    ../lazygit
    ../mpv
    ../nvim
    ../tmux
    ../waybar
    ../wezterm
    ../xremap
    ../yazi
    ../zsh
  ];

  home = {
    username = userName;
    homeDirectory = homePath;
    stateVersion = nixVersion;

    packages = with pkgs; [
      brave
      # google-chrome
      # firefox
      inputs.zen-browser.packages.${system}.default
      cava
      cargo
      ghostty
      motrix
      obsidian # note taking app
      rofi-wayland
      wl-clipboard # for copy clipboard
      gcc # c compiler usefull or many things
      tmux # overrided to 3.4, because of the latest version has special key problems
      imagemagick # for support images on terminal/neovim editor
      vscode
      unzip # extrac zip
      # clickup # project management apps
      # telegram-desktop # telegram desktop
      # whatsapp-for-linux # whatsapp desktop
      fd # file finder
      ripgrep
      mpv # all types of video player
      gnumake42 # for luasnip make for nvim cmp
      gradle_8 # java project
      zoxide
      waybar # status line
      bc # basic calculator for hyprland scripts
      wpsoffice
      # hyprlandPlugins.hy3

      # language servers
      # jdt-language-server
      # jdk23 # java language
      # go # go language
      python3 # python version 3 (installed for neovim pylint linter)
      pnpm # for neovim plugin (live server)
      luarocks # (installed for neovim luacheck linter)
      lua51Packages.lua # most needed lua package. version 5.1
      nodejs_22 # nodejs_23 has some problem for "node-debug2-adapter"

      # fonts installation
      noto-fonts
      # noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      times-newer-roman
      # nerd-fonts.zed-mono

      qbittorrent
      # kdePackages.kcalc
      kdePackages.dolphin
      gnome-calculator
      google-chrome
    ];

    file = { };

    sessionVariables = { };

    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 64;
    };
  };

  programs = {
    home-manager = { enable = true; };
    git = {
      enable = true;
      userName = "rumman02";
      userEmail = "126387776+rumman02@users.noreply.github.com";
      extraConfig = { init = { defaultBranch = "main"; }; };
    };
  };

  fonts = { fontconfig = { enable = true; }; };

}
