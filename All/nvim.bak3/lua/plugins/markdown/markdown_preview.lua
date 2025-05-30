return {
	"iamcco/markdown-preview.nvim",
	enabled = require("plugins.controller").markdown.markdown_preview,
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	ft = {
		"markdown",
	},
	-- build = function()
	-- 	vim.fn["mkdp#util#install"]()
	-- end,
	build = "cd app & npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
}
