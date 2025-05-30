return function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesActionRename",
		callback = function(event)
			Snacks.rename.on_rename_file(event.data.from, event.data.to)
		end,
	})

	require("mini.files").setup({
		mappings = {
			close = "q",
			go_in = "L",
			go_in_plus = "l",
			go_out = "H",
			go_out_plus = "h",
			mark_goto = "'",
			mark_set = "m",
			reset = "<bs>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "<cr>",
			trim_left = "<",
			trim_right = ">",
		},
	})
end
