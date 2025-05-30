local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- try to find lazy plguin, if not then clone from git & install into lazypath
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- all plugins should by-default lazy loaded
	defaults = {
		lazy = true,
	},
	-- import plugins into specs
	spec = {
		{ import = "plugin.main" },
		{ import = "plugin" },
		{ import = "theme" },
		-- { import = "utilitie.setting.current_colorscheme" },
	},
	lockfile = vim.fn.stdpath("config") .. "/.lazy-lock.json",
	-- colorscheme that will be used when installing plugins.
	install = { missing = true, colorscheme = { "retrobox" } },
	ui = {
		border = "rounded",
		title = "Lazy plugin manager",
		title_pos = "center",
		icons = {
			cmd = "",
			config = "",
			event = "",
			favorite = "",
			ft = "󰡯",
			import = "󰏔",
			keys = "󰌌",
			loaded = "",
			not_loaded = "",
			plugin = "",
			source = "󱃖",
			start = "",
			task = "",
			list = {
				"",
				"󰛂",
				"󰩳",
				"",
			}
		}
	},
	-- automatically check for plugin updates without notify
	checker = { enabled = true, notify = false },
	-- any changes inside plugins will detect without notify
	change_detection = { enable = true, notify = false},
})
