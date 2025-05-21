# if you use the flake, then the execution begin from the flake.nix file.
# if you don't use the flake, then the execution begin from the /etc/nixos/configuration.nix file.
# note: if flake.lock requires missing root permissions, then put "sudo chown rumman:users /home/rumman/.dotfiles/flake.lock" to your terminal, to disable root permission
{
  description = "My flake configuration";

  inputs = {
    nixpkgs = {
      url =
        "github:nixos/nixpkgs/nixos-unstable"; # nixos-24.11 for stable version
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = { nixpkgs = { follows = "nixpkgs"; }; };
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs = { nixpkgs = { follows = "nixpkgs"; }; };
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let # you can declare all the important variables here!
      hostName = "nixos";
      userName = "rumman";
      homePath = "/home/${userName}";
      system = "x86_64-linux";
      nixVersion = "25.05";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowBroken = true;
        };
      };
    in {
      nixosConfigurations = {
        ${hostName} = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system inputs nixVersion hostName userName homePath;
          };
          modules = [ (import ./nix/configuration.nix) ];
        };
      };
      homeConfigurations = {
        ${userName} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit system nixpkgs nixVersion inputs userName homePath;
          };
          modules = [ (import ./nix/home.nix) ];
        };
      };
    };
}
