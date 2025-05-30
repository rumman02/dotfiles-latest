local which_key = require("which-key")

which_key.add({
	{ "<leader>sss", "<cmd> SessionSave <cr>", desc = "Save" },
	-- <cr><cr>: after restore session, shows prompt like press enter or type command 
	-- to continue. to avoid this, first <cr> is for execute command, second for press enter.
	{ "<leader>ssr", "<cmd> SessionRestore <cr><cr>", desc = "Restore" },
	{ "<leader>ssc", "<cmd> Autosession search <cr>", desc = "Search" },
	{ "<leader>ssd", "<cmd> Autosession delete <cr>", desc = "Delete" },
})
