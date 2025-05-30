{ config, pkgs, username, ... }:

{
	# enable dconf (system management tool)
	programs = {
		dconf = {
			enable = true;
		};
	};

	# add user to libvirtd group
	users = {
		users = {
			${username} = {
				extraGroups = [ "libvirtd" ];
				packages = with pkgs; [
					virt-manager
					virt-viewer
					spice
					spice-gtk
					spice-protocol
					win-virtio
					win-spice
					adwaita-icon-theme
				];
			};
		};
	};

	# manage the virtualisation services
	virtualisation = {
		libvirtd = {
			enable = true;
			qemu = {
				swtpm = {
					enable = true;
				};
				ovmf = {
					enable = true;
					packages = with pkgs; [
						OVMFFull.fd
					];
				};
			};
		};
		spiceUSBRedirection = {
			enable = true;
		};
	};

	services = {
		spice-vdagentd = {
			enable = true;
		};
	};
}
