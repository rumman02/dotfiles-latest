local which_key = require("which-key")

which_key.add({
	{ "<c-h>", "<cmd> SmartCursorMoveLeft <cr>" },
	{ "<c-j>", "<cmd> SmartCursorMoveDown <cr>" },
	{ "<c-k>", "<cmd> SmartCursorMoveUp <cr>" },
	{ "<c-l>", "<cmd> SmartCursorMoveRight <cr>" },
	{ "<c-\\>", function() require("smart-splits").move_cursor_previous() end },

	{ "<c-w>r", "<cmd> SmartResizeMode <cr>", desc = "Resize mode"  },

	{ "<c-w>sh", "<cmd> SmartSwapLeft <cr>", desc = "Left"  },
	{ "<c-w>sj", "<cmd> SmartSwapDown <cr>", desc = "Down"  },
	{ "<c-w>sk", "<cmd> SmartSwapUp <cr>", desc = "Up"  },
	{ "<c-w>sl", "<cmd> SmartSwapRight <cr>", desc = "Right"  },

})
