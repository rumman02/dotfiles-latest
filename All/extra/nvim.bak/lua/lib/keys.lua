local M = {}

-- window/buffer/tabs
M.window_leader= "<c-w>"
M.bufferline_leader = "<c-t>"
M.tab_leader = "<c-tab>"

M.toggle_leader = "<tab>"

M.explorer_local_leader = "<localleader>"
M.explorer_leader = "<leader>e"

M.finder_leader = "<leader>f"
M.finder_local_leader = "<localleader>"

M.session_leader = "<leader><leader>s"

M.git_leader = "<leader>g"

M.undotree_leader = "<leader>u"
M.undotree_local_leader = "<localleader>"

M.lsp_leader = "<localleader>"
M.trouble_leader = "<localleader>t"

M.folding_leader = "z"

M.comment_leader1 = "gc"
M.comment_leader2 = "gb"

-- surround/navigation
M.surround_leader1 = "<c-s>s"
M.surround_leader2 = "<c-s><c-s>s"
M.navigation_leader1 = "<c-s>"
M.navigation_leader2 = "<c-s><c-s>"

M.search_leader = "<leader>/"

M.git_leader = "<leader>g"

M.loc_qfix_list_leader = "<leader>z"

M.terminal_leader = "<leader>t"

M.scratch_leader = "<leader>x"

M.option_leader = "<leader><leader>o"

return M
