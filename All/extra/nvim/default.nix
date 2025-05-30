{ config, pkgs, lib, ... }:
let
nvimDir = ./.; # nvim file directory (this directory)
nvimFiles = builtins.attrNames (builtins.readDir nvimDir);
in
{
	home = {
		file = lib.mkMerge (
				map ( fileName:
				{
					".config/nvim/${fileName}" = {
						source = "${nvimDir}/${fileName}";
						recursive = true;
					};
				}
			) nvimFiles
		);
	};

  programs = {
    neovim = {
      enable = true;
      extraPackages = with pkgs; [
        luarocks # (installed for neovim luacheck linter)
      ];
    };
  };
}
