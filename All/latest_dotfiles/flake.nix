# if you use the flake, then the execution begin from the flake.nix file.
# if not using flake, then the execution starts from /etc/nixos/configuration.nix file.
{
	description = "Flake configuraiton";

	inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-unstable"; # latest unstable version
			# url = "github:nixos/nixpkgs/nixos-24.11"; # latest stable version
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs = {
				nixpkgs = {
					follows = "nixpkgs";
				};
			};
		};
		hyprland = {
			url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
		};
		hy3 = {
			url = "github:outfoxxed/hy3";
			inputs = {
				hyprland = {
					follows = "hyprland";
				};
			};
		};
	};

	outputs = { self, nixpkgs, home-manager, hyprland, hy3, ... }: 
		let
		system = "x86_64-linux";
		username = "rumman";
		host = "nixos";
		pkgs = import nixpkgs {
		inherit system;
		config = {
			allowUnfree = true;
		};
	};
	in {
		nixosConfigurations = {
			${host} = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit system;
				};

				modules = [
					{
						_module.args = { # passing values to configuration.nix file
							inherit username;
						};
					}
					(import ./nix/configuration.nix)
					(import ./nix/vm.nix)
				];
			};
		};

		homeConfigurations = {
			${username} = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;

				modules = [
					{
						_module.args = { # passing values to home.nix file
							inherit username;
						};
					}
					(import ./nix/home.nix)

					hyprland.homeManagerModules.default
					{
						wayland.windowManager.hyprland = {
							enable = true;
							plugins = [
								hy3.packages.x86_64-linux.hy3
							];
							extraConfig = ''
							'';
						};
					}
				];
			};
		};
	};
}
