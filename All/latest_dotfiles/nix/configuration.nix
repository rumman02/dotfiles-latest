{ config, pkgs, username, ... }: let
in
{
	imports = [
		./hardware-configuration.nix
	];

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-label/nixos";
			fsType = "ext4";
		};
		"/boot" = {
			device = "/dev/disk/by-label/BOOT";
			fsType = "vfat";
		};
		"/mnt/hdd" = {
			device = "/dev/sda1";
			fsType = "ntfs";
		};
	};

	swapDevices = [
		{ device = "/dev/disk/by-label/swap"; }
	];

	boot = {
		supportedFilesystems = [
			"ntfs"
		];
		loader = let
			configurationLimit = 10;
		in {
			timeout = 10;
			efi = {
				canTouchEfiVariables = true;
			};
			# systemd-boot = { # for systemd bootloader
			#   enable = true;
			#   inherit configurationLimit;
			# };
			grub = { # for grub bootloader
				enable = true;
				inherit configurationLimit;
				efiSupport = true;
				devices = [
					"nodev"
				];
				# useOSProber = true; # enables dual booting from grup bootloader
			};
		};
	};

	networking = {
		hostName = "nixos";
		wireless = { # Enables wireless support via wpa_supplicant.
			enable = false;
		};
		networkmanager = { # Easiest to use and most distros use this by default.
			enable = true;
		};
		# proxy = { # Configure network proxy if necessary
		# 	default = "http://user:password@proxy:port/";
		# 	noProxy = "127.0.0.1,localhost,internal.domain";
		# };
		# firewall = {
		# 	enable = true;
		# 	allowedTCPPorts = [ ... ];
		# 	allowedUDPPorts = [ ... ];
		# };
	};

	time = {
		timeZone = "Asia/Dhaka"; # Set your time zone.
	};


	# Select internationalisation properties.
	# i18n.defaultLocale = "en_US.UTF-8";
	# console = {
	# 	font = "Lat2-Terminus16"; # some pre-defined fonts can be found in "/etc/kbd/consolefonts"
	# 	keyMap = "us";
	# 	useXkbConfig = true; # use xkb.options in tty.
	# };

	services = {
		xserver = {
			enable = true;
			xkb = {
				layout = "us";
				# options = "eurosign:e,caps:escape";
			};
		};
		displayManager = { # setup displayManager
			sddm = {
				enable = true;
			};
			defaultSession = "hyprland";
		};
		pipewire = { # enables sound by pipewire
			enable = true;
			pulse = {
				enable = true;
			};
		};
		# printing = { # Enable CUPS to print documents.
		# 	enable = true;
		# };
		# libinput = { # Enable touchpad support (enabled default in most desktopManager).
		# 	enable = true;
		# };
		# openssh = {
		# 	enable = true; # enable the openSSH deamon
		# };
	};

	hardware = {
		bluetooth = {
			enable = true;
		};
		# pulseaudio = {
		# 	enable = true;
		# };
	};

	users = {
		users = let
			shell = pkgs.zsh;
			initialPassword = "password";

		in {
			root = { # Don't forget to set a password with ‘passwd’.
				inherit shell;
				isNormalUser = false;
				inherit initialPassword;
			};
			${username} = { # Don't forget to set a password with ‘passwd <username>’.
				# description = "";
				inherit shell;
				isNormalUser = true;
				# home = "/home/";
				inherit initialPassword;
				extraGroups = [ # Enable ‘sudo’ for the user, means you don't need to input password for this list groups
					"wheel"
					"flake"
				];
				# packages = with pkgs; [
				# 	brave
				# ];
			};
		};
	};

	programs = {
		# firefox = {
		# 	enable = true;
		# };
		hyprland = {
			enable = true;
		};
		zsh = {
			enable = true;
		};
		# mtr = { # some programs need SUID wrappers, can be configured further or are started in user sessions
		#   enable = true;
		# };
		# gnupg = { # GPG agent for managing encryption, signing, managing cryptographic keys
		#   enable = true;
		#   enableSSHSupport = true;
		# };
	};

	fonts = {
		packages = with pkgs; [
			# noto-fonts
			# noto-fonts-cjk-sans
			# noto-fonts-emoji
			jetbrains-mono
			iosevka
			# nerdfonts
			# nerd-fonts.jetbrains-mono # not available yet "nixos-25.05"
			# nerd-fonts.iosevka # not available yet "nixos-25.05"
		];
		fontDir = {
			enable = true; # enables create a font directory
		};
		# fontconfig = {
		#   useEmbeddedBitmaps = true; # found in "https://nixos.wiki/wiki/Fonts" and this settings for "Noto color emoji doesn't render on firefox
		# };
	};

	# $ nix search wget
	environment = {
		systemPackages = with pkgs; [
			btop
			fzf
			git
			home-manager
			kitty
			neofetch
			neovim
			tree
			yazi
			# wget
		];
	};
	system = {
		# copySystemConfiguration = true; # copies nixos configuration file into "/run/current-system/configuration.nix"
		stateVersion = "24.11";
		autoUpgrade = {
			enable = true;
			allowReboot = true;
		};
	};
	nixpkgs = {
		config = {
			allowUnfree = true;
		};
	};
	nix = {
		settings = {
			experimental-features = [
				"nix-command"
				"flakes"
			];
		};
	};
}
