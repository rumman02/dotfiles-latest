local M = {};

M.opts = function()
end;

M.config = function()
	local alphabets = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
	local numbers = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
	local symbols = { "~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "+", "+", "[", "{", "]", "}", "\\", "|", ";", ":", "'", '"', ",", "<", ".", ">", "/", "?", "%", "^", "&", "*", "(", ")", "-", "_", "+" };

  local requires = require("lib.functions").requires;

	local alpha = requires("alpha");
	local dashboard = requires("alpha.themes.dashboard");
	local lazy = requires("lazy");
	local version = vim.version();

	local nvim_version = " " .. version.major .. "." .. version.minor .. "." .. version.patch;

	-- header
	-- set header top space
	dashboard.opts.layout[1].val = 10;

	-- set header logo
	dashboard.section.header.val = {
		"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
		"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
		"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
		"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
		"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
		"                                          " .. nvim_version,
	};

	-- set header below space
	dashboard.opts.layout[3].val = 2;

	-- buttons
	-- Set menu with buttons
	local function new_button(...)
		local button = dashboard.button(...);
		button.opts.hl = { { "Special", 0, 6 } };
		return button;
	end

	dashboard.section.buttons.val = {
		new_button("e", " " .. "󰙅  Open explorer", "<cmd>Neotree<cr>"),
		new_button("f", " " .. "󰱽  Find files", "<cmd>Telescope find_files<cr>"),
		new_button("w", " " .. "󱎸  Find words", "<cmd>Telescope live_grep<cr>"),
		new_button("r", " " .. "󱈅  Find recents", "<cmd>Telescope oldfiles<cr>"),
		new_button("S", " " .. "󱙈  Find sessions", "<cmd>Telescope session-lens<cr>"),
		new_button("s", " " .. "  Restore last session", "<cmd>SessionRestore<cr>"),
		new_button("p", " " .. "  Plugin manager", "<cmd>Lazy<cr>"),
		new_button("m", " " .. "  Server manager", "<cmd>Mason<cr>"),
		new_button(
			"c",
			" " .. "  Configs",
			"<cmd>e$MYVIMRC<Bar>lua require('neo-tree.command').execute({dir = vim.fn.stdpath('config')})<cr>"
		),
		new_button("n", " " .. "  New file", "<cmd>ene<Bar>startinsert<cr>"),
		new_button("'", " " .. "  Go marks (Line) ", function()
			local char = vim.fn.input("Mark: ");
			if char ~= "" then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("'" .. char, true, false, true), "n", false);
			else
				vim.notify("No char inserted");
			end;
		end),
		new_button("x", " " .. "  Close", "<cmd>quit<cr>"),
	};

	-- set button below space
	table.insert(dashboard.config.layout, 5, { type = "padding", val = 2 });

	-- footer
	-- footer set with date, time, lazy plugins count and loaded ms
	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = lazy.stats();
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100);

			local datetime = os.date("  %d-%m-%Y    %I:%M:%S %p");
			local plugins_count = #vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/*", false, 1);
			local plugin_loaded = "󰄴  " .. plugins_count .. " plugins in " .. ms .. " ms";

			dashboard.section.footer.val = {
				string.format("%s  %s", datetime, plugin_loaded),
			}
			-- dashboard.section.footer.opts.hl = "@alpha.footer" -- foother highlight
			pcall(vim.cmd.AlphaRedraw);
		end,
	})

	-- others
	-- disable folding on alpha buffer
	vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]]);

	-- set whole dashboard to alpha
	alpha.setup(dashboard.opts);

	-- disable other keys in only alpha
	-- Define the keys to exclude from <Nop>
	local exclude_keys = { "j", "k", ":" };

	-- Helper function to check if a key is in the exclude list
	local function is_excluded(key)
		for _, excluded_key in ipairs(exclude_keys) do
			if key == excluded_key then
				return true;
			end;
		end;
		return false;
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "alpha",
		callback = function(e)
			-- get the buffer number for alpha

			-- disable these keys in alpha buffer only
			local keys = {};
			for _, key in ipairs(alphabets) do
				table.insert(keys, key);
			end;
			for _, key in ipairs(symbols) do
				table.insert(keys, key);
			end;
			for _, key in ipairs(numbers) do
				table.insert(keys, key);
			end;

			for _, key in ipairs(keys) do
				if not is_excluded(key) then
					vim.keymap.set("n", key, "<Nop>", {
						buffer = e.buf,
						noremap = true,
						silent = true,
					})
				end
			end;
		end,
	});

	--[[ fix: after install any plugins, the alpha dashboard will show after quit
	lazy ui]]
	if vim.o.filetype == "lazy" then
		vim.cmd.close();
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				lazy.show();
			end,
		})
	end;
end;

return M;
