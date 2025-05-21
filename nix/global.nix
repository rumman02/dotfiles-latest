{ config, pkgs, ... }:
let
  # colorscheme = "retrobox";
  colorscheme = "gruvbox";
  historylevel = 10000;
in {
  home = {
    file = {
      # ".config/nvim/lua/config/nix_variable.lua" = {
      # 	recursive = true;
      # 	text = ''
      # 		local M = {};
      # 			M.colorscheme = "${colorscheme}";
      # 		return M;
      # 	'';
      # };
      # ".config/nvim/lua/config/nix_config.lua" = {
      # 	recursive = true;
      # 	text = ''
      # 		-- this lines came from nix/global.nix file
      # 		vim.cmd.colorscheme "${colorscheme}";
      # 		-- number of undo [note: this is loaded by nix]
      # 		vim.opt.undolevels = ${toString historylevel};
      # 	'';
      # };
    };
  };
}
