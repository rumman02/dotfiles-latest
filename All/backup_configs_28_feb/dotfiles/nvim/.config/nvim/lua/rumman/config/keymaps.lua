-- how windows are place with positions
-- 							            topleft
--            							+---------+
-- 	leftabove	        			| New     |
-- 	+---------+---------+	  +---------+
--	| New     | Current | 	| Current |
-- 	+---------+---------+ 	+---------+
-- 							            botright
--            							+---------+
-- 	rightbelow       				| Current |
--  +---------+---------+  	+---------+
--  | Current | New     |  	| New     |
--  +---------+---------+  	+---------+
-- 							            horizontal
--              						+---------+
-- vertical     				    | Window1 |
-- +---------+---------+    +---------+
-- | Window1 | Window2 |    | Window2 |
-- +---------+---------+    +---------+

--      COMMANDS                    MODES ~
-- :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
-- :nmap  :nnoremap :nunmap    Normal
-- :vmap  :vnoremap :vunmap    Visual and Select
-- :smap  :snoremap :sunmap    Select
-- :xmap  :xnoremap :xunmap    Visual
-- :omap  :onoremap :ounmap    Operator-pending
-- :map!  :noremap! :unmap!    Insert and Command-line
-- :imap  :inoremap :iunmap    Insert
-- :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
-- :cmap  :cnoremap :cunmap    Command-line
-- :tmap  :tnoremap :tunmap    Terminal
--
--          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
-- Command        +------+-----+-----+-----+-----+-----+------+------+ ~
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
--
--     COMMANDS				      MODES ~
-- 				       Normal  Visual+Select  Operator-pending ~
-- :map   :noremap   :unmap   :mapclear	 yes	    yes		   yes
-- :nmap  :nnoremap  :nunmap  :nmapclear	 yes	     -		    -
-- :vmap  :vnoremap  :vunmap  :vmapclear	  -	    yes		    -
-- :omap  :onoremap  :ounmap  :omapclear	  -	     -		   yes
--
-- CHAR	MODE	~
-- <Space>	Normal, Visual, Select and Operator-pending
-- n	Normal
-- v	Visual and Select
-- s	Select
-- x	Visual
-- o	Operator-pending
-- !	Insert and Command-line
-- i	Insert
-- l	":lmap" mappings for Insert, Command-line and Lang-Arg
-- c	Command-line
-- t	Terminal-Job

-- map-arguments
-- "<buffer>", "<nowait>", "<silent>", "<script>", "<expr>" and
-- "<unique>" can be used in any order.  They must appear right after the
-- command, before any other arguments.


------ globals
local func = require("rumman.lib.func")
local keys = require("rumman.lib.keys")
local map = func.map

local neotree_leader = keys.neotree.leaders.globals
local neotree_local_leader = keys.neotree.leaders.locals
local git_leader = keys.git.leaders.globals
local lsp_leader = keys.lsp.leaders.locals
local trouble_leader = keys.trouble.leaders.locals
local linter_leader = keys.linter.leaders.locals
local formatter_leader = keys.formatter.leaders.locals
local option_leader = keys.options.leaders.globals
local dap_leader = keys.dap.leaders.globals
local marks_leader = keys.marks.leaders.globals
local visual_multi_leader = keys.visual_multi.leaders.globals
local notification_leader = keys.notification.leaders.globals
local loc_qfix_list_leader = keys.loc_qfix_list_leader.leaders.globals
local folding_leader = keys.fold.leaders.globals
local session_leader = keys.session.leaders.globals
local navigation_leader1 = keys.navigation.leaders.globals1
local navigation_leader2 = keys.navigation.leaders.globals2
local lazygit_leader = keys.lazygit.leaders.globals
local bufferline_leader = keys.bufferline.leaders.globals
local windows_leader = keys.windows.leaders.globals
local tab_leader = keys.tab.leaders.globals
local undotree_leader = keys.undotree.leaders.globals
local undotree_local_leader = keys.undotree.leaders.locals
local telescope_leader = keys.telescope.leaders.globals
local telescope_local_leader = keys.telescope.leaders.locals
local toggleterm_leader = keys.toggleterm.leaders.globals
local comment_leader = keys.comment.leaders.globals

-- Meanings of 0, 1, 2
-- 0 = vim.keymap.set()
-- 1 = plugins.keys = {}
-- 2 = which_key.add()

---- renamed keymaps
map(0, { "n" }, "<leader><leader>", "", { desc = "More..." })
map(0, { "n" }, "<localleader><localleader>", "", { desc = "More..." })

---- disabled keymaps
map(2, { "n" }, "[(", "", { hidden = true })
map(2, { "n" }, "])", "", { hidden = true })
map(2, { "n" }, "[{", "", { hidden = true })
map(2, { "n" }, "]}", "", { hidden = true })
map(2, { "n" }, "[<", "", { hidden = true })
map(2, { "n" }, "[>", "", { hidden = true })
map(2, { "n" }, "[>", "", { hidden = true })

