local ufo = require("ufo")
local icons = require("rumman.lib.icons")
local utils = require("rumman.lib.utils")

-- custom folding provider here ( filetype = { providers } )
-- providers: lsp, treesitter, indent
local ftMap = {
	vim = "indent",
	python = { "indent" },
	git = "",
}

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ( '  %d  ' ):format(endLnum - lnum)
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

ufo.setup({
	close_fold_kinds_for_ft = {
		default = {'imports', 'comment'},
		json = {'array'},
		c = {'comment', 'region'}
	},
	fold_virt_text_handler = handler,
	preview = {
		win_config = {
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
})

