{ config, pkgs, username, ... }:
{
	home = {
		username = username;
		homeDirectory = "/home/${username}";
		packages = with pkgs; [
			brave
			cava
			discord
			ghostty
			motrix
			nautilus
			obsidian
			rofi-wayland
			wl-clipboard
			gcc
			pnpm
			argo
		];
		file = {
				# ".config/nvim/init.lua".source = ../nvim/init.lua;
				".zshrc".source = ../zsh/.zshrc;
		};
		sessionVariables = {
		};
		stateVersion = "24.11";
	};

	programs = {
		home-manager = {
			enable = true;
		};
		git = {
			enable = true;
			userName = "rumman02";
			userEmail = "126387776+rumman02@users.noreply.github.com";
			extraConfig = {
				init = {
					defaultBranch = "main";
				};
				safe = {
					directory = [ # those path which not included into git
						# "/etc/nixos"
						# "/home/rumman/.dotfiles"
					];
				};
			};
		};
	};

	xdg = {
		configFile = { # this is for those configuration which is live in .config file
			"ghostty" = {
			  source = ../ghostty;
			};
			# "nvim" = {
			#   source = ../nvim;
			# };
			"hypr" = {
			  source = ../hyprland;
			};
		};
	};
}
