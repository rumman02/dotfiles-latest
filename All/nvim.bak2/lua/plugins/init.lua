local function install(repo)
	local parts = vim.split(repo, "/", { plain = true })
	local nameWithSuffix = parts[#parts]

	-- If there's a '.', strip extension; otherwise keep as-is
	local nameParts = vim.split(nameWithSuffix, "%.", { plain = false })
	local name = nameParts[1] -- e.g., "tokyonight" or "alpha-nvim"

	local ok, mod = pcall(require, "plugins.init." .. name)
	local result = { repo }

	if not ok then
		vim.notify("Module plugins.init." .. name .. " not found", vim.log.levels.WARN)
		return result
	end

	local fields = {
		"branch",
		"build",
		"cmd",
		"cond",
		"config",
		"dependencies",
		"enabled",
		"event",
		"ft",
		"init",
		"keys",
		"lazy",
		"main",
		"name",
		"opts",
		"priority",
		"tag",
		"version",
	}

	for _, field in ipairs(fields) do
		if mod[field] ~= nil then
			result[field] = mod[field]
		end
	end

	return result
end

return {
	---------- ui
	-- install("folke/tokyonight.nvim"),
	install("ellisonleao/gruvbox.nvim"),
	-- install("rose-pine/neovim"),
	-- install("goolord/alpha-nvim"),
	install("nvim-lualine/lualine.nvim"),
	-- install("catppuccin/nvim"),
	-- install("akinsho/bufferline.nvim"),
	install("romgrk/barbar.nvim"),
	install("eandrju/cellular-automaton.nvim"), -- a animation plugins just for fun, like all codes will falled like rain

	---------- tools
	install("nvim-neo-tree/neo-tree.nvim"),
	install("folke/snacks.nvim"),
	install("rhysd/clever-f.vim"), -- make fFtT keys more powerful and visual
	install("FeiyouG/commander.nvim"), -- search and select custom commands to apply
	install("ibhagwan/fzf-lua"),
	install("m4xshen/hardtime.nvim"),
	install("smoka7/hop.nvim"), -- easy way to navigate cursor
	-- install("3rd/image.nvim"), -- supports image for neotree, and others (replaced by snacks image)
	install("kdheepak/lazygit.nvim"), -- this plugin replacesd by snacks lazyvim
	install("ggandor/leap-spooky.nvim"),
	install("derektata/lorem.nvim"), -- dummy text generator
	install("chentoast/marks.nvim"), -- shows mark letter in signcolumn
	install("OXY2DEV/markview.nvim"),
	install("brenoprata10/nvim-highlight-colors"), -- shows color highlight
	install("folke/which-key.nvim"),
	install("michaelrommel/nvim-silicon"), -- capture code images / screenshot
	install("chrisgrieser/nvim-spider"), -- enables extra power for wWeE keys
	-- install("kevinhwang91/nvim-ufo"), -- for folding
	install("MeanderingProgrammer/render-markdown.nvim"),
	install("mrjones2014/smart-splits.nvim"),
	install("nvim-telescope/telescope.nvim"),
	-- install("rachartier/tiny-glimmer.nvim"), -- a yank post highlight plugin
	install("anuvyklack/windows.nvim"), -- enables windows auto resize when shrinked
	install("folke/trouble.nvim"), -- for diagnostics details view on split window
	-- install("folke/flash.nvim"),
	-- install("akinsho/toggleterm.nvim"),
	-- install("ryanmsnyder/toggleterm-manager.nvim"),
	install("mbbill/undotree"), -- undo states and undo history panel
	-- install("MagicDuck/grug-far.nvim"), -- search and replace advanced & all files
	install("mg979/vim-visual-multi"), -- multi cursor
	install("kylechui/nvim-surround"),
	install("rmagatti/auto-session"), -- session manager (replace by persistence nvim)
	install("folke/persistence.nvim"), -- session manager
	install("folke/noice.nvim"), -- cmd line popup shows center of screen
	install("b0o/incline.nvim"), -- filename shows on window split lines
	install("lewis6991/gitsigns.nvim"),
	install("gbprod/yanky.nvim"),
	install("barrett-ruth/live-server.nvim"),
	-- install("jake-stewart/normal-cmdline.nvim"),
	install("stevearc/oil.nvim"),

	---------- lang
	install("echasnovski/mini.ai"), -- better textobject, like cif (change in function)
	-- commets
	install("numToStr/Comment.nvim"),
	install("folke/todo-comments.nvim"),
	-- autopairs
	install("windwp/nvim-autopairs"),
	install("altermo/ultimate-autopair.nvim"),
	-- treesitter
	install("mtrajano/tssorter.nvim"),
	install("nvim-treesitter/nvim-treesitter"),
	install("nvim-treesitter/nvim-treesitter-textobjects"),
	install("nvim-treesitter/nvim-treesitter-context"),
	install("Wansmer/treesj"),
	install("windwp/nvim-ts-autotag"),
	-- lsp
	install("williamboman/mason.nvim"), -- all in one installer (lsp, dap, linter, formatter)
	install("WhoIsSethDaniel/mason-tool-installer.nvim"), -- all the tools of mason installer
	install("williamboman/mason-lspconfig.nvim"), -- bridge the gap between mason and nvim lspconfig
	install("neovim/nvim-lspconfig"), -- all lsp for neovim editor
	-- install("nvimdev/lspsaga.nvim"),
	-- cmp
	-- install("hrsh7th/nvim-cmp"),
	install("saghen/blink.cmp"), -- auto completion for neovim editor
	-- dap
	install("mfussenegger/nvim-dap"), -- dap for neovim editor
	install("rcarriga/nvim-dap-ui"), -- ui for the dap
	install("jay-babu/mason-nvim-dap.nvim"), -- enables to use multiple debug adapter use options selector
	-- install("theHamsta/nvim-dap-virtual-text"),
	-- install("jbyuki/one-small-step-for-vimkind"),
	-- linter
	-- install("jay-babu/mason-null-ls.nvim"),
	-- install("rshkarin/mason-nvim-lint"),
	-- formatter
	install("stevearc/conform.nvim"),

	-- install("nvim-java/nvim-java"),
}
