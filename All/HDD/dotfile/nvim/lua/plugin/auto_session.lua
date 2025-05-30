return {
	"rmagatti/auto-session",
	cond = false,
	-- event = { "VimLeavePre" },
	-- cmd = { "SessionSave", "SessionRestore" },
	config = function()
		local auto_session = require("auto-session")
		auto_session.setup({
			auto_restore = false, -- disables auto restoring session
			bypass_save_filetypes = { "alpha", "help" },
			pre_save_cmds = { "Neotree close" },
			session_lens = {
				previewer = true
			}
		})
	end
}
