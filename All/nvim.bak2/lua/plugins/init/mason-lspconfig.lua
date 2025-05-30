local M = {}

M.event = {
	"BufReadPre",
	"BufNewFile",
}

M.dependencies = {
	"williamboman/mason.nvim",
}

M.opts = function()
	return {
		-- automatic_installation = true,
		-- handlers = {
		--   vim.lsp.enable,
		-- }
	}
end

return M
