local fzf = require("fzf-lua")
local utils = require("rumman.lib.utils")
local keys = require("rumman.lib.keys")
local map = require("rumman.lib.func").map
local fzf_local_leader = keys.fzf.leaders.locals

fzf.setup({
	"default-prompt",
	winopts = {
		height = utils.ui.height,
		width = utils.ui.width,
		row = 0.50,
		col = 0.50,
		border = utils.ui.border,
		backdrop = utils.ui.backdrop,
		title_pos = utils.ui.title_position,
		preview = {
			border = utils.ui.border,
			title_pos = utils.ui.title_position,
		},
		on_create = function ()
			map(0, { "t" }, "<c-h>", "<Left>", { buffer = true })
			map(0, { "t" }, "<c-j>", "<Down>", { buffer = true })
			map(0, { "t" }, "<c-k>", "<Up>", { buffer = true })
			map(0, { "t" }, "<c-l>", "<Right>", { buffer = true })
		end,
	},
	keymap = {
		builtin = {
			[fzf_local_leader .. "<M-Esc>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
			[fzf_local_leader .. "<F1>"]        = "toggle-help",
			[fzf_local_leader .. "<F2>"]        = "toggle-fullscreen",
			-- Only valid with the 'builtin' previewer
			[fzf_local_leader .. "<F3>"]        = "toggle-preview-wrap",
			[fzf_local_leader .. "<F4>"]        = "toggle-preview",
			-- Rotate preview clockwise/counter-clockwise
			[fzf_local_leader .. "<F5>"]        = "toggle-preview-ccw",
			[fzf_local_leader .. "<F6>"]        = "toggle-preview-cw",
			-- `ts-ctx` binds require `nvim-treesitter-context`
			[fzf_local_leader .. "<F7>"]        = "toggle-preview-ts-ctx",
			[fzf_local_leader .. "<F8>"]        = "preview-ts-ctx-dec",
			[fzf_local_leader .. "<F9>"]        = "preview-ts-ctx-inc",
			[fzf_local_leader .. "<S-Left>"]    = "preview-reset",
			[fzf_local_leader .. "<S-down>"]    = "preview-page-down",
			[fzf_local_leader .. "<S-up>"]      = "preview-page-up",
			[fzf_local_leader .. "<M-S-down>"]  = "preview-down",
			[fzf_local_leader .. "<M-S-up>"]    = "preview-up",
		}
	},
})

