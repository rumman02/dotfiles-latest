local M = {}

M.opts = function()
	-- local icons = require("lib.icons")
	local utils = require("lib.utils")
	return {
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "normal",
			-- kind_icons = {
			-- 	-- vscode like icons but it slows down blink cmp
			-- 	Text = icons.kind.text,
			-- 	Method = icons.kind.method,
			-- 	Function = icons.kind.functions,
			-- 	Constructor = icons.kind.constructor,
			--
			-- 	Field = icons.kind.field,
			-- 	Variable = icons.kind.variable,
			-- 	Property = icons.kind.property,
			--
			-- 	Class = icons.kind.class,
			-- 	Interface = icons.kind.interface,
			-- 	Struct = icons.kind.struct,
			-- 	Module = icons.kind.module,
			--
			-- 	Unit = icons.kind.unit,
			-- 	Value = icons.kind.value,
			-- 	Enum = icons.kind.enum,
			-- 	EnumMember = icons.kind.enumMember,
			--
			-- 	Keyword = icons.kind.keyword,
			-- 	Constant = icons.kind.constant,
			--
			-- 	Snippet = icons.kind.snippet,
			-- 	Color = icons.kind.color,
			-- 	File = icons.kind.file,
			-- 	Reference = icons.kind.reference,
			-- 	Folder = icons.kind.folder,
			-- 	Event = icons.kind.event,
			-- 	Operator = icons.kind.operator,
			-- 	TypeParameter = icons.kind.typeParameter,
			-- },
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
		completion = {
			documentation = { window = { border = utils.ui.border } },
			menu = {
			}
		},
		signature = {
			enabled = true,
			window = { border = utils.ui.border }
		},
		keymap = {
			-- disable a keymap from the preset
			preset = "none",

			["<c-j>"] = { function(cmp) cmp.select_next({ auto_insert = false }) return true end, "fallback", },
			["<c-k>"] = { function(cmp) cmp.select_prev({ auto_insert = false }) return true end, "fallback", },
			["<c-n>"] = { function(cmp) cmp.select_next({ auto_insert = true }) return true end, "fallback", },
			["<c-p>"] = { function(cmp) cmp.select_prev({ auto_insert = true }) return true end, "fallback", },

			["<c-h>"] = { "hide", "fallback" },
			["<c-l>"] = { "show_documentation", "hide_documentation", "fallback" },

			["<c-u>"] = { "scroll_documentation_up", "fallback" },
			["<c-d>"] = { "scroll_documentation_down", "fallback" },

			["<c-i>"] = { "show_signature", "hide_signature", "fallback" },

			["<c-space>"] = { "show", "hide", "fallback" },
			["<c-cr>"] = { "accept", "fallback" },

			["<tab>"] = { "snippet_forward", "fallback" },
			["<s-tab>"] = { "snippet_backward", "fallback" },

			-- cmdline = {
			-- 	preset = 'enter',
			-- },
		},
	}
end

	M.config = function() end

	return M