map(2, { "n" }, "<c-w>d", "", { hidden = true })
map(2, { "n" }, "<c-w>q", "", { hidden = true })
map(2, { "n" }, "<c-w>v", "", { hidden = true })
map(2, { "n" }, "<c-w>w", "", { hidden = true })
map(2, { "n" }, "<c-w>T", "", { hidden = true })
map(2, { "n" }, "<c-w>=", "", { hidden = true })
map(2, { "n" }, "<c-w>+", "", { hidden = true })
map(2, { "n" }, "<c-w>-", "", { hidden = true })
map(2, { "n" }, "<c-w><", "", { hidden = true })
map(2, { "n" }, "<c-w>>", "", { hidden = true })
map(2, { "n" }, "<c-w>_", "", { hidden = true })
map(2, { "n" }, "<c-w>|", "", { hidden = true })
map(2, { "n" }, "<c-w><c-d>", "", { hidden = true })
map(2, { "n", "o" }, "<LeftRelease>", "", { hidden = true })

map(2, { "n" }, "zA", "", { hidden = true })
map(2, { "n" }, "zC", "", { hidden = true })
map(2, { "n" }, "zD", "", { hidden = true })
map(2, { "n" }, "zE", "", { hidden = true })
map(2, { "n" }, "zi", "", { hidden = true })
map(2, { "n" }, "zm", "", { hidden = true })
map(2, { "n" }, "zM", "", { hidden = true })
map(2, { "n" }, "zO", "", { hidden = true })
map(2, { "n" }, "zr", "", { hidden = true })
map(2, { "n" }, "zR", "", { hidden = true })
map(2, { "n" }, "zv", "", { hidden = true })
map(2, { "n" }, "zx", "", { hidden = true })
map(2, { "n" }, "z<cr>", "", { hidden = true })

-- remaped keymaps
map(0, { "n" }, "[s", "]s", { desc = "Misspelled word" })
map(0, { "n" }, "[n", "]m", { desc = "Method start" })
map(0, { "n" }, "[N", "]M", { desc = "Method end" })
map(0, { "n" }, "[%", "]%", { desc = "Unmatched group" })
map(0, { "n" }, "]s", "[s", { desc = "Misspelled word" })
map(0, { "n" }, "]n", "[m", { desc = "Method start" })
map(0, { "n" }, "]N", "[M", { desc = "Method end" })
map(0, { "n" }, "]%", "[%", { desc = "Unmatched group" })
map(0, { "n" }, "zz", "zz", { desc = "Center this line" })
map(0, { "n" }, "zs", "zs", { desc = "Left this line" })
map(0, { "n" }, "zt", "zt", { desc = "Top this line" })
map(0, { "n" }, "zv", "zv", { desc = "Show cursor line" })
map(0, { "n" }, "zw", "zw", { desc = "Mark word as bad/misspelling" })
map(0, { "n" }, "z=", "z=", { desc = "Spelling suggestions" })
map(0, { "n" }, "zL", "zL", { desc = "Half screen to the right" })
map(0, { "n" }, "zg", "zg", { desc = "Add word to spell list" })
map(0, { "n" }, "zH", "zH", { desc = "Half screen to the right" })
map(0, { "n" }, "ze", "ze", { desc = "Right this line" })
map(0, { "n" }, "zb", "zb", { desc = "Bottom this line" })
map(0, { "n", "v" }, "<esc>", "<esc><Plug>(clever-f-reset)", { desc = "Reset" })

---- yank
map(0, { "v" }, "<c-y>", '"+ygv <esc>h', { desc = "Yank" })
map(0, { "v" }, "y", "ygv <esc>h", { desc = "Yank" })

---- undo / redo
map(0, { "n" }, "u", "<cmd>silent undo<cr>", { desc = "Undo" })
map(0, { "n" }, "<c-r>", "<cmd>silent redo<cr>", { desc = "Redo" })

---- incremental / decremenal
map(0, { "n" }, "<c-a>", "<c-a>", { desc = "Incremental" })
map(0, { "n" }, "<c-x>", "<c-x>", { desc = "Decremental" })

---- indentation
map(0, { "v" }, "<", "<gv", { desc = "Left" })
map(0, { "v" }, ">", ">gv", { desc = "Right" })

---- buffer / tabs
map(0, { "n" }, "<c-s-h>", "<cmd>bprevious<cr>", { desc = "Previous" })
map(0, { "n" }, "<c-s-l>", "<cmd>bnext<cr>", { desc = "Next" })
map(0, { "n" }, "<c-s-j>", "<cmd>tabnext<cr>", { desc = "Next" })
map(0, { "n" }, "<c-s-k>", "<cmd>tabprevious<cr>", { desc = "Previous" })

