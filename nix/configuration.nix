{ pkgs, nixVersion, hostName, userName, ... }:

{
  imports = [ ./hardware-configuration.nix ];

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

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = let configurationLimit = 10;
    in {
      timeout = 10;
      efi = { canTouchEfiVariables = true; };
      systemd-boot = {
        enable = false;
        inherit configurationLimit;
      };
      grub = {
        enable = true;
        inherit configurationLimit;
        efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = false; # enables dual booting from grub bootloader
      };
    };
    kernelModules = [ "i2c-dev" ]; # ddcutil needs that i2c-dev
  };

  networking = {
    hostName = hostName;
    wireless = {
      enable = false; # enables wireless support via wpa_supplicant.
    };
    networkmanager = {
      enable = true; # easiest to use and most distros use this by default.
    };
    firewall = { enable = true; };
  };

  time = { timeZone = "Asia/Dhaka"; };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "caps:escape";
      };
    };
    displayManager = {
      sddm = { enable = true; };
      defaultSession = "hyprland";
    };
    printing = { enable = true; };
    pulseaudio = { enable = false; };
    pipewire = {
      enable = true;
      pulse = { enable = true; };
    };
    libinput = {
      enable =
        true; # enable touchpad support (enabled default in most desktopManager).
    };
    openssh = { enable = false; };
    udisks2 = { enable = true; };
    gvfs = { enable = true; };
    devmon = { enable = true; };
  };

  hardware = {
    bluetooth = { enable = true; };
    nvidia = { powerManagement = { enable = true; }; };
    i2c = { enable = true; }; # ddcutil needs that i2c
  };

  users = {
    users = let
      shell = pkgs.zsh;
      initialPassword = "password";
    in {
      root = {
        isNormalUser = false;
        inherit shell;
        inherit initialPassword;
      };
      ${userName} = {
        isNormalUser = true;
        inherit shell;
        inherit initialPassword;
        extraGroups = [ "wheel" "networkmanager" "i2c" ];
      };
    };
  };

  programs = {
    hyprland = { enable = true; };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    nix-ld = { # its creates a environment like fhs complients
      enable = true;
      libraries = with pkgs; [
        # Add common libraries needed by LSP servers
        glib
        zlib
        openssl
        stdenv.cc.cc.lib
      ];
    };
    zsh = { enable = true; };
  };

  environment = {
    systemPackages = with pkgs; [
      home-manager
      btop
      fzf
      git
      kitty
      neofetch
      neovim
      tree
      yazi
      ddcutil
    ];
  };

  system = {
    stateVersion = nixVersion;
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  nix = { settings = { experimental-features = [ "nix-command" "flakes" ]; }; };

  fonts = { fontDir = { enable = true; }; };
}
