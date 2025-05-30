local M = {}

M.dependencies = {
	"mfussenegger/nvim-dap",
	"nvim-treesitter/nvim-treesitter",
}

M.opts = function()
	return {
		enabled = true,
		commented = true, -- Prefix virtual text with comment string
		only_first_definition = false, -- Show all variable definitions
		all_references = true, -- Show references as well
	}
end

return M
