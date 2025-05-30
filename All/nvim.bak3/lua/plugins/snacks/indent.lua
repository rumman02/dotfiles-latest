return {
	enabled = require("plugins.controller").snacks.indent,
	filter = function(buf)
		return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == "markdown"
	end,
}
