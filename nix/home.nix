{ pkgs, inputs, system, nixVersion, userName, homePath, ... }: {
    imports = [ ./global.nix ./config_files.nix ];

    home = {
        username = userName;
        homeDirectory = homePath;
        stateVersion = nixVersion;

        packages = with pkgs; [
            # browsers
            brave
            # google-chrome
            # firefox
            inputs.zen-browser.packages.${system}.default
            google-chrome

            # tools
            cava
            cmatrix
            motrix
            obsidian # note taking app
            vscode
            wpsoffice
            mpv # all types of video player
            qbittorrent
            # kdePackages.kcalc
            kdePackages.dolphin
            gnome-calculator
            # clickup # project management apps
            # telegram-desktop # telegram desktop
            # whatsapp-for-linux # whatsapp desktop
            # NOTE: checkout leter (Mouseless linux)
            # wl-kbptr
            # wlrctl
            xdg-user-dirs

            # terminal
            ghostty
            tmux
            fd # file finder
            ripgrep
            bc # basic calculator for hyprland scripts
            zoxide
            imagemagick # for support images on terminal/neovim editor
            unzip # extrac zip

            # window manager
            rofi-wayland
            wl-clipboard # for copy clipboard
            hyprlandPlugins.hy3
            hyprpaper
            waybar # status line

            # language servers
            # jdt-language-server
            # jdk23 # java language
            # go # go language
            python3 # python version 3 (installed for neovim pylint linter)
            pnpm # for neovim plugin (live server)
            luarocks # (installed for neovim luacheck linter)
            lua51Packages.lua # most needed lua package. version 5.1
            nodejs_22 # nodejs_23 has some problem for "node-debug2-adapter"
            gradle_8 # java project

            # builder
            cargo
            gcc # c compiler usefull or many things
            gnumake42 # for luasnip make for nvim cmp

            # fonts
            noto-fonts
            # noto-fonts-cjk-sans
            noto-fonts-emoji
            font-awesome
            nerd-fonts.lilex
            nerd-fonts.noto
            nerd-fonts.jetbrains-mono
            nerd-fonts.iosevka
            times-newer-roman
            # nerd-fonts.zed-mono
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
        git = {
            enable = true;
            userName = "rumman02";
            userEmail = "126387776+rumman02@users.noreply.github.com";
            extraConfig = { init = { defaultBranch = "main"; }; };
        };
    };

    fonts = { fontconfig = { enable = true; }; };

    # if you don't know the hash, just run for the first time as (hash = "")
    # after that in the terminal you will see the
    # got: sha256-173gxk0ymiw94glyjzjizp8bv8g72gwkjhacigd1an09jshdrjb4
    # take it and put into the hash = value
    nixpkgs = {
        overlays = [
            (final: prev: {
                tmux = prev.tmux.overrideAttrs (old: {
                    src = prev.fetchFromGitHub {
                        owner = "tmux";
                        repo = "tmux";
                        rev = "3.4";
                        hash = "sha256-RX3RZ0Mcyda7C7im1r4QgUxTnp95nfpGgQ2HRxr0s64=";
                    };
                });
            })
        ];
    };

}
