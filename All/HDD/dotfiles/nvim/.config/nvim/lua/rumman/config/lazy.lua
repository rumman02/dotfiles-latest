-- lazy plugin file path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- try to find lazy plugin, if not then clone it from git & install into lazypath
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
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

-- add lazypath to the start of runtime path for priority loading
vim.opt.rtp:prepend(lazypath)

local func = require("rumman.lib.func")
local utils = require("rumman.lib.utils")
local icons = require("rumman.lib.icons")
local load_config = function(config)
	return function()
		func.requires("rumman.plugins." .. config)
	end
end

-- Setup lazy.nvim
func.requires("lazy").setup({
	defaults = {
		lazy = true, -- all plugins should be lazy loaded by default
		version = nil, -- "nil": latest git commit, "*": latest stable version
	},
	spec = {
		{
			"folke/which-key.nvim",
			config = load_config("tools.which-key"),
			lazy = false,
		},
		{ import = "rumman.plugins" },
	},
	-- lockfile generated after running update.
	lockfile = vim.fn.stdpath("config") .. "/lua/rumman/plugins/lock.json",
	concurrency = 8, -- limit the maximum amount of concurrent tasks

	git = {
		log = { "--since=3 days ago" }, -- show commits from the last 3 days
		timeout = 120, -- kill processes that take more than 2 minutes
		url_format = "https://github.com/%s.git",
	},
	install = {
		missing = true, -- install missing plugins on startup
		--[[ try to load one of these colorschemes when starting an installation
		during startup ]]
		colorscheme = { utils.colorscheme, "habamax" },
	},
	ui = {
		-- value of less then 1 is a percentage, greater then 1 is a fixed size
		size = { width = utils.ui.width, height = utils.ui.height },
		wrap = true, -- wrap the lines in the ui
		--[[ The border to use for the UI window. Accepts same border values as
		|nvim_open_win()|. ]]
		border = {
			icons.ui.BorderTopLeft,
			icons.ui.BorderTop,
			icons.ui.BorderTopRight,
			icons.ui.BorderRight,
			icons.ui.BorderBottomRight,
			icons.ui.BorderBottom,
			icons.ui.BorderBottomLeft,
			icons.ui.BorderLeft,
		},
		-- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
		backdrop = utils.ui.backdrop,
		title = " " .. icons.ui.Dashboard .. "Lazy plugins manager ", --[[ string
		only works when border is not "none" ]]
		title_pos = utils.ui.title_position, -- "center" | "left" | "right"
		icons = {
			cmd = icons.ui.Terminal,
			config = icons.ui.Gear,
			event = icons.ui.Electric,
			favorite = icons.ui.Star,
			ft = icons.documents.File,
			init = icons.ui.Gear,
			import = icons.documents.Import,
			keys = icons.ui.Keyboard,
			lazy = icons.ui.Sleep,
			loaded = icons.ui.Check,
			not_loaded = icons.ui.CircleAlt,
			plugin = icons.ui.Package,
			runtime = icons.ui.Vim,
			require = icons.lang.Lua,
			source = icons.ui.Code,
			start = icons.ui.Play,
			task = icons.ui.Check,
			list = {
				icons.ui.Circle,
				icons.ui.Arrow,
				icons.ui.Star,
				icons.ui.Minus,
			},
		},
	},
	diff = { cmd = "git" },
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, -- set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, --[[ reset the runtime path to $VIMRUNTIME and your
			config directory ]]
			paths = {}, --[[ add any custom paths here that you want to includes
			in the rtp ]]
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
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that don't have docs
		skip_if_doc_exists = true,
	},
})