---- cursor navigation
map(0, { "i", "c" }, "<c-h>", "<left>", { desc = "Left" })
map(0, { "i", "c" }, "<c-j>", "<down>", { desc = "Down" })
map(0, { "i", "c" }, "<c-k>", "<up>", { desc = "Up" })
map(0, { "i", "c" }, "<c-l>", "<right>", { desc = "Right" })
map(0, { "i" }, "<c-s-h>", " ", { desc = "Left" })
map(0, { "i" }, "<c-s-j>", "<esc>O", { desc = "Down" })
map(0, { "i" }, "<c-s-k>", "<esc>o", { desc = "Up" })
map(0, { "i" }, "<c-s-l>", " <left>", { desc = "Right" })
map(0, { "n" }, "<c-h>", "<c-w>h", { desc = "Left" })
map(0, { "n" }, "<c-j>", "<c-w>j", { desc = "Down" })
map(0, { "n" }, "<c-k>", "<c-w>k", { desc = "Up" })
map(0, { "n" }, "<c-l>", "<c-w>l", { desc = "Right" })
map(0, { "n" }, "<c-p>", "<c-w>w", { desc = "Previous" })
map(0, { "t" }, "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Left" })
map(0, { "t" }, "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Down" })
map(0, { "t" }, "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Up" })
map(0, { "t" }, "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Right" })
map(0, { "t" }, "<c-p>", "<c-\\><c-n><c-w>w", { desc = "Previous" })

---- backspace
map(0, { "i" }, "<s-bs>", "<right><bs>", { desc = "Forward" })

---- fix
map(0, { "n" }, "q", func.handle_q_colon_key, { desc = "Native q" })
map(0, { "v" }, "p", '"_dp', { desc = "Native p" })
map(0, { "n" }, "x", '"_x', { desc = "Native x" })
map(0, { "n" }, "j", "gj", { desc = "Native j" })
map(0, { "n" }, "k", "gk", { desc = "Native k" })

---- options
map(0, { "n" }, option_leader, "", { desc = "Options" })
map(0, { "n" }, option_leader .. "c", "", { desc = "Cursor" })
map(0, { "n" }, option_leader .. "ch", "", { desc = "Highlight" })
map(0, { "n" }, option_leader .. "cs", "", { desc = "Scrolloff" })
map(0, { "n" }, option_leader .. "l", "", { desc = "Line" })
map(0, { "n" }, option_leader .. "ln", "", { desc = "Number" })
map(0, { "n" }, option_leader .. "lw", "<cmd>set wrap! <cr>", { desc = "Wrap" })
map(0, { "n" }, option_leader .. "lnn", "<cmd>set number!<cr>", { desc = "Absolute" })
map(0, { "n" }, option_leader .. "lnr", "<cmd>set relativenumber!<cr>", { desc = "Relative" })
map(0, { "n" }, option_leader .. "chl", "<cmd>set cursorline! <cr>", { desc = "Line" } )
map(0, { "n" }, option_leader .. "chc", "<cmd>set cursorcolumn! <cr>", { desc = "Column" })
map(0, { "n" }, option_leader .. "csx", func.scrolloff, { desc = "Middle line" })
map(0, { "n" }, option_leader .. "csy", func.sidescrolloff, { desc = "Middle Column" })

---- next / previous
map(0, { "n" }, "[z", "zo", { desc = "Open fold" })
map(0, { "n" }, "]z", "zc", { desc = "Close fold" })
map(0, { "n" }, "]q", "<cmd>cprevious<cr>", { desc = "Quickfix" })
map(0, { "n" }, "[q", "<cmd>cnext<cr>", { desc = "Quickfix" })
map(0, { "n" }, "]b", "<cmd>bprevious<cr>", { desc = "Buffer" })
map(0, { "n" }, "[b", "<cmd>bnext<cr>", { desc = "Buffer" })
map(0, { "n" }, "]t", "<cmd>tabnext<cr>", { desc = "Tab" })
map(0, { "n" }, "[t", "<cmd>tabprevious<cr>", { desc = "Tab" })

