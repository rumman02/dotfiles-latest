--==================================================--
--                 non plugin keymaps               --
--==================================================--
local which_key = require("which-key")
local keymap_func = require("util.keymap.keymap_func")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--==================================================--==================================================--
--                                         sequential keymaps                                           --
--==================================================--==================================================--

which_key.add({
	--==================================================--
	--               window/smart split                 --
	--==================================================--
	{
		hidden = true,
		cond = true,
		{ "<c-w><c-d>", "<Nop>" },
		{ "<c-w>d", "<Nop>" },
		{ "<c-w>+", "<Nop>" },
		{ "<c-w>-", "<Nop>" },
		{ "<c-w>>", "<Nop>" },
		{ "<c-w><", "<Nop>" },
		{ "<c-w>_", "<Nop>" },
		{ "<c-w>|", "<Nop>" },
		{ "<c-w>w", "<Nop>" },
		{ "<c-w>v", "<Nop>" },
		{ "<c-w>h", "<Nop>" },
		{ "<c-w>j", "<Nop>" },
		{ "<c-w>k", "<Nop>" },
		{ "<c-w>l", "<Nop>" },
		{ "<c-w>=", "<Nop>" },
		{ "<c-w>T", "<Nop>" },
		{ "<c-w>x", "<Nop>" },
		{ "<c-w>c", "<Nop>" },
		{ "<c-w>q", "<Nop>" },
		{ "<c-w>", "<Nop>"},
	},
  { "<c-w>", group = "Window" },
  { "<c-w>o", desc  = "Open" },
  { "<c-w>oj", "<cmd> set nosplitbelow <Bar> split <cr>", desc  = "Open down" },
  { "<c-w>ok", "<cmd> set splitbelow <Bar> split <cr>", desc  = "Open up" },
  { "<c-w>oh", "<cmd> set splitright <Bar> vsplit <cr>", desc  = "Open left" },
  { "<c-w>ol", "<cmd> set nosplitright <Bar> vsplit <cr>", desc  = "Open right" },
  { "<c-w>ot", "<c-w>T", desc  = "Open as tab" },
  { "<c-w>x", desc  = "Close" },
  { "<c-w>xc", "<c-w>c", desc  = "Current" },
  { "<c-w>xh", "<c-w>h<c-w>c", desc  = "Left" },
  { "<c-w>xj", "<c-w>j<c-w>c", desc  = "Down" },
  { "<c-w>xk", "<c-w>k<c-w>c", desc  = "Up" },
  { "<c-w>xl", "<c-w>l<c-w>c", desc  = "Right" },
  { "<c-w>xo", "<c-w>o", desc  = "Others" },
  { "<c-w>m", desc  = "Move" },
  { "<c-w>mj", "<cmd>wincmd J<cr>", desc  = "Move most bottom" },
  { "<c-w>mk", "<cmd>wincmd K<cr>", desc  = "Move most top" },
  { "<c-w>mh", "<cmd>wincmd H<cr>", desc  = "Move most left" },
  { "<c-w>ml", "<cmd>wincmd L<cr>", desc  = "Move most right" },
	{ "<c-w>s", desc = "Swap"  },
	{ "<c-w>sh", "<cmd>SmartSwapLeft<cr>", desc = "Left"  },
	{ "<c-w>sj", "<cmd>SmartSwapDown<cr>", desc = "Down"  },
	{ "<c-w>sk", "<cmd>SmartSwapUp<cr>", desc = "Up"  },
	{ "<c-w>sl", "<cmd>SmartSwapRight<cr>", desc = "Right"  },
  { "<c-w>ss", "<c-w>r", desc  = "Swap" },
  { "<c-w>sr", "<c-w>R", desc  = "Swap reverse" },
  { "<c-w>e", desc  = "Expand" },
  { "<c-w>ea", "<cmd>WindowsToggleAutowidth<cr>", desc  = "Auto toggle" },
  { "<c-w>em", "<cmd>WindowsMaximize<cr>", desc  = "Maximize" },
  { "<c-w>eh", "<cmd>WindowsMaximizeHorizontally<cr>", desc  = "Horizontal" },
  { "<c-w>ej", "<cmd>WindowsMaximizeVertically<cr>", desc  = "Vertical" },
  { "<c-w>ek", "<cmd>WindowsMaximizeVertically<cr>", desc  = "Vertical" },
  { "<c-w>el", "<cmd>WindowsMaximizeHorizontally<cr>", desc  = "Horizontal" },
  { "<c-w>ee", "<cmd>WindowsEqualize<cr>", desc  = "Equal" },
  --[[ { "<c-w>em", "<c-w>|<c-w>_", desc = "Maximize" },
  { "<c-w>eh", "<c-w>|<c-w>_", desc  = "Horizontal" },
  { "<c-w>ej", "<c-w>_", desc  = "Vertical" },
  { "<c-w>ek", "<c-w>_", desc  = "Vertical" },
  { "<c-w>el", "<c-w>|<c-w>_", desc  = "Horizontal" },
  { "<c-w>ee", "<c-w>=", desc  = "Equal" }, ]]
	{ "<c-w>r", function() require("smart-splits").start_resize_mode() end, desc = "Resize mode" },
	--==================================================--
	--                       noice                      --
	--==================================================--
	{ "<localleader>x", "<cmd>NoiceDismiss<cr>", desc = "Notification dismiss"  },
	--==================================================--
	--                     terminal                     --
	--==================================================--
  { "<localleader>T", group = "Terminal" },
	{ "<localleader>T", group = "Terminal" },
	{ "<localleader>To", "<cmd> terminal <cr>", desc = "Open" },
	{ "<localleader>Toc", "<cmd> terminal <cr>", desc = "Current" },
	{ "<localleader>Tok", "<cmd> set nosplitbelow <Bar> split <Bar> terminal <cr>", desc = "Down" },
	{ "<localleader>Toj", "<cmd> set splitbelow <Bar> split <Bar> terminal <cr>", desc = "Up" },
	{ "<localleader>Tol", "<cmd> set splitright <Bar> vsplit <Bar> terminal <cr>", desc = "Left" },
	{ "<localleader>Toh", "<cmd> set nosplitright <Bar> vsplit <Bar> terminal <cr>", desc = "Right" },
	{ "<localleader>Tx", function() keymap_func.close_terminal_buffer() end, desc = "Close" },
	{ "<localleader>Txc", function() keymap_func.close_terminal_buffer() end, desc = "Current" },
	{ "<localleader>Txa", function() keymap_func.close_all_terminal_buffers() end, desc  = "All" },
	--==================================================--
	--                       tabs                       --
	--==================================================--
  { "<localleader>t", group = "Tabs" },
  { "<localleader>to", desc  = "Open" },
  { "<localleader>too", "<cmd>tabnew<cr>", desc  = "Open" },
  { "<localleader>ton", "<cmd>tabnew<cr><bar>:BufferLineTabRename", desc  = "Name" },
  { "<localleader>tx", "<cmd>tabclose<cr>", desc  = "Close" },
  { "<localleader>tl", "<cmd>tabs<cr>", desc  = "List" },
	{ "<localleader>tn", ":BufferLineTabRename", desc = "Rename" },
	--==================================================--
	--                      neotree                     --
	--==================================================--
	{ "<leader>e",  desc = "Explorer" },
	{ "<leader>eh", "<cmd>Neotree left<cr>", desc = "Left" },
	{ "<leader>ej", "<cmd>Neotree bottom<cr>", desc = "Down" },
	{ "<leader>ek", "<cmd>Neotree top<cr>", desc = "Up" },
	{ "<leader>el", "<cmd>Neotree right<cr>", desc = "Right" },
	{ "<leader>ef", "<cmd>Neotree focus float<cr>", desc = "Float" },
	{ "<leader>ec", "<cmd>Neotree reveal<cr>", desc = "Current" },
	{ "<leader>ex", "<cmd>Neotree close<cr>", desc = "Close" },
	{ "<leader>ee", "<cmd>Neotree close<cr><cmd>Neotree focus<cr>", desc = "Focus" },
	--==================================================--
	--                     telescope                    --
	--==================================================--
	{ "<leader>f",  desc = "Find" },
	{ "<leader>fa", "<cmd>Telescope builtin<cr>", desc = "All" },
	{ "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current" },
	{ "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
	{ "<leader>fF", "<cmd>Telescope resume<cr>", desc = "Resume" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Helps" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recents" },
	{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo" },
	{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Words" },
	{ "<leader>fn", "<cmd>Telescope noice<cr>", desc = "Noice" },
	{ "<leader>fs", "<cmd>Telescope spell_suggest<cr>", desc = "Spell suggest" },
	--==================================================--
	--                    bufferline                    --
	--==================================================--
	{ "<leader>b",  desc = "Bufferline" },
	{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick" },
	{ "<leader>bP", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
	{ "<leader>bm", desc = "Move" },
	{ "<leader>bmh", "<cmd>BufferLineMovePrev<cr>", desc = "Right" },
	{ "<leader>bml", "<cmd>BufferLineMoveNext<cr>", desc = "Left" },
	{ "<leader>bx", desc = "Close" },
	{ "<leader>bxh", "<cmd>BufferLineCloseLeft<cr>", desc = "Left all" },
	{ "<leader>bxl", "<cmd>BufferLineCloseRight<cr>", desc = "Right all" },
	{ "<leader>bxp", "<cmd>BufferLinePickClose<cr>", desc = "Pick" },
	{ "<leader>bxc", "<cmd>bdelete<cr>", desc = "Current" },
	{ "<leader>bxo", "<cmd>BufferLineCloseOthers<cr>", desc = "Others" },
	{ "<leader>bS", desc = "Sort" },
	{ "<leader>bSt", "<cmd>BufferLineSortByTabs<cr>", desc = "Tab" },
	{ "<leader>bSd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Directory" },
	{ "<leader>bSr", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "Relative directory" },
	{ "<leader>bSe", "<cmd>BufferLineSortByExtension<cr>", desc = "Extension" },
	{ "<leader>bg", desc = "Group" },
	{ "<leader>bgt", "<cmd>BufferLineGroupToggle<cr>", desc = "Toggle" },
	{ "<leader>bgx", "<cmd>BufferLineGroupClose<cr>", desc = "Close" },
	{ "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", hidden = true },
	{ "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", hidden = true },
	{ "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", hidden = true },
	{ "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", hidden = true },
	{ "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", hidden = true },
	{ "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", hidden = true },
	{ "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", hidden = true },
	{ "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", hidden = true },
	{ "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", hidden = true },
	{ "<leader>b0", "<cmd>BufferLineGoToBuffer 10<cr>", hidden = true },
	--==================================================--
	--                      session                     --
	--==================================================--
	{ "<leader>w", desc = "Session" },
	{ "<leader>wr", "<cmd>SessionRestore<cr>", desc = "Restore" },
	{ "<leader>ws", "<cmd>SessionSave<cr>", desc = "Save" },
	{ "<leader>wS", "<cmd>Telescope session-lens<cr>", desc = "Search" },
	{ "<leader>wn", desc = "Named" },
	{ "<leader>wnr", ":SessionRestore ", desc = "Restore" },
	{ "<leader>wns", ":SessionSave ", desc = "Save" },
	--==================================================--
	--                   search/flash                   --
	--==================================================--
	{
		cond = true,
		hidden = true,
		{ "?", "<Nop>" },
	},
	-- search "?"
	{ "/", group = "Search" },
	{ "//", "/", desc = "Upward search" },
	{ "/?", "?", desc = "Downward search" },
	{ "/h", "<cmd>Telescope search_history<cr>", desc = "Search history" },
	{ "/x", "<cmd> nohlsearch <cr>", desc = "Clear highlihgt" },
	{ "/r", ":%s/", desc = "Replace" },
	{ "/r", ":s/", desc = "Replace", mode = { "v", "x" } },
	-- flash 
	{ "/j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump" },
	{ "/t", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Treesitter" },
	{ "/J", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	{ "/T", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	{ "/l", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, label = { after = { 0, 0 } }, pattern = "^" }) end, desc = "Line", mode = { "n", "x", "o" } },
	{ "/c", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, desc = "Cursor", mode = { "n", "x", "o" } },
	{ "/w", function() require("flash").jump({ search = { mode = function(pattern) return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern) end, }, jump = { pos = "range" }, }) end, desc = "Word", mode = { "n", "x", "o" } },
})

--==================================================--==================================================--
--                                        non sequential keymaps                                        --
--==================================================--==================================================--

--==================================================--
--                      cursor                      --
--==================================================--
map("n", "<c-h>", function() require("smart-splits").move_cursor_left() end, opts)
map("n", "<c-j>", function() require("smart-splits").move_cursor_down() end, opts)
map("n", "<c-k>", function() require("smart-splits").move_cursor_up() end, opts)
map("n", "<c-l>", function() require("smart-splits").move_cursor_right() end, opts)
map("n", "<c-p>", function() require("smart-splits").move_cursor_previous() end, opts)
--==================================================--
--                       copy                       --
--==================================================--
map({"v", "x"}, "<c-y>", '"+ygv <esc>h')
map("n", "<c-y>", '"+y')
map({"v", "x"}, "y", "ygv <esc>h" )
--==================================================--
--                   native fFtT                    --
--==================================================--
map({"n", "x", "o"}, "f", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = true }}) end, opts)
map({"n", "x", "o"}, "F", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = true }}) end, opts)
map({"n", "x", "o"}, "t", function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = true }, jump = { offset = -1 }}) end, opts)
map({"n", "x", "o"}, "T", function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = true }, jump = { offset = 1 }}) end, opts)
map("c", "<c-s>", function() require("flash").toggle() end, opts)
--==================================================--
--                       tab                       --
--==================================================--
map("n", "<a-j>", "<cmd>tabnext<cr>")
map("n", "<a-k>", "<cmd>tabprevious<cr>")
--==================================================--
--                      buffer                       --
--==================================================--
-- map("n", "<a-h>", "<cmd>bprevious<cr>")
-- map("n", "<a-l>", "<cmd>bnext<cr>")
map("n", "<a-h>", "<cmd>BufferLineCyclePrev<cr>")
map("n", "<a-l>", "<cmd>BufferLineCycleNext<cr>")
--==================================================--
--             incremental/decremenal               --
--==================================================--
map("n", "+", "<c-a>", opts)
map("n", "-", "<c-x>", opts)
--==================================================--
--                   indentation                    --
--==================================================--
map({ "v", "x" }, "<", "<gv", opts)
map({ "v", "x" }, ">", ">gv", opts)
--==================================================--
--                  page movement                   --
--==================================================--
-- map("n", "n", "nzzzv", opts)
-- map("n", "N", "Nzzzv", opts)
-- map("n", "<c-u>", "<c-u>zz0", opts)
-- map("n", "<c-d>", "<c-d>zz0", opts)
-- map("n", "<c-f>", "<c-f>zz0", opts)
-- map("n", "<c-b>", "<c-b>zz0", opts)
--==================================================--
--                 cursor movement                  --
--==================================================--
map( "i", "<c-h>", "<left>", opts )
map( "i", "<c-l>", "<right>", opts )
-- map( "i", "<c-k>", "<up>", opts )
map( "i", "<c-j>", "<down>", opts )
map( "i", "<c-s-k>", "<esc>O", opts )
map( "i", "<c-s-j>", "<esc>o", opts )
--==================================================--
--                     terminal                     --
--==================================================--
map( "t", "<esc>", "<c-\\><c-n>" )
--==================================================--
--                      command                     --
--==================================================--
map( "c", "<c-h>", "<cmd>Telescope command_history<cr>", opts )
--==================================================--
--                       fix                        --
--==================================================--
map("n", "q", function () keymap_func.handle_q_colon_key() end, opts)
map({ "v", "x" }, "p", '"_dP', opts)
map( "n", "x", '"_x', opts )
map( "n", "j", "gj", opts )
map( "n", "k", "gk", opts )
--==================================================--
--                     moveline                     --
--==================================================--
-- map("n", "", ":m .+1<cr>==", opts)
-- map("n", "", ":m .-2<cr>==", opts)
map({ "v", "x" }, "<a-k>", ":m '<-2<cr>gv=gv", opts )
map({ "v", "x" }, "<a-j>", ":m '>+1<cr>gv=gv", opts )
map({ "v", "x" }, "<a-h>", "<gv", opts )
map({ "v", "x" }, "<a-l>", ">gv", opts )
--==================================================--
--                      remove                      --
--==================================================--
map({ "n", "v" }, "gcc", "<Nop>" )
