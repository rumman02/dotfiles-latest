return function()
	require("mini.trailspace").setup()

	-- auto trim trailing whitespace before save the buffer
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			require("mini.trailspace").trim()
		end,
	})
end
