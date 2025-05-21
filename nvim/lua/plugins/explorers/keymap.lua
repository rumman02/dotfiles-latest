local M = {}

local neotree_reveal_cwd = function(is_enabled, is_leave_dir_opened)
	local config = require("neo-tree").config or {}

	-- Ensure filesystem table exists
	config.filesystem = config.filesystem or {}

	config.filesystem.follow_current_file = {
		enabled = is_enabled,
		leave_dirs_open = is_leave_dir_opened,
	}

	-- Reapply the updated configuration
	require("neo-tree").setup(config)

	-- Notify the user
	if is_enabled and is_leave_dir_opened then
		vim.notify("Neotree: Reveal current file enabled,\n(Leave directory opened)")
	elseif is_enabled and not is_leave_dir_opened then
		vim.notify("Neotree: Reveal current file enabled,\n(Leave directory closed)")
	else
		vim.notify("Neotree: Reveal current file disabled")
	end

	vim.cmd("Neotree close")
	vim.cmd("Neotree")
end

M.neotree_key = {
	["<leader>e"] = {
		desc = "[E]xplorer",
		b = { cmd = "<cmd>Neotree buffers<cr>", desc = "[B]uffers" },
		g = { cmd = "<cmd>Neotree git_status<cr>", desc = "[G]it" },
		f = { cmd = "<cmd>Neotree focus<cr>", desc = "[F]ocus" },
		m = {
			desc = "[M]ove",
			h = { cmd = "<cmd>Neotree left<cr>", desc = "Left" },
			j = { cmd = "<cmd>Neotree bottom<cr>", desc = "Down" },
			k = { cmd = "<cmd>Neotree top<cr>", desc = "Up" },
			l = { cmd = "<cmd>Neotree right<cr>", desc = "Right" },
			f = { cmd = "<cmd>Neotree focus flaot<cr>", desc = "[F]loat" },
		},
		t = { cmd = "<cmd>Neotree toggle<cr>", desc = "[T]ree" },
		x = {
			cmd = "<cmd>Neotree close<cr><cmd>Neotree close filesystem<cr><cmd>Neotree close buffers<cr><cmd>Neotree close git_status<cr>",
			desc = "Close",
		},
		r = {
			desc = "[R]eveal",
			r = { cmd = "<cmd>Neotree reveal<cr>", desc = "[R]eveal" },
			o = {
				cmd = function()
					neotree_reveal_cwd(true, true)
				end,
				desc = "[O]pened",
			},
			c = {
				cmd = function()
					neotree_reveal_cwd(true, false)
				end,
				desc = "[C]losed",
			},
			x = {
				cmd = function()
					neotree_reveal_cwd(false, false)
				end,
				desc = "Off",
			},
		},
	},
}

return M
