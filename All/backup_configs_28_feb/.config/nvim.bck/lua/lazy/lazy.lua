local utils = require("lib.utils");
local icons = require("lib.icons");

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git";
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath });
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar();
    os.exit(1);
  end;
end;
vim.opt.rtp:prepend(lazypath);

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
require("configs.vim");

-- Setup lazy.nvim
require("lazy").setup({
	defaults = {
		lazy = true, -- by default all plugins will be lazy loaded
		version = "*", -- always use latest git commit
	},
  spec = {
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			config = require("plugins.configs").which_key,
		},
    { import = "plugins.init" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { missing = true, colorscheme = { utils.colorscheme, "habamax" } },
	ui = {
		size = { width = utils.ui.width, height = utils.ui.height },
		wrap = utils.options.wrap,
		border = utils.ui.border,
		backdrop = utils.ui.backdrop,
		title = " Lazy Plugins Manager ",
		title_pos = utils.ui.title_position,
		pills = true,
		icons = {
			cmd = icons.others.terminal,
			config = icons.others.settings,
			event = icons.others.flash,
			favorite = icons.others.favorite,
			ft = icons.documents.file,
			init = icons.others.init,
			import = icons.documents.file_import,
			keys = icons.others.key,
			lazy = icons.others.sleep .. " ",
			loaded = icons.others.loaded,
			not_loaded = icons.others.not_loaded,
			plugin = icons.others.plugin,
			runtime = icons.others.runtime,
			require = icons.others.require,
			source = icons.others.init,
			start = icons.others.start,
			task = icons.others.task .. " ",
			list = {
				"",
				"  ",
				"    ",
				"      ",
			},
		},
		custom_keys = {
			["<localleader>t"] = false,
			["<localleader>i"] = false,
			["<localleader>l"] = {
				function(plugin)
					require("lazy.util").float_term({ "lazygit", "log" }, {
						cwd = plugin.dir,
					})
				end,
				desc = "Open plugins git log",
			},
		},
	},
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
	change_detection = { enabled = true, notify = false },
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
});

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = "lazy",
	callback = function()
		require("which-key").add({
			{ mode = "n", "<localleader>", "", desc = "Lazy", buffer = true },
		});
	end;
});
