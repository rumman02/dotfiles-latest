local map = require("lib.func").map

local toggle_leader = "<tab>";
local toggleterm_leader = "<leader>t";

-------------------------------------------------------------------------------
-- snacks
-------------------------------------------------------------------------------
-- NOTE: Snacks will starts when vim starts.
-- so that, Snacks funciton call or keymaps can be place at anywhere safely

-- options keymaps
map(2, { "n" }, toggle_leader .. "c", "", { desc = "Cursor" })
Snacks.toggle.option("cursorline", { name = "[L]ine highlight" }):map(toggle_leader .. "cl");
Snacks.toggle.option("cursorcolumn", { name = "[C]olumn highlight" }):map(toggle_leader .. "cc");
Snacks.toggle.option("scrolloff", { off = vim.o.scrolloff > 0 and vim.o.scrolloff or 0, on = 999, name = "Middle row" }):map(toggle_leader .. "cx");
Snacks.toggle.option("sidescrolloff", { off = vim.o.sidescrolloff > 0 and vim.o.sidescrolloff or 0, on = 999, name = "Middle column" }):map(toggle_leader .. "cy");
Snacks.toggle.option("background", { off = "light", on = "dark", name = "[D]ark mode" }):map(toggle_leader .. " ");
Snacks.toggle.option("spell", { name = "S[p]elling" }):map(toggle_leader .. "p");

map(2, { "n" }, toggle_leader .. "l", "", { desc = "Line" })
Snacks.toggle.option("number", { name = "Number" }):map(toggle_leader .. "ln");
Snacks.toggle.option("relativenumber", { name = "[R]elative number" }):map(toggle_leader .. "lr");
Snacks.toggle.option("wrap", { name = "[W]rap" }):map(toggle_leader .. "lw");

-- snacks own plugins keymaps
map(2, { "n" }, toggle_leader .. "a", "", { desc = "Animate" })
Snacks.toggle.scroll():map(toggle_leader .. "as");
Snacks.toggle.animate():map(toggle_leader .. "aa");

map(2, { "n" }, toggle_leader .. "z", "", { desc = "Zen mode" })
Snacks.toggle.dim():map(toggle_leader .. "zd");
Snacks.toggle.zen():map(toggle_leader .. "zz");
Snacks.toggle.zoom():map(toggle_leader .. "zZ");

Snacks.toggle.treesitter():map(toggle_leader .. "t");
Snacks.toggle.words():map(toggle_leader .. "w");
Snacks.toggle.indent():map(toggle_leader .. "i");
if vim.lsp.inlay_hint then Snacks.toggle.inlay_hints():map(toggle_leader .. "h"); end;
Snacks.toggle.diagnostics():map(toggle_leader .. "d");
Snacks.toggle.profiler():map(toggle_leader .. "p");
Snacks.toggle.profiler_highlights():map(toggle_leader .. "P");

-- snacks scratch
map(2, { "n" }, toggle_leader .. "s", "", { desc = "Scratch" })
map(0, { "n" }, toggle_leader .. "ss", function() Snacks.scratch() end, { desc = "Press 0-9 & Toggle" })
map(0, { "n" }, toggle_leader .. "sl", function() Snacks.scratch.list() end, { desc = "List" })
map(0, { "n" }, toggle_leader .. "se", function() Snacks.scratch.select() end, { desc = "Select" })

-- snacks terminal
map(2, { "n" }, toggle_leader .. "t", "", { desc = "Terminal" })
map(0, { "n" }, toggle_leader .. "tt", function() Snacks.terminal.toggle() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle" })
map(0, { "n" }, toggle_leader .. "th", function() Snacks.terminal.toggle(nil, { win = { position = "left" }}) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle left" })
map(0, { "n" }, toggle_leader .. "tj", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" }}) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle down" })
map(0, { "n" }, toggle_leader .. "tk", function() Snacks.terminal.toggle(nil, { win = { position = "top" }}) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle up" })
map(0, { "n" }, toggle_leader .. "tl", function() Snacks.terminal.toggle(nil, { win = { position = "right" }}) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle right" })
map(0, { "n" }, toggle_leader .. "tf", function() Snacks.terminal.toggle(nil, { win = { position = "float", enter = true, title = " Terminal " .. tostring(vim.v.count1) .. " " }}) vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", false) end, { desc = "Press 0-9 & Toggle float" })

-- snacks notifier
map(0, { "n" }, toggle_leader .. "n", function() Snacks.notifier.hide() end, { desc = "Dismiss all" })
map(0, { "n" }, toggle_leader .. "N", function() Snacks.notifier.show_history() end, { desc = "Notification history" })
