-- https://lazy.folke.io/configuration

-- lazy plugin file path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- try to find lazy plugin, if not then clone from git & install into lazypath
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- lazy git repo
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

LAZY = require("lazy")
LAZY.setup({
  defaults = {
		-- all plugins will lazy loaded by default
		lazy = true
  },
  spec = {
		-- load plugins/plugins file/folder here
		{ import = "plugin" },
		{ import = "plugin.language" }
	},
  install = {
		-- install plugins, that is added but not installed yet, with a specific colorshceme
		missing = true,
		colorscheme =  { "retrobox" }
  },
  ui = {
		size = { width = 0.7, height = 0.8 },
		border = "rounded",
		title = "Lazy plugin manager",
		title_pos = "center",
		backdrop = 60,
		piils = true,
		wrap = true,
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
    },
  },
  checker = {
		-- automatically check for plugi updates without notify
		enabled = true,
		notify = false
  },
  change_detection = {
		-- any changes inside plugins will detect without notify
		enabled = true,
		notify = false
  },
  performance = {
    cache = {
      enabled = true,
    },
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
      }
    }
  }
})