---- lsp
local lint_autocmd_id = nil
local lsp_augroup = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_augroup,
  callback = function()
		map(0, { "n" }, "[d", func.diagnostic_goto(true), { desc = "Diagnostic", buffer = true})
		map(0, { "n" }, "]d", func.diagnostic_goto(false), { desc = "Diagnostic", buffer = true})
		map(0, { "n" }, "[e", func.diagnostic_goto(true, "error"), { desc = "Error", buffer = true})
		map(0, { "n" }, "]e", func.diagnostic_goto(false, "error"), { desc = "Error", buffer = true})
		map(0, { "n" }, "[i", func.diagnostic_goto(true, "info"), { desc = "Info", buffer = true})
		map(0, { "n" }, "]i", func.diagnostic_goto(false, "info"), { desc = "Info", buffer = true})
		map(0, { "n" }, "[w", func.diagnostic_goto(true, "warn"), { desc = "Warn", buffer = true})
		map(0, { "n" }, "]w", func.diagnostic_goto(false, "warn"), { desc = "Warn", buffer = true})
		map(0, { "n" }, "[h", func.diagnostic_goto(true, "hint"), { desc = "Hint", buffer = true})
		map(0, { "n" }, "]h", func.diagnostic_goto(false, "hint"), { desc = "Hint", buffer = true})

		map(2, { "n" }, lsp_leader, "", { desc = "Lsp", buffer = true})
		map(0, { "n" }, lsp_leader .. "c",  "", { desc = "Code", buffer = true })
		map(0, { "n" }, lsp_leader .. "l",  "", { desc = "Lsp", buffer = true })
		map(0, { "n" }, lsp_leader .. "f",  "", { desc = "Find", buffer = true })

		map(0, { "n" }, lsp_leader .. "fd", "", { desc = "Diagnostic", buffer = true })
		map(0, { "n" }, lsp_leader .. "ca", vim.lsp.buf.code_action, { desc = "Actions", buffer = true})
		map(0, { "n" }, lsp_leader .. "r", vim.lsp.buf.rename, { desc = "Rename", buffer = true})
		map(0, { "n" }, lsp_leader .. "h", vim.lsp.buf.hover, { desc = "Hover", buffer = true})
		map(0, { "n" }, lsp_leader .. "fr", "<cmd>Telescope lsp_references<cr>", { desc = "References", buffer = true})
		map(0, { "n" }, lsp_leader .. "fd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Definitions", buffer = true})
		map(0, { "n" }, lsp_leader .. "fi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations", buffer = true})
		map(0, { "n" }, lsp_leader .. "ft", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type definitions", buffer = true})
		map(0, { "n" }, lsp_leader .. "fi", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Current", buffer = true })
		map(0, { "n" }, lsp_leader .. "fI", "<cmd>Telescope diagnostics<cr>", { desc = "All", buffer = true })

		map(0, { "n" }, lsp_leader .. "F", vim.diagnostic.open_float, { desc = "Next diag", buffer = true})
		map(0, { "n" }, lsp_leader .. "d", function () func.diagnostic_goto(true) end, { desc = "Next diag", buffer = true})
		map(0, { "n" }, lsp_leader .. "D", function () func.diagnostic_goto(false) end, { desc = "Previous diag", buffer = true})
		map(0, { "n" }, lsp_leader .. "e", function () func.diagnostic_goto(true, "error") end, { desc = "Next error", buffer = true})
		map(0, { "n" }, lsp_leader .. "E", function () func.diagnostic_goto(false, "error") end, { desc = "Previous error", buffer = true})
		map(0, { "n" }, lsp_leader .. "w", function () func.diagnostic_goto(true, "warn") end, { desc = "Next warn", buffer = true})
		map(0, { "n" }, lsp_leader .. "W", function () func.diagnostic_goto(false, "warn") end, { desc = "Previous warn", buffer = true})
		map(0, { "n" }, lsp_leader .. "h", function () func.diagnostic_goto(true, "hint") end, { desc = "Next hint", buffer = true})
		map(0, { "n" }, lsp_leader .. "H", function () func.diagnostic_goto(false, "hint") end, { desc = "Previous hint", buffer = true})
		map(0, { "n" }, lsp_leader .. "i", function () func.diagnostic_goto(true, "info") end, { desc = "Next info", buffer = true})
		map(0, { "n" }, lsp_leader .. "I", function () func.diagnostic_goto(false, "info") end, { desc = "Previous info", buffer = true})

		map(0, { "n" }, trouble_leader, "", { desc = "Trouble", buffer = true })
		map(0, { "n" }, trouble_leader .. "T", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle (current)", buffer = true })
		map(0, { "n" }, trouble_leader .. "t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle (all)", buffer = true })
		map(0, { "n" }, trouble_leader .. "s", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols", buffer = true })
		map(0, { "n" }, trouble_leader .. "r", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Lsp dev / ref", buffer = true })
		map(0, { "n" }, trouble_leader .. "l", "<cmd>Trouble loclist toggle<cr>", { desc = "Loc List", buffer = true })
		map(0, { "n" }, trouble_leader .. "q", "<cmd>Trouble qflist toggle<cr>", { desc = "Qf List", buffer = true })

		map(0, { "n" }, linter_leader, "", { desc = "Linter", buffer = true })
		map(0, { "n" }, linter_leader .. "t", function() if not lint_autocmd_id then lint_autocmd_id = vim.api.nvim_create_autocmd("BufWritePost", { callback = function() require("lint").try_lint() end, group = vim.api.nvim_create_augroup("LintAutocmdGroup", { clear = true }), }) vim.notify("Linting enabled on BufWritePost", vim.log.levels.INFO) else vim.notify("Linting is already enabled", vim.log.levels.WARN) end end, { desc = "Enable lint (After save)", buffer = true })
		map(0, { "n" }, linter_leader .. "x", function() if lint_autocmd_id then vim.api.nvim_del_autocmd(lint_autocmd_id) lint_autocmd_id = nil vim.notify("Linting disabled on BufWritePost", vim.log.levels.INFO) else vim.notify("Linting is already disabled", vim.log.levels.WARN) end end, { desc = "Disable lint (After save)", buffer = true })
		map(0, { "n" }, linter_leader .. "c", function() require("lint").try_lint() end, { desc = "Current check", buffer = true })

		map(0, { "n", "v" }, formatter_leader .. "z", function() require("conform").format({ lsp_fallback = true, async = true, timeout_ms = 500, }) end, { desc = "Format by conform", buffer = true })
		map(0, { "n", "v" }, formatter_leader .. "Z", vim.lsp.buf.format, { desc = "Format by lsp", buffer = true })

		map(0, { "n" }, lsp_leader .. "li", "<cmd>LspInfo<cr>", { desc = "Info", buffer = true })
		map(0, { "n" }, lsp_leader .. "lI", "<cmd>LspInstall<cr>", { desc = "Install", buffer = true })
		map(0, { "n" }, lsp_leader .. "lr", "<cmd>LspRestart<cr>", { desc = "Restart", buffer = true })
		map(0, { "n" }, lsp_leader .. "ls", function() if #vim.lsp.get_clients() > 0 then vim.cmd("LspStop") vim.notify("Lsp stopped...") else vim.cmd("LspStart") vim.notify("Lsp started...") end end, { desc = "Strat/Stop", buffer = true })
		map(0, { "n" }, lsp_leader .. "lc", "<cmd>lua =vim.lsp.get_clients()[1].server_capabilities<cr>", { desc = "Server's capability", buffer = true })

		map(2, { "n" }, lsp_leader .. "a", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "<esc>", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "fo", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "s", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "<cr>", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "<s-cr>", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "<tab>", "", { buffer = true, hidden = true })
		map(2, { "n" }, lsp_leader .. "<s-tab>", "", { buffer = true, hidden = true })
	end,
})


---- neo-tree local keys
local neotree_augroup = vim.api.nvim_create_augroup("NeotreeKeymaps", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
	group = neotree_augroup,
	pattern = "neo-tree",
	callback = function ()
		map(2, { "n" }, neotree_local_leader, "", { desc = "Explorer", buffer = true })
	end
})


---- fold
map(2, { "n" }, folding_leader, "", { desc =  "z" })
map(0, { "n" }, folding_leader .. "i", "zi", { desc = "Toggle" })
map(2, { "n" }, folding_leader .. "T", "", { desc = "Toggle" })
map(0, { "n" }, folding_leader .. "Ti", "za", { desc = "In" })
map(0, { "n" }, folding_leader .. "To", "zA", { desc = "Out" })
map(2, { "n" }, folding_leader .. "o", "", { desc = "Open" })
map(0, { "n" }, folding_leader .. "oi", "zo", { desc = "In" })
map(0, { "n" }, folding_leader .. "oo", "zO", { desc = "Out" })
map(2, { "n" }, folding_leader .. "c", "", { desc = "Close" })
map(0, { "n" }, folding_leader .. "ci", "zc", { desc = "In" })
map(0, { "n" }, folding_leader .. "co", "zC", { desc = "Out" })
map(2, { "n" }, folding_leader .. "d", "", { desc = "Delete" })
map(0, { "n" }, folding_leader .. "di", "zd", { desc = "In" })
map(0, { "n" }, folding_leader .. "do", "zD", { desc = "Out" })
map(0, { "n" }, folding_leader .. "da", "zE", { desc = "All" })
map(2, { "n" }, folding_leader .. "f", "", { desc = "Fold" })
map(0, { "n", "v" }, folding_leader .. "fc", "zf", { desc = "Create" })
map(0, { "n" }, folding_leader .. "fm", "zm", { desc = "More" })
map(0, { "n" }, folding_leader .. "fl", "zr", { desc = "Less" })
map(0, { "n" }, folding_leader .. "fu", "zx", { desc = "Update" })

---- navigation
map(2, { "n" }, navigation_leader1, "", { desc = "Nav+Surround" })
map(0, { "n" }, navigation_leader1 .. "x", "<cmd> nohlsearch <cr>", { desc = "Clear search" })
map(0, { "n" }, navigation_leader1 .. "r", ":%s/", { desc = "Replace" })
map(0, { "v" }, navigation_leader1 .. "r", ":s/", { desc = "Replace" })
map(0, { "n", "v", "s" }, navigation_leader1 .. "R", "<cmd>GrugFar<cr>", { desc = "Replace in all files" })

---- telescope

-- local keymaps
local telescope_augroup = vim.api.nvim_create_augroup("TelescopeKeymaps", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
	group = telescope_augroup,
	pattern = "TelescopePrompt",
	callback = function ()
		map(2, { "n" }, "\\", "", { desc = "Telescope", buffer = true})
		map(0, { "n" }, telescope_local_leader, "", { desc = "Telescope", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "f", "", { desc = "File", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "fo", "", { desc = "Open", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "foh", nil, { desc = "Left", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "foj", nil, { desc = "Down", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "fok", nil, { desc = "Up", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "fol", nil, { desc = "Right", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "fot", nil, { desc = "As Tab", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "h", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files (Hidden)", buffer = true })

		map(0, { "n" }, telescope_local_leader .. "a", "", { desc = "Add", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "aa", nil, { desc = "All", buffer = true })
		map(2, { "n" }, telescope_local_leader .. "as", nil, { desc = "Selected", buffer = true })

		map(0, { "n" }, telescope_local_leader .. "<tab>", "", { desc = "Select & up", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "<s-tab>", "", { desc = "Select & down", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "<cr>", "", { desc = "Enter", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "<esc>", "", { desc = "Quit", buffer = true })
		map(0, { "n" }, telescope_local_leader .. "s", "", { desc = "Search", buffer = true })

		map(2, { "n" }, "si", "", { desc = "Line", buffer = true })
	end
})

--
---- toggleterm
-- local count = 0
-- local function toggle_term_open(key)
--
-- local split_ratio = 3 -- less is bigger window, higher is smaller window
-- local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
-- local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)
-- count = count + 1
-- local hori_vert, split_size
--
--  	if key == "h" then
--  		hori_vert = "vertical"
--  		split_size = w_split_size
--  	elseif key == "k" then
--  		hori_vert = "horizontal"
--  		split_size = h_split_size
--  	elseif key == "j" then
--  		hori_vert = "horizontal"
--  		split_size = h_split_size
--  	elseif key == "l" then
--  		hori_vert = "vertical"
--  		split_size = w_split_size
--  	end
--
--  	local windows = vim.api.nvim_list_wins()
--  	for _, win in ipairs(windows) do
--  		local buf = vim.api.nvim_win_get_buf(win)
--  		local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
--  		if filetype == "toggleterm" then
--  			split_size = 0
--  		end
-- end
--
--  	require("toggleterm").toggle(count, split_size, vim.loop.cwd(), hori_vert)
--
--  	-- vim.cmd("wincmd " .. string.upper(key))
--  	-- vim.cmd(hori_vert .. " resize " .. split_size)
--  end
--
--  map(0, { "n" }, toggleterm_leader, "", { desc = "Toggleterm/Tmux)" })
--  map(0, { "n", "t" }, toggleterm_leader .. "t", "<cmd>ToggleTerm<cr>", { desc = "Toggle"  })
 -- map(0, { "n", "t" }, toggleterm_leader .. "l", "<cmd>lua require('toggleterm-manager').open({})<cr>", { desc = "List"  })
--
--  -- vim.cmd("ToggleTerm size=".. split_size .. " direction=" .. toggleterm_direction)
--  -- vim.cmd("wincmd " .. string.upper(key))
--  -- vim.cmd(toggleterm_direction .. " resize " .. split_size)
--
--  map(0, { "n" }, toggleterm_leader .. "o", "", { desc = "Open" })
--  map(0, { "n" }, toggleterm_leader .. "oh", function() toggle_term_open("h") end, { desc = "Left" }, toggleterm_leader .. "o", false)
--  map(0, { "n" }, toggleterm_leader .. "oj", function() toggle_term_open("j") end, { desc = "Down" }, toggleterm_leader .. "o", false)
--  map(0, { "n" }, toggleterm_leader .. "ok", function() toggle_term_open("k") end, { desc = "Up" }, toggleterm_leader .. "o", false)
--  map(0, { "n" }, toggleterm_leader .. "ol", function() toggle_term_open("l") end, { desc = "Right" }, toggleterm_leader .. "o", false)
--  map(0, { "n" }, toggleterm_leader .. "of", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
--
--  map(0, { "n" }, toggleterm_leader .. "oc", "", { desc = "Counted" })
--  map(0, { "n" }, toggleterm_leader .. "och", function() func.toggleterm_tmux("h", 1) end, { desc = "Left" })
--  map(0, { "n" }, toggleterm_leader .. "ocj", function() func.toggleterm_tmux("j", 1) end, { desc = "Down" })
--  map(0, { "n" }, toggleterm_leader .. "ock", function() func.toggleterm_tmux("k", 1) end, { desc = "Up" })
--  map(0, { "n" }, toggleterm_leader .. "ocl", function() func.toggleterm_tmux("l", 1) end, { desc = "Right" })
--
--  map(0, { "n" }, toggleterm_leader .. "x", "", { desc = "Close" })
--
--  local function toggleterm_close()
--  	local result = vim.fn.system("tmux info")
--  	if vim.v.shell_error == 0 then
--  		map(0, { "n" }, toggleterm_leader .. "xh", function() func.toggleterm_tmux_close("h") end, { desc = "Left" })
--  		map(0, { "n" }, toggleterm_leader .. "xj", function() func.toggleterm_tmux_close("j") end, { desc = "Up" })
--  		map(0, { "n" }, toggleterm_leader .. "xk", function() func.toggleterm_tmux_close("k") end, { desc = "Down" })
--  		map(0, { "n" }, toggleterm_leader .. "xl", function() func.toggleterm_tmux_close("l") end, { desc = "Right" })
--  	else
--  		map(0, { "n" }, toggleterm_leader .. "xh", "<c-w>h<c-w>nc<c-w>p", { desc = "Left" })
--  		map(0, { "n" }, toggleterm_leader .. "xj", "<c-w>j<c-w>c<c-w>p", { desc = "Up" })
--  		map(0, { "n" }, toggleterm_leader .. "xk", "<c-w>k<c-w>c<c-w>p", { desc = "Down" })
--  		map(0, { "n" }, toggleterm_leader .. "xl", "<c-w>l<c-w>c<c-w>p", { desc = "Right" })
--  	end
--  end
--  toggleterm_close()
--
--
--
-- -- TODO: add terminal float window
-- -- map(0, { "n" }, toggleterm_leader, "", { desc = "Toggleterm/Tmux)" })
-- -- map(0, { "n", "t" }, toggleterm_leader .. "t", function() func.toggle_toggleterm_tmux() end, { desc = "Toggle"  })
-- --
-- -- map(0, { "n" }, toggleterm_leader .. "o", "", { desc = "Open" })
-- -- map(0, { "n" }, toggleterm_leader .. "oh", function() func.toggleterm_tmux("h", 0) end, { desc = "Left" })
-- -- map(0, { "n" }, toggleterm_leader .. "oj", function() func.toggleterm_tmux("j", 0) end, { desc = "Down" })
-- -- map(0, { "n" }, toggleterm_leader .. "ok", function() func.toggleterm_tmux("k", 0) end, { desc = "Up" })
-- -- map(0, { "n" }, toggleterm_leader .. "ol", function() func.toggleterm_tmux("l", 0) end, { desc = "Right" })
-- --
-- -- map(0, { "n" }, toggleterm_leader .. "oc", "", { desc = "Counted" })
-- -- map(0, { "n" }, toggleterm_leader .. "och", function() func.toggleterm_tmux("h", 1) end, { desc = "Left" })
-- -- map(0, { "n" }, toggleterm_leader .. "ocj", function() func.toggleterm_tmux("j", 1) end, { desc = "Down" })
-- -- map(0, { "n" }, toggleterm_leader .. "ock", function() func.toggleterm_tmux("k", 1) end, { desc = "Up" })
-- -- map(0, { "n" }, toggleterm_leader .. "ocl", function() func.toggleterm_tmux("l", 1) end, { desc = "Right" })
-- --
-- -- map(0, { "n" }, toggleterm_leader .. "x", "", { desc = "Close" })
-- --
-- -- local function toggleterm_close()
-- -- 	local result = vim.fn.system("tmux info")
-- -- 	if vim.v.shell_error == 0 then
-- -- 			map(0, { "n" }, toggleterm_leader .. "xh", function() func.toggleterm_tmux_close("h") end, { desc = "Left" })
-- -- 			map(0, { "n" }, toggleterm_leader .. "xj", function() func.toggleterm_tmux_close("j") end, { desc = "Up" })
-- -- 			map(0, { "n" }, toggleterm_leader .. "xk", function() func.toggleterm_tmux_close("k") end, { desc = "Down" })
-- -- 			map(0, { "n" }, toggleterm_leader .. "xl", function() func.toggleterm_tmux_close("l") end, { desc = "Right" })
-- -- 	else
-- -- 			map(0, { "n" }, toggleterm_leader .. "xh", "<c-w>h<c-w>nc<c-w>p", { desc = "Left" })
-- -- 			map(0, { "n" }, toggleterm_leader .. "xj", "<c-w>j<c-w>c<c-w>p", { desc = "Up" })
-- -- 			map(0, { "n" }, toggleterm_leader .. "xk", "<c-w>k<c-w>c<c-w>p", { desc = "Down" })
-- -- 			map(0, { "n" }, toggleterm_leader .. "xl", "<c-w>l<c-w>c<c-w>p", { desc = "Right" })
-- -- 	end
-- -- end
-- -- toggleterm_close()
--
-- undotree local keymaps
local undotree_augroup = vim.api.nvim_create_augroup("UndotreeKeymaps", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
	group = undotree_augroup,
	pattern = "undotree",
	callback = function ()
		map(2, { "n" }, undotree_local_leader, "", { desc = "Undotree", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "x", "<plug>UndotreeClose", { desc = "Close", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "u", "<Plug>UndotreeUndo", { desc = "Undo", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "r", "<Plug>UndotreeRedo", { desc = "Redo", buffer = true })

		map(2, { "n" }, undotree_local_leader .. "f", "<Plug>UndotreeFocusTarget", { desc = "Focus target", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "c", "<Plug>UndotreeClearHistory", { desc = "Clear history", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "t", "<Plug>UndotreeTimestampToggle", { desc = "Timestamp", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "d", "<Plug>UndotreeDiffToggle", { desc = "Diff", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "K", "<Plug>UndotreeNextState", { desc = "Next", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "J", "<Plug>UndotreePreviousState", { desc = "Previous", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "s", "<Plug>UndotreeNextSavedState", { desc = "Next saved", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "S", "<Plug>UndotreePreviousSavedState", { desc = "Previous saved", buffer = true })
		map(2, { "n" }, undotree_local_leader .. "<cr>", "<Plug>UndotreeEnter", { desc = "Enter", buffer = true })
	end
})

---- windows
map(0, { "n" }, windows_leader, "", { desc = "Window" })
map(0, { "n" }, windows_leader .. "o", "", { desc = "Open" })
map(0, { "n" }, windows_leader .. "rm", "", { desc = "Maximize" })
map(0, { "n" }, windows_leader .. "r", "", { desc = "Resize" })
map(0, { "n" }, windows_leader .. "s", "", { desc = "Swap" })
map(0, { "n" }, windows_leader .. "m", "", { desc = "Move" })
map(0, { "n" }, windows_leader .. "x", "", { desc = "Close" })

map(0, { "n" }, windows_leader .. "t", "<c-w>T", { desc = "Break into tab" })

map(0, { "n" }, windows_leader .. "oj", "<cmd>set nosplitbelow<bar>split<cr>", { desc = "Down" })
map(0, { "n" }, windows_leader .. "ok", "<cmd>set splitbelow<bar>split<cr>", { desc = "Up" })
map(0, { "n" }, windows_leader .. "oh", "<cmd>set splitbelow<bar>vsplit<cr>", { desc = "Left" } )
map(0, { "n" }, windows_leader .. "ol", "<cmd>set nosplitbelow<bar>vsplit<cr>", { desc = "Right" })

map(0, { "n" }, windows_leader .. "xc", "<c-w>c", { desc = "Current" })
map(0, { "n" }, windows_leader .. "xh", "<c-w>h<c-w>c<c-w>p", { desc = "Left" }, windows_leader .. "x")
map(0, { "n" }, windows_leader .. "xj", "<c-w>j<c-w>c<c-w>p", { desc = "Down" }, windows_leader .. "x")
map(0, { "n" }, windows_leader .. "xk", "<c-w>k<c-w>c<c-w>p", { desc = "Up" }, windows_leader .. "x")
map(0, { "n" }, windows_leader .. "xl", "<c-w>l<c-w>c<c-w>p", { desc = "Right" }, windows_leader .. "x")
map(0, { "n" }, windows_leader .. "xo", "<c-w>o", { desc = "Others" })

map(0, { "n" }, windows_leader .. "xC", "<cmd>bd<cr>", { desc = "Current (With buffer)" })
map(0, { "n" }, windows_leader .. "xH", "<c-w>h<cmd>bd<cr><c-w>p", { desc = "Left (With buffer)" })
map(0, { "n" }, windows_leader .. "xJ", "<c-w>j<cmd>bd<cr><c-w>p", { desc = "Down (With buffer)" })
map(0, { "n" }, windows_leader .. "xK", "<c-w>k<cmd>bd<cr><c-w>p", { desc = "Up (With buffer)" })
map(0, { "n" }, windows_leader .. "xL", "<c-w>l<cmd>bd<cr><c-w>p", { desc = "Right (With buffer)" })


map(0, { "n" }, windows_leader .. "mj", "<cmd>wincmd J<cr>", { desc = "Most bottom" })
map(0, { "n" }, windows_leader .. "mk", "<cmd>wincmd K<cr>", { desc = "Most up" })
map(0, { "n" }, windows_leader .. "mh", "<cmd>wincmd H<cr>", { desc = "Most left" })
map(0, { "n" }, windows_leader .. "ml", "<cmd>wincmd L<cr>", { desc = "Most right" })

map(0, { "n" }, windows_leader .. "ss", "<c-w>r", { desc = "Swap" })
map(0, { "n" }, windows_leader .. "sS", "<c-w>R", { desc = "Swap reverse" })

map(0, { "n" }, windows_leader .. "rh", "<cmd>vertical resize -5<cr>", { desc = "Left" }, windows_leader .."r" )
map(0, { "n" }, windows_leader .. "rj", "<cmd>resize -2<cr>", { desc = "Down" }, windows_leader .."r")
map(0, { "n" }, windows_leader .. "rk", "<cmd>resize +2<cr>", { desc = "Up" }, windows_leader .."r")
map(0, { "n" }, windows_leader .. "rl", "<cmd>vertical resize +5<cr>", { desc = "Right" }, windows_leader .."r")


---- tabs
map(0, { "n" }, tab_leader, "", { desc = "Tabs" })
map(0, { "n" }, tab_leader .. "L", "<cmd>tabs<cr>", { desc = "List" })
map(0, { "n" }, tab_leader .. "<c-s-k>", "<cmd>tabnext<cr>", { desc = "Prev" })
map(0, { "n" }, tab_leader .. "<c-s-j>", "<cmd>tabprevious<cr>", { desc = "Next" })
map(0, { "n" }, tab_leader .. "o", "<cmd>tabnew<cr>", { desc = "Open" })
map(0, { "n" }, tab_leader .. "f", "<cmd>tabfirst<cr>", { desc = "First" })
map(0, { "n" }, tab_leader .. "l", "<cmd>tablast<cr>", { desc = "Last" })
map(0, { "n" }, tab_leader .. "x", "<cmd>tabclose<cr>", { desc = "Current" })
map(0, { "n" }, tab_leader .. "X", "<cmd>tabonly<cr>", { desc = "Others" })

---- location / quickfix list
map(0, { "n" }, loc_qfix_list_leader, "", { desc = "Loc/Quick list" })
map(0, { "n" }, loc_qfix_list_leader .. "l", "<cmd>lopen<cr>", { desc = "Open (Loclist)" })
map(0, { "n" }, loc_qfix_list_leader .. "L", "<cmd>lclose<cr>", { desc = "Close (Loclist)" })
map(0, { "n" }, loc_qfix_list_leader .. "q", "<cmd>copen<cr>", { desc = "Open (QfList)" })
map(0, { "n" }, loc_qfix_list_leader .. "Q", "<cmd>cclose<cr>", { desc = "Close (QfList)" })

