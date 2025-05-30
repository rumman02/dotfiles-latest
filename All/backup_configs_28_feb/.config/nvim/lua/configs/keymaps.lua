local keys = require("lib.keys")
local func = require("lib.func")
local map = func.map

--[[
map function's first parameter only recieves value of 0, 1, 2.
0 means, the mappings will set by vim.keymap.set().
1 means, the mappings will returns a table that similar as what plugins.key
recieves.
2 means, the mappitngs will set by which-key plugin.
]]

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
map(2, { "n" }, "[%", "", { hidden = true })
map(2, { "n" }, "[%", "", { hidden = true })

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
map(0, { "i" }, "<s-bs>", "<right><bs>", { desc = "Forward" })

---- yank
map(0, { "v" }, "<c-y>", '"+ygv <esc>h', { desc = "Yank" })
map(0, { "v" }, "y", "ygv <esc>h", { desc = "Yank" })

---- undo / redo
map(0, { "n" }, "u", "<cmd>silent undo<cr>", { desc = "Undo" })
map(0, { "n" }, "<c-r>", "<cmd>silent redo<cr>", { desc = "Redo" })

---- incremental / decremenal
-- map(0, { "n" }, "<c-a>", "<c-a>", { desc = "Incremental" })
-- map(0, { "n" }, "<c-x>", "<c-x>", { desc = "Decremental" })

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

---- fix
map(0, { "v" }, "p", '"_dp', { desc = "Native p" })
map(0, { "n" }, "x", '"_x', { desc = "Native x" })
-- map(0, { "n" }, "j", "gj", { desc = "Native j" })
-- map(0, { "n" }, "k", "gk", { desc = "Native k" })

---- next / previous
map(0, { "n" }, "[z", "zo", { desc = "Open fold" })
map(0, { "n" }, "]z", "zc", { desc = "Close fold" })
map(0, { "n" }, "]q", "<cmd>cprevious<cr>", { desc = "Quickfix" })
map(0, { "n" }, "[q", "<cmd>cnext<cr>", { desc = "Quickfix" })
map(0, { "n" }, "]b", "<cmd>bprevious<cr>", { desc = "Buffer" })
map(0, { "n" }, "[b", "<cmd>bnext<cr>", { desc = "Buffer" })
map(0, { "n" }, "]t", "<cmd>tabnext<cr>", { desc = "Tab" })
map(0, { "n" }, "[t", "<cmd>tabprevious<cr>", { desc = "Tab" })

---- fold
local folding_leader = require("lib.keys").folding_leader
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
local search_leader = require("lib.keys").search_leader
map(2, { "n" }, search_leader, "", { desc = "Nav+Surround" })
map(0, { "n" }, search_leader .. "x", "<cmd> nohlsearch <cr>", { desc = "Clear search" })
map(0, { "n" }, search_leader .. "r", ":%s/", { desc = "Replace" })
map(0, { "v" }, search_leader .. "r", ":s/", { desc = "Replace" })
map(0, { "n" }, search_leader .. "R", function() if vim.fn.exists("GrugFar") then vim.cmd("GrugFar") end end, { desc = "Replace in all files" })

---- windows
local window_leader = keys.window_leader
map(0, { "n" }, window_leader, "", { desc = "Window" })

map(0, { "n" }, window_leader .. "t", "<c-w>T", { desc = "Break into tab" })

map(0, { "n" }, window_leader .. "o", "", { desc = "Open" })
map(0, { "n" }, window_leader .. "oj", "<cmd>set nosplitbelow<bar>split<cr>", { desc = "Down" }, window_leader .. "o")
map(0, { "n" }, window_leader .. "ok", "<cmd>set splitbelow<bar>split<cr>", { desc = "Up" }, window_leader .. "o")
map(0, { "n" }, window_leader .. "oh", "<cmd>set splitbelow<bar>vsplit<cr>", { desc = "Left" }, window_leader .. "o")
map(0, { "n" }, window_leader .. "ol", "<cmd>set nosplitbelow<bar>vsplit<cr>", { desc = "Right" }, window_leader .. "o" )

