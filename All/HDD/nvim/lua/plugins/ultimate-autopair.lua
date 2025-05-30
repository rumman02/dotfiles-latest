local M = {}

M.opts = {
	extensions = {
		cmdtype = {
			p = 100,
			skip = {
				-- "/",
				-- "?",
				-- "@",
				-- "-",
				-- ":",
			},
		},
	},
}

M.config = function()
end

return M
