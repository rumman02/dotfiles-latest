# Do not modify this file!  It was generated by ‘nixos-generate-config’ and may be overwritten by future invocations.  Please make changes to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, system, ... }:

{
    imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot = {
		initrd = {
			availableKernelModules = [
				"xhci_pci"
				"ahci"
				"nvme"
				"usbhid"
				"sd_mod"
			];
			kernelModules = [ ];
		};
		kernelModules = [
			"kvm-intel"
		];
		extraModulePackages = [ ];
	};

    swapDevices = [
		{
			device = "/dev/disk/by-label/swap";
		}
	];

	networking = {
		useDHCP = lib.mkDefault true;
		interfaces = {
			wlo1 = {
				useDHCP = lib.mkDefault true;
			};
			eno2 = {
				useDHCP = lib.mkDefault true;
			};
		};
	};

	nixpkgs = {
		hostPlatform = lib.mkDefault system;
	};

	hardware = {
		cpu = {
			intel = {
				updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
			};
		};
	};
}