map(0, { "n" }, window_leader .. "x", "", { desc = "Close" })
map(0, { "n" }, window_leader .. "xc", "<c-w>c", { desc = "Current" })
map(0, { "n" }, window_leader .. "xh", "<c-w>h<c-w>c<c-w>p", { desc = "Left" }, window_leader .. "x")
map(0, { "n" }, window_leader .. "xj", "<c-w>j<c-w>c<c-w>p", { desc = "Down" }, window_leader .. "x")
map(0, { "n" }, window_leader .. "xk", "<c-w>k<c-w>c<c-w>p", { desc = "Up" }, window_leader .. "x")
map(5, { "n" }, window_leader .. "xl", "<c-w>l<c-w>c<c-w>p", { desc = "Right" }, window_leader .. "x")
map(0, { "n" }, window_leader .. "xo", "<c-w>o", { desc = "Others" })
map(0, { "n" }, window_leader .. "xC", "<cmd>bd<cr>", { desc = "Current (With buffer)" })
map(0, { "n" }, window_leader .. "xH", "<c-w>h<cmd>bd<cr><c-w>p", { desc = "Left (With buffer)" }, window_leader .. "x")
map(0, { "n" }, window_leader .. "xJ", "<c-w>j<cmd>bd<cr><c-w>p", { desc = "Down (With buffer)" }, window_leader .. "x")
map(0, { "n" }, window_leader .. "xK", "<c-w>k<cmd>bd<cr><c-w>p", { desc = "Up (With buffer)" }, window_leader .. "x")
map(0, { "n" }, window_leader .. "xL", "<c-w>l<cmd>bd<cr><c-w>p", { desc = "Right (With buffer)" }, window_leader .. "x")

map(0, { "n" }, window_leader .. "m", "", { desc = "Move" })
map(0, { "n" }, window_leader .. "mj", "<cmd>wincmd J<cr>", { desc = "Most bottom" })
map(0, { "n" }, window_leader .. "mk", "<cmd>wincmd K<cr>", { desc = "Most up" })
map(0, { "n" }, window_leader .. "mh", "<cmd>wincmd H<cr>", { desc = "Most left" })
map(0, { "n" }, window_leader .. "ml", "<cmd>wincmd L<cr>", { desc = "Most right" })

map(0, { "n" }, window_leader .. "s", "", { desc = "Swap" })
map(0, { "n" }, window_leader .. "ss", "<c-w>r", { desc = "Swap" })
map(0, { "n" }, window_leader .. "sS", "<c-w>R", { desc = "Swap reverse" })

map(0, { "n" }, window_leader .. "r", "", { desc = "Resize" })
-- map(0, { "n" }, window_leader .. "rm", "", { desc = "Maximize" })
map(0, { "n" }, window_leader .. "rh", "<cmd>vertical resize -5<cr>", { desc = "Left" }, window_leader .."r" )
map(0, { "n" }, window_leader .. "rj", "<cmd>resize -2<cr>", { desc = "Down" }, window_leader .."r")
map(0, { "n" }, window_leader .. "rk", "<cmd>resize +2<cr>", { desc = "Up" }, window_leader .."r")
map(0, { "n" }, window_leader .. "rl", "<cmd>vertical resize +5<cr>", { desc = "Right" }, window_leader .."r")


---- tabs
local tab_leader = keys.tab_leader
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
local loc_qfix_list_leader = keys.loc_qfix_list_leader
map(0, { "n" }, loc_qfix_list_leader, "", { desc = "Loc/Quick list" })
map(0, { "n" }, loc_qfix_list_leader .. "l", "<cmd>lopen<cr>", { desc = "Open (Loclist)" })
map(0, { "n" }, loc_qfix_list_leader .. "L", "<cmd>lclose<cr>", { desc = "Close (Loclist)" })
map(0, { "n" }, loc_qfix_list_leader .. "q", "<cmd>copen<cr>", { desc = "Open (QfList)" })
map(0, { "n" }, loc_qfix_list_leader .. "Q", "<cmd>cclose<cr>", { desc = "Close (QfList)" })

