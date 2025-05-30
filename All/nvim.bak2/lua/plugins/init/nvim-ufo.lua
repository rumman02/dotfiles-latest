local M = {}

M.event = {
  "BufReadPre",
  "VeryLazy",
}

M.dependencies = {
  "kevinhwang91/promise-async",
}

M.opts = function()
	local utils = require("lib.utils")
	local icons = require("lib.icons")

	local ftMap = {
		vim = "indent",
		python = { "indent" },
		git = "",
	}

	local handler = function(virtText, lnum, endLnum, width, truncate)
		local newVirtText = {}
		local suffix = ( " 󰦸 %d" ):format(endLnum - lnum)
		local sufWidth = vim.fn.strdisplaywidth(suffix)
		local targetWidth = width - sufWidth
		local curWidth = 0
		for _, chunk in ipairs(virtText) do
			local chunkText = chunk[1]
			local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if targetWidth > curWidth + chunkWidth then
				table.insert(newVirtText, chunk)
			else
				chunkText = truncate(chunkText, targetWidth - curWidth)
				local hlGroup = chunk[2]
				table.insert(newVirtText, {chunkText, hlGroup})
				chunkWidth = vim.fn.strdisplaywidth(chunkText)
				-- str width returned from truncate() may less than 2nd argument, need padding
				if curWidth + chunkWidth < targetWidth then
					suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
				end
				break
			end
			curWidth = curWidth + chunkWidth
		end
		table.insert(newVirtText, {suffix, 'MoreMsg'})
		return newVirtText
	end

	return {
		close_fold_kinds_for_ft = {
			default = {'imports', 'comment'},
			json = {'array'},
			c = {'comment', 'region'}
		},
		fold_virt_text_handler = handler,
		preview = {
			win_config = {
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
				winhighlight = 'Normal:Folded',
				winblend = utils.ui.window_blend,
			},
			mappings = {
				scrollU = '<C-u>',
				scrollD = '<C-d>',
				jumpTop = '[',
				jumpBot = ']'
			}
		},
		provider_selector = function(bufnr, filetype, buftype)
			-- Check if a filetype-specific folding provider is mapped
			local ftProvider = ftMap[filetype]

			if ftProvider then
				if ftProvider == "" then
					return {}  -- No folding provider for git files
				else
					return ftProvider  -- Use the mapped provider(s)
				end
			end

			-- Check if LSP is available
			---@diagnostic disable-next-line: missing-parameter
			if vim.lsp.buf_is_attached(bufnr) then
				return { 'lsp' }  -- Prefer LSP folding if it's available
				-- Check if Treesitter parser exists for the filetype
			elseif require'nvim-treesitter.parsers'.has_parser(filetype) then
				return { 'treesitter' }  -- Fallback to Treesitter if LSP is unavailable
			else
				return { 'indent' }  --[[ Fallback to Indentation-based folding if both
				LSP and Treesitter aren't available ]]
			end
		end,
	}
end

M.config = function(_, opts)
	require("ufo").setup(opts)

	vim.cmd([[ autocmd FileType neo-tree setlocal nofoldenable ]])
	vim.cmd([[ autocmd FileType snacks_dashboard setlocal nofoldenable ]])
end

M.keys = function ()
	local map = require("lib.func").map
	local folding_leader = require("lib.keys").leader.folding

	return {
		map(1, { "n" }, folding_leader, "", { desc =  "z" }),
		map(1, { "n" }, folding_leader .. "o", "", { desc = "Open" }),
		map(1, { "n" }, folding_leader .. "T", "", { desc = "Toggle" }),
		map(1, { "n" }, folding_leader .. "c", "", { desc = "Close" }),
		map(1, { "n" }, folding_leader .. "d", "", { desc = "Delete" }),
		map(1, { "n" }, folding_leader .. "f", "", { desc = "Fold" }),
		map(1, { "n" }, folding_leader .. "i", "zi", { desc = "Toggle" }),
		map(1, { "n" }, folding_leader .. "Ti", "za", { desc = "In" }),
		map(1, { "n" }, folding_leader .. "To", "zA", { desc = "Out" }),
		map(1, { "n" }, folding_leader .. "oi", "zo", { desc = "In" }),
		map(1, { "n" }, folding_leader .. "oo", "zO", { desc = "Out" }),
		map(1, { "n" }, folding_leader .. "ci", "zc", { desc = "In" }),
		map(1, { "n" }, folding_leader .. "co", "zC", { desc = "Out" }),
		map(1, { "n" }, folding_leader .. "di", "zd", { desc = "In" }),
		map(1, { "n" }, folding_leader .. "do", "zD", { desc = "Out" }),
		map(1, { "n" }, folding_leader .. "da", "zE", { desc = "All" }),
		map(1, { "n", "v" }, folding_leader .. "fc", "zf", { desc = "Create" }),
		map(1, { "n" }, folding_leader .. "fm", "zm", { desc = "More" }),
		map(1, { "n" }, folding_leader .. "fl", "zr", { desc = "Less" }),
		map(1, { "n" }, folding_leader .. "fu", "zx", { desc = "Update" }),
	}
end

return M
