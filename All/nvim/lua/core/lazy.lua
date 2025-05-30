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

local utils = require("lib.utils")
local icons = require("lib.icons")
require("lazy").setup({
    default = {
        lazy = true,
    },
    spec = {
        { import = "plugins" },
    },
    install = {
        missing = true,
        colorscheme = { "havamax" },
    },
    ui = {
        size = {
            width = utils.ui.float.width,
            height = utils.ui.float.height,
        },
        wrap = utils.options.wrap,
        border = utils.ui.border,
        backdrop = utils.ui.float.backdrop,
        title = "Lazy Plugin Manager",
        title_pos = utils.ui.title_pos,
        icons = {
			cmd = " ",
			config = "󰒓 ",
			debug = "󰃤 ",
			event = "󰉁 ",
			favorite = "󰓎 ",
			ft = "󰈔 ",
			init = "󰟒 ",
			import = "󰈠 ",
			keys = "󰌆 ",
			lazy = "󰒲 ",
            loaded = icons.plugin.loaded,
            not_loaded = icons.plugin.not_loaded,
            plugin = "󰆦 ",
            runtime = "󰓅 ",
            require = "󰢱 ",
            source = "󰐤 ",
            start = "󰗍 ",
            task = "󱃔 ",
            list = {
                "",
                "  ",
                "    ",
                "      ",
            },
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enable = true,
        notify = false,
    },
    custom_keys = {},
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
            }
        }
    }
})