-- NOTE: these keymaps are good for if you want to make your default keymaps more powerful
-- -- mappings w/b/e/ge & W/B/E/gE
-- local key_sequence = ""
-- local function bwegeWEBGE(key, current_line, dir, pos, timeout)
-- 	if key_sequence == key then
-- 		key_sequence = ""
-- 		vim.cmd("normal! " .. key)
-- 	else
-- 		key_sequence = key
-- 		vim.defer_fn(function ()
-- 			if key_sequence == key then
-- 				key_sequence = ""
--
-- 				local hop = require("hop")
-- 				local hint = require("hop.hint")
--
-- 				hop.hint_words({
-- 					current_line_only = current_line,
-- 					direction = dir == "before" and hint.HintDirection.BEFORE_CURSOR or hint.HintDirection.AFTER_CURSOR,
-- 					hint_position = pos == "begin" and hint.HintPosition.BEGIN or hint.HintPosition.END,
-- 					multi_windows = current_line and false or true,
-- 				})
-- 			end
-- 		end, timeout)
-- 	end
-- end
--
-- map(0, { "n", "v" }, "w", function () bwegeWEBGE("w", true, "after", "begin", 200) end, { desc = "Native w" })
-- map(0, { "n", "v" }, "b", function () bwegeWEBGE("b", true, "before", "begin", 200) end, { desc = "Native b" })
-- map(0, { "n", "v" }, "e", function () bwegeWEBGE("e", true, "after", "end", 200) end, { desc = "Native e" })
-- map(0, { "n", "v" }, "ge", function () bwegeWEBGE("ge", true, "before", "end", 500) end, { desc = "Native ge" })
--
-- map(0, { "n", "v" }, "W", function () bwegeWEBGE("W", false, "after", "begin", 200) end, { desc = "Native W" })
-- map(0, { "n", "v" }, "B", function () bwegeWEBGE("B", false, "before", "begin", 200) end, { desc = "Native B" })
-- map(0, { "n", "v" }, "E", function () bwegeWEBGE("E", false, "after", "end", 200) end, { desc = "Native E" })
-- map(0, { "n", "v" }, "gE", function () bwegeWEBGE("gE", false, "before", "end", 500) end, { desc = "Native gE" })
--
-- map(0, { "n", "v" }, "f", function()
-- 	if key_sequence == "f" then
-- 		key_sequence = ""
-- 		vim.cmd("normal! " .. "f")
-- 	else
-- 		key_sequence = "f"
-- 		vim.defer_fn(function ()
-- 			if key_sequence == "f" then
-- 				key_sequence = ""
-- 				require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = 0 })
-- 			end
-- 		end, 300)
-- 	end
-- end, { desc = "Native f" })

-- map(0, { "n", "v" }, "ff", function()
-- 				require("hop").hint_char1({ current_line_only = true, direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = 0 })
-- end, { desc = "Native f", nowait = false })
--
-- map(0, { "n", "v" }, "f", "f", { desc = "Native f", nowait = true })

-- -- mappings fFtT
-- local function fFtT(key, current_line, dir, offset, timeout)
--   if key_sequence == key then
--     key_sequence = ""
-- 		local hint = require("hop.hint")
--     require("hop").hint_char1({
--       current_line_only = current_line,
--       direction = dir == "before" and hint.HintDirection.BEFORE_CURSOR or hint.HintDirection.AFTER_CURSOR,
--       hint_offset = offset,
-- 			multi_windows = current_line and false or true,
--     })
--   else
--     key_sequence = key
--     vim.defer_fn(function()
--       if key_sequence == key then
--         key_sequence = ""
--         vim.api.nvim_feedkeys(key, "n", false) -- Native `f` behavior
--       end
--     end, timeout)
--   end
-- end
--
-- vim.keymap.set({ "n", "v" }, "f", function() fFtT("f", true, "after", 0, 300) end, { desc = "Native f" })
-- vim.keymap.set({ "n", "v" }, "F", function() fFtT("F", true, "before", 0, 300) end, { desc = "Native F" })
-- vim.keymap.set({ "n", "v" }, "t", function() fFtT("t", true, "after", -1, 300) end, { desc = "Native t" })
-- vim.keymap.set({ "n", "v" }, "T", function() fFtT("T", true, "before", 1, 300) end, { desc = "Native T" })
