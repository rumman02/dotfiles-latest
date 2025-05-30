local function requires(packages)
	require("rumman." .. packages)
end

requires("config.options")
requires("config.autocmds")
requires("lib.keys")
requires("config.lazy")
requires("config.keymaps")
requires("after.config.others")

-- sd af sdal fjs dal flsd ajflsad flsa djfl sadfl jsaldjflsdjafl s dafljs dlafj sdkj fksdf ajsfd-sdfk jsdkf sdkjf skdajfksadjf sdjflsa jfljs alfjslajf lsajf lsafjlsajdflsa jflsjdfls jdalfjsldafj lsadfjlsdj flasdjflsadjf lsadfj sadf

-- vim.keymap.set("n", "<leader>m", "lua function() print('Hello') end", { desc = "Hello", buffer = true })

-- vim.keymap.set('n', '<Tab>', function()
-- 	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
-- end, { expr = true })

-- vim.api.nvim_create_autocmd("filetype", {
-- 	pattern = "TelescopePrompt",
-- 	callback = function ()
-- 		vim.keymap.set("n", "<leader>m", "lua function() print('Hello') end", { desc = "Hello", buffer = true })
-- 	end
-- })
--

-- local lsp = {
-- 	name = "LSP",
-- }
--
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function ()
-- 		vim.keymap.set("n", "<leader>m", "", { desc = lsp.name, buffer = true })
-- 		vim.keymap.set("n", "<leader>mi", "lua function() print('Hello') end", { desc = "Hello", buffer = true })
-- 	end
-- })

-- local function exit_mode()
--   -- Clear the keymaps for the "mode"
--   vim.keymap.del('n', 'j')
--   vim.keymap.del('n', 'k')
--   vim.keymap.del('n', 'h')
--   vim.keymap.del('n', 'l')
--   vim.keymap.del('n', 'q')
--
--   print("Exited custom mode.")
-- end
--
-- local function enter_mode()
--   local keymap_opts = { noremap = true, silent = true }
--
--   -- Define the keymaps for the "mode"
--   vim.keymap.set('n', 'j', '5j', keymap_opts) -- Move 5 lines down
--   vim.keymap.set('n', 'k', '5k', keymap_opts) -- Move 5 lines up
--   vim.keymap.set('n', 'h', '2h', keymap_opts) -- Move 2 characters left
--   vim.keymap.set('n', 'l', '2l', keymap_opts) -- Move 2 characters right
--
--   -- Exit the mode with a specific key (e.g., 'q')
--   vim.keymap.set('n', 'q', function()
--     exit_mode()
--   end, keymap_opts)
--
--   print("Entered custom mode. Press 'q' to exit.")
-- end
--
--
-- -- Bind a key to activate the "mode"
-- vim.keymap.set('n', '<leader>m', function()
--   enter_mode()
-- end, { noremap = true, silent = true })




-- -- local function exit_mode()
-- --   -- Clear the keymaps for window resizing
-- --   vim.keymap.del('n', 'j')
-- --   vim.keymap.del('n', 'k')
-- --   vim.keymap.del('n', 'h')
-- --   vim.keymap.del('n', 'l')
-- --   vim.keymap.del('n', 'q')
-- --
-- --   print("Exited window resize mode.")
-- -- end
-- --
-- -- local function enter_mode()
-- --   local keymap_opts = { noremap = true, silent = true }
-- --
-- --   -- Define the keymaps for window resizing
-- -- 	--
-- -- 	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(i+1) .. "<cmd>exe v:count1 . 'ToggleTerm direction=" .. toggleterm_direction .. "'<cr><c-w>=", true, false, false), "n", false)
-- --   vim.keymap.set('n', 'j', ':resize -2<CR>', keymap_opts) -- Decrease height
-- --   vim.keymap.set('n', 'k', ':resize +2<CR><bar><cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>w", true, false, true), "n", false)<cr>', keymap_opts) -- Increase height
-- --   vim.keymap.set('n', 'h', ':vertical resize -2<CR>', keymap_opts) -- Decrease width
-- --   vim.keymap.set('n', 'l', ':vertical resize +2<CR>', keymap_opts) -- Increase width
-- --
-- --   -- Exit the mode with a specific key (e.g., 'q')
-- --   vim.keymap.set('n', 'q', function()
-- --     exit_mode()
-- --   end, keymap_opts)
-- --
-- --   print("Entered window resize mode. Press 'q' to exit.")
-- -- end
-- --
-- -- -- Bind a key to activate the "mode"
-- -- vim.keymap.set('n', '<leader>w', function()
-- --   enter_mode()
-- -- end, { noremap = true, silent = true })
-- --
-- local function exit_mode()
--   -- Clear the keymaps for window resizing
--   vim.keymap.del('n', 'j')
--   vim.keymap.del('n', 'k')
--   vim.keymap.del('n', 'h')
--   vim.keymap.del('n', 'l')
--   vim.keymap.del('n', 'q')
--
--   print("Exited window resize mode.")
-- end
--
-- local which_key = require("which-key")
-- local count = 0
--
-- local function enter_mode()
--   local keymap_opts = { noremap = true, silent = true }
--
--   -- Define the keymaps for window resizing
--   vim.keymap.set('n', 'j', ':resize -2<CR>', keymap_opts) -- Decrease height
--   vim.keymap.set('n', 'k', ':resize +2<CR>', keymap_opts) -- Increase height
--   vim.keymap.set('n', 'h', ':vertical resize -2<CR>', keymap_opts) -- Decrease width
--   vim.keymap.set('n', 'l', ':vertical resize +2<CR>', keymap_opts) -- Increase width
--
-- 	print(count + 1)
--   -- Show which-key popup
--   which_key.show({ keys = "<leader>", loop = true })
--
--   -- Exit the mode with a specific key (e.g., 'q')
--   vim.keymap.set('n', 'q', function()
--     exit_mode()
--   end, keymap_opts)
--
--   print("Entered window resize mode. Press 'q' to exit.")
-- end
--
-- -- Bind a key to activate the "mode"
-- vim.keymap.set('n', '<leader>w', function()
--   enter_mode()
-- end, { noremap = true, silent = true })
--
--


