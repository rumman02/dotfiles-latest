local M = {}

M.version = "*"

M.opts = function()
  return {}
end

M.config = function ()
  local count = 0
  local function toggle_term_open(key)

    local split_ratio = 3 -- less is bigger window, higher is smaller window
    local w_split_size = math.floor(vim.api.nvim_win_get_width(0) / split_ratio)
    local h_split_size = math.floor(vim.api.nvim_win_get_height(0) / split_ratio)
    count = count + 1
    local hori_vert, split_size

 	  if key == "h" then
 		  hori_vert = "vertical"
 		  split_size = w_split_size
 	  elseif key == "k" then
 		  hori_vert = "horizontal"
 		  split_size = h_split_size
 	  elseif key == "j" then
 		  hori_vert = "horizontal"
 		  split_size = h_split_size
 	  elseif key == "l" then
 		  hori_vert = "vertical"
 		  split_size = w_split_size
 	  end

 	  local windows = vim.api.nvim_list_wins()
 	  for _, win in ipairs(windows) do
 		  local buf = vim.api.nvim_win_get_buf(win)
 		  local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
 		  if filetype == "toggleterm" then
 			  split_size = 0
 		  end
    end

 	  require("toggleterm").toggle(count, split_size, vim.loop.cwd(), hori_vert)

 	  -- vim.cmd("wincmd " .. string.upper(key))
 	  -- vim.cmd(hori_vert .. " resize " .. split_size)
  end

  map(0, { "n" }, toggleterm_leader, "", { desc = "Toggleterm/Tmux)" })
  map(0, { "n", "t" }, toggleterm_leader .. "t", "<cmd>ToggleTerm<cr>", { desc = "Toggle"  })
  map(0, { "n", "t" }, toggleterm_leader .. "l", "<cmd>lua require('toggleterm-manager').open({})<cr>", { desc = "List"  })

  -- vim.cmd("ToggleTerm size=".. split_size .. " direction=" .. toggleterm_direction)
  -- vim.cmd("wincmd " .. string.upper(key))
  -- vim.cmd(toggleterm_direction .. " resize " .. split_size)

  map(0, { "n" }, toggleterm_leader .. "o", "", { desc = "Open" })
  map(0, { "n" }, toggleterm_leader .. "oh", function() toggle_term_open("h") end, { desc = "Left" }, toggleterm_leader .. "o", false)
  map(0, { "n" }, toggleterm_leader .. "oj", function() toggle_term_open("j") end, { desc = "Down" }, toggleterm_leader .. "o", false)
  map(0, { "n" }, toggleterm_leader .. "ok", function() toggle_term_open("k") end, { desc = "Up" }, toggleterm_leader .. "o", false)
  map(0, { "n" }, toggleterm_leader .. "ol", function() toggle_term_open("l") end, { desc = "Right" }, toggleterm_leader .. "o", false)
  map(0, { "n" }, toggleterm_leader .. "of", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })

  map(0, { "n" }, toggleterm_leader .. "oc", "", { desc = "Counted" })
  map(0, { "n" }, toggleterm_leader .. "och", function() func.toggleterm_tmux("h", 1) end, { desc = "Left" })
  map(0, { "n" }, toggleterm_leader .. "ocj", function() func.toggleterm_tmux("j", 1) end, { desc = "Down" })
  map(0, { "n" }, toggleterm_leader .. "ock", function() func.toggleterm_tmux("k", 1) end, { desc = "Up" })
  map(0, { "n" }, toggleterm_leader .. "ocl", function() func.toggleterm_tmux("l", 1) end, { desc = "Right" })

  map(0, { "n" }, toggleterm_leader .. "x", "", { desc = "Close" })

  local function toggleterm_close()
 	  local result = vim.fn.system("tmux info")
 	  if vim.v.shell_error == 0 then
 		  map(0, { "n" }, toggleterm_leader .. "xh", function() func.toggleterm_tmux_close("h") end, { desc = "Left" })
 		  map(0, { "n" }, toggleterm_leader .. "xj", function() func.toggleterm_tmux_close("j") end, { desc = "Up" })
 		  map(0, { "n" }, toggleterm_leader .. "xk", function() func.toggleterm_tmux_close("k") end, { desc = "Down" })
 		  map(0, { "n" }, toggleterm_leader .. "xl", function() func.toggleterm_tmux_close("l") end, { desc = "Right" })
 	  else
 		  map(0, { "n" }, toggleterm_leader .. "xh", "<c-w>h<c-w>nc<c-w>p", { desc = "Left" })
 		  map(0, { "n" }, toggleterm_leader .. "xj", "<c-w>j<c-w>c<c-w>p", { desc = "Up" })
 		  map(0, { "n" }, toggleterm_leader .. "xk", "<c-w>k<c-w>c<c-w>p", { desc = "Down" })
 		  map(0, { "n" }, toggleterm_leader .. "xl", "<c-w>l<c-w>c<c-w>p", { desc = "Right" })
 	  end
  end
  toggleterm_close()



  -- TODO: add terminal float window
  -- map(0, { "n" }, toggleterm_leader, "", { desc = "Toggleterm/Tmux)" })
  -- map(0, { "n", "t" }, toggleterm_leader .. "t", function() func.toggle_toggleterm_tmux() end, { desc = "Toggle"  })
  --
  -- map(0, { "n" }, toggleterm_leader .. "o", "", { desc = "Open" })
  -- map(0, { "n" }, toggleterm_leader .. "oh", function() func.toggleterm_tmux("h", 0) end, { desc = "Left" })
  -- map(0, { "n" }, toggleterm_leader .. "oj", function() func.toggleterm_tmux("j", 0) end, { desc = "Down" })
  -- map(0, { "n" }, toggleterm_leader .. "ok", function() func.toggleterm_tmux("k", 0) end, { desc = "Up" })
  -- map(0, { "n" }, toggleterm_leader .. "ol", function() func.toggleterm_tmux("l", 0) end, { desc = "Right" })
  --
  -- map(0, { "n" }, toggleterm_leader .. "oc", "", { desc = "Counted" })
  -- map(0, { "n" }, toggleterm_leader .. "och", function() func.toggleterm_tmux("h", 1) end, { desc = "Left" })
  -- map(0, { "n" }, toggleterm_leader .. "ocj", function() func.toggleterm_tmux("j", 1) end, { desc = "Down" })
  -- map(0, { "n" }, toggleterm_leader .. "ock", function() func.toggleterm_tmux("k", 1) end, { desc = "Up" })
  -- map(0, { "n" }, toggleterm_leader .. "ocl", function() func.toggleterm_tmux("l", 1) end, { desc = "Right" })
  --
  -- map(0, { "n" }, toggleterm_leader .. "x", "", { desc = "Close" })
  --
  -- local function toggleterm_close()
    -- 	local result = vim.fn.system("tmux info")
    -- 	if vim.v.shell_error == 0 then
    -- 			map(0, { "n" }, toggleterm_leader .. "xh", function() func.toggleterm_tmux_close("h") end, { desc = "Left" })
    -- 			map(0, { "n" }, toggleterm_leader .. "xj", function() func.toggleterm_tmux_close("j") end, { desc = "Up" })
    -- 			map(0, { "n" }, toggleterm_leader .. "xk", function() func.toggleterm_tmux_close("k") end, { desc = "Down" })
    -- 			map(0, { "n" }, toggleterm_leader .. "xl", function() func.toggleterm_tmux_close("l") end, { desc = "Right" })
    -- 	else
    -- 			map(0, { "n" }, toggleterm_leader .. "xh", "<c-w>h<c-w>nc<c-w>p", { desc = "Left" })
    -- 			map(0, { "n" }, toggleterm_leader .. "xj", "<c-w>j<c-w>c<c-w>p", { desc = "Up" })
    -- 			map(0, { "n" }, toggleterm_leader .. "xk", "<c-w>k<c-w>c<c-w>p", { desc = "Down" })
    -- 			map(0, { "n" }, toggleterm_leader .. "xl", "<c-w>l<c-w>c<c-w>p", { desc = "Right" })
    -- 	end
    -- end
    -- toggleterm_close()
end

M.keys = function ()
	return {
	}
end

return M
