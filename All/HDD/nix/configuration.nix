# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
	channelVersion = "24.11";
	configurationLimit = 10;
in
{
	imports = [
		# Include the results of the hardware scan.
		./hardware-configuration.nix
	];

	# file system configurations
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
			fsType = "ntfs-3g";
		};
	};
	swapDevices = [
	  {
		  device = "/dev/disk/by-label/swap";
	  }
	];

	boot.supportedFilesystems = [ "ntfs" ];

	boot.loader = {
		efi.canTouchEfiVariables = true;
		timeout = 10;
	};

	# boot.loader.systemd-boot = {
	#   enable = true;
	#   configurationLimit = configurationLimit;
	# };

	boot.loader.grub = {
		enable = true;
		configurationLimit = configurationLimit;
		efiSupport = true;
		devices = [ "nodev" ];
		# useOSProber = true; # enables dual booting from grub boot loader
	};

	# network settings
	networking = {
			hostName = "nixos"; # Define your hostname (that is shown in router or networking device as your pc name)
			# wireless.enable = true;  # Enables wireless support via wpa_supplicant.
			networkmanager = {
			enable = true;  # Easiest to use and most distros use this by default.
		};
		firewall.enable = true;
	};

	# Set your time zone.
	time.timeZone = "Asia/Dhaka";

	# Select internationalisation properties.
	# i18n.defaultLocale = "en_US.UTF-8";
	# console = {
	# 	font = "Lat2-Terminus16";
	# 	keyMap = "us";
	# 	useXkbConfig = true; # use xkb.options in tty.
	# };

	# Enable the X11 windowing system.
	services = {
		xserver = {
			enable = true;
			xkb = {
				layout = "us";
				options = "caps:escape";
			};
		};
		displayManager = {
			sddm = {
				enable = true;
			};
			defaultSession = "hyprland";
		};
		printing = {
			enable = true;
		};
	};

	# Enable sound.
	# hardware.pulseaudio.enable = true;
	# OR
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	# enables bluetooth
	hardware.bluetooth.enable = true;

	# Enable touchpad support (enabled default in most desktopManager).
	# services.libinput.enable = true;
	
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.root = {
		isNormalUser = false;
		shell = pkgs.zsh;
		initialPassword = "password";
	};

	users.users.rumman = {
		description = "Rumman";
		home = "/home/rumman";
		initialPassword = "password";
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
		packages = with pkgs; [
			ghostty
			google-chrome
			cava
			motrix
			bibata-cursors # cursor theme
			nwg-look # customize gtk settings (ex: cursor theme etc)
		];
	};

	programs = {
		firefox.enable = true;
		hyprland.enable = true;
		zsh.enable = true;
	};

	fonts.packages = with pkgs; [
		jetbrains-mono
		iosevka
	];

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		neovim # my favorite text editor
		neofetch # shows system information and extra others
		tree
		yazi # terminal file manager
		htop
		btop # system monitor like windows task manager
		fzf # fuzzy search
		git
		kitty
		wlsunset # bluelight filtering
		nautilus # gnome file manager
		home-manager # nix home manager
		elinks # terminal web browser
		ntfs3g
		# wget
	];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };
	
	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;
	
	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# networking.firewall.enable = true;
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;
	
	# This option defines the first version of NixOS you have installed on this particular machine,
	# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
	#
	# Most users should NEVER change this value after the initial install, for any reason,
	# even if you've upgraded your system to a new NixOS release.
	#
	# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
	# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
	# to actually do that.
	#
	# This value being lower than the current NixOS release does NOT mean your system is
	# out of date, out of support, or vulnerable.
	#
	# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
	# and migrated your data accordingly.
	#
	# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	# system.stateVersion = channelVersion; # Did you read the comment?
	# system.autoUpgrade = {
	# 	enable = true;
	# 	allowReboot = false;
	# 	dates = "weekly";
	# 	channel = "https://nixos.org/channels/nixos-${channelVersion}";
	# };

	system = {
		stateVersion = channelVersion;
		autoUpgrade = {
			enable = true;
			allowReboot = false;
			dates = "weekly";
			channel = "https://nixos.org/channels/nixos-${channelVersion}";
		};
	};

	nixpkgs.config.allowUnfree = true;

	nix = {
		settings = {
			experimental-features = [ "nix-command" "flakes" ];
			auto-optimise-store = true;
		};
		gc = { # garbage collection
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than-7d";
		};
	};


}