-- vim.keymap.set({ 'n' }, '<leader>y', "lua print('hello')", { desc = "Git" })
-- vim.keymap.del({ 'n' }, '<leader>y', { desc = "Git" })

-- vim.keymap.set("n", "<leader>y", function ()
	-- print(vim.api.nvim_get_current_buf())
	-- print(vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_get_current_buf() }))
-- end, { desc = "Print buf" })

-- for index, value in pairs(add) do
-- 	vim.notify(index, value)
-- end
--
-- local map = vim.keymap.set
-- local opts = { noremap = true }
-- map(
-- 	"t",
-- 	"<leader>wd",
-- 	"<C-\\><C-n>"
-- 		.. ":lua require('bufresize').block_register()<cr>"
-- 		.. "<C-w>c"
-- 		.. ":lua require('bufresize').resize_close()<cr>",
-- 	opts
-- )
-- map(
-- 	"n",
-- 	"<leader>wd",
-- 	":lua require('bufresize').block_register()<cr>" .. "<C-w>c" .. ":lua require('bufresize').resize_close()<cr>",
-- 	opts
-- )
--
-- vim.keymap.set("n", "<leader>y", function ()
--
-- 	-- Function to get the foreground and background color of a highlight group
-- 	local function get_hl_colors(group)
-- 		-- Get highlight group properties (returns a table with fg, bg, etc.)
-- 		local hl = vim.api.nvim_get_hl_by_name(group, true)
-- 		--   local hl = vim.api.nvim_get_hl(0, { name = group })
--
-- 		-- You can access fg and bg colors from the table
-- 		local fg_color = hl.foreground
-- 		local bg_color = hl.background
--
-- 		return fg_color, bg_color
-- 	end
--
-- 	-- Example usage
-- 	local fg, bg = get_hl_colors("luaTodo")
--
-- 	-- Print the values (in decimal RGB format, or nil if not set)
-- 	print("Foreground: " .. (fg or "none"))
-- 	print("Background: " .. (bg or "none"))
--
--
-- 	-- for key, value in pairs(vim.api.nvim_get_hl(0, { name="luaTodo" })) do
-- 	-- 	print(key, value)
-- 	-- end
-- end, { desc = "Hello" })







-- local func = require("rumman.lib.func")
-- local map = func.map



-- local function snacks_toggle_terminal_open(direction_key)
-- 	local split_ratio = 3;
-- 	local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
-- 	local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)
-- 	count = count + 1
--
-- 	if direction_key == "h" then
-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.open(nil, { win = { position = \"left\", width = " .. w_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
-- 	elseif direction_key == "j" then
-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.open(nil, { win = { position = \"bottom\", height = " .. h_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
-- 	elseif direction_key == "k" then
-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.open(nil, { win = { position = \"top\", height = " .. h_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
-- 	elseif direction_key == "l" then
-- 		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(tostring(count) .. "<cmd>exe v:count1 . 'lua Snacks.terminal.open(nil, { win = { position = \"right\", width = " .. w_split_size .. " } })'<cr><esc>", true, false, true), "n", false)
-- 	end
-- end


-- map(0, { "n" }, "<leader>toh", function() snacks_toggle_terminal_open("h") end, { desc = "Left" }, "<leader>to"  , false)
-- map(0, { "n" }, "<leader>toj", function() snacks_toggle_terminal_open("j") end, { desc = "Bottom" }, "<leader>to", false)
-- map(0, { "n" }, "<leader>tok", function() snacks_toggle_terminal_open("k") end, { desc = "Top" }   , "<leader>to", false)
-- map(0, { "n" }, "<leader>tol", function() snacks_toggle_terminal_open("l") end, { desc = "Right" } , "<leader>to", false)
--


-- vim.keymap.set({ "n" }, "<leader>y", function()
-- 	for key, value in pairs(Snacks.terminal.get().events[3]) do
-- 		print(key, value)
-- 	end
-- end, { desc = "Right" })

-- vim.api.nvim_create_autocmd("Filetype", {
-- 	pattern = "snacks_dashboard",
-- 	callback = function()
-- 		vim.notify("yes")
-- 	end
-- })

-- vim.api.nvim_create_autocmd("CmdlineEnter", {
-- 	-- pattern = "",
-- 	callback = function()
-- 		-- require("lualine").hide()
--     require('lualine').refresh()
-- 	end
-- })
-- vim.api.nvim_create_autocmd("Filetype", {
-- 	pattern = "snacks_dashboard",
-- 	callback = function()
-- 		-- vim.cmd("set showtabline=0")
-- 		-- require("lualine").hide({ unhide = true })
-- 	end
-- })
--
-- --     require('lualine').hide()
-- -- <
-- --
-- --
-- -- To enable it again you can do
-- --
-- -- >
-- --     require('lualine').hide({unhide=true})
-- --

vim.keymap.set("n", "<leader>v", function ()
		local fileicon = require("nvim-web-devicons").get_icon("", vim.bo.filetype) or "h"
		vim.notify(vim.bo.filetype)
end, { desc = "Hello" })

