local requires = require("lib.functions").requires
local utils = requires("lib.utils")
local icons = requires("lib.icons")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

local g = vim.g
g.mapleader = " "
g.maplocalleader = "\\"

requires("lazy").setup({
	default = {
		lazy = true, -- by default all plugins will be lazy loaded
		version = nil, -- "*" = latest stable, nil = latest git commit
	},
	spec = {
		{ import = "plugins.init" },
	},
	install = {
		missing = true,
		colorscheme = {
			utils.colorscheme,
			"habamax",
		},
	},
	ui = {
		size = {
			width = utils.ui.width,
			height = utils.ui.height,
		},
		wrap = utils.option.wrap,
		border = {
			icons.ui.border.top.left,
			icons.ui.border.horizontal,
			icons.ui.border.top.right,
			icons.ui.border.vertical,
			icons.ui.border.bottom.right,
			icons.ui.border.horizontal,
			icons.ui.border.bottom.left,
			icons.ui.border.vertical,
		},
		backdrop = utils.ui.backdrop,
		title = "Lazy Plugin Manager",
		title_pos = utils.ui.title_position,
		icons = {
			cmd = icons.extras.terminal,
			config = icons.extras.settings,
			debug = icons.diagnostics.debug,
			event = icons.extras.flash,
			favorite = icons.extras.favorite,
			ft = icons.documents.file.default,
			init = icons.extras.init,
			import = icons.documents.file.import,
			keys = icons.extras.key,
			lazy = icons.extras.sleep,
			loaded = icons.extras.state.loaded,
			not_loaded = icons.extras.state.not_loaded,
			plugin = icons.extras.plugin,
			runtime = icons.extras.runtime,
			require = icons.extras.require,
			source = icons.extras.source,
			start = icons.extras.start,
			task = icons.extras.task,
			list = {
				"",
				"  ",
				"    ",
				"      ",
			},
		},
	},
	custom_keys = false,
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enable = true,
		notify = false,
	},
	performence = {
		rtp = {
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
})

-- -- enable it, if you have any local keybind for lazy plugin manager dashboard
-- vim.api.nvim_create_autocmd({ "Filetype" }, {
--   pattern = "lazy",
--   callback = function()
--     requries("which-key").add({
--       { mode = "n", "<localleader>", "", desc = "Lazy", buffer = true },
--     })
--   end
-- })
