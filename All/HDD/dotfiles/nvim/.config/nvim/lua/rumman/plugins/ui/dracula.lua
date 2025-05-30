local dracula = require("dracula")
local utils = require("rumman.lib.utils")

dracula.setup({})

if utils.colorscheme == "dracula" then
	vim.cmd.colorscheme("dracula")
end

