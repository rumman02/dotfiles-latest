return {
    "lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
	config = function ()
		local indent_blankline = require("ibl")
		indent_blankline.setup({
			debounce = 100,
			indent = {
				char = "│",
				smart_indent_cap = true,
			},
			scope = {
				show_start = false,
				show_end = false,
				include = {
					node_type = { ["*"] = { "*" } },
				}
			}
		})
	end
}
