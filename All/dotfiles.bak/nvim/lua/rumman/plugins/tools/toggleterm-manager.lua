local toggleterm_manager = require("toggleterm-manager")
local actions = toggleterm_manager.actions
local icons = require("rumman.lib.icons")
local telescope_local_leader = require("rumman.lib.keys").telescope.leaders.locals

toggleterm_manager.setup {
  mappings = { -- key mappings bound inside the telescope window
    i = {
      ["<CR>"] = { action = actions.toggle_term, exit_on_action = false }, -- toggles terminal open/closed
      ["<c-c>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
      ["<c-x>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
      ["<c-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
      ["<c-n>"] = { action = actions.create_and_name_term, exit_on_action = false }, -- provides a prompt to rename a terminal
    },
    n = {
      ["<CR>"] = { action = actions.toggle_term, exit_on_action = false }, -- toggles terminal open/closed
      ["l"] = { action = actions.create_term, exit_on_action = true, direction = "vertical",  }, -- creates a new terminal buffer
      ["j"] = { action = actions.create_term, exit_on_action = true, direction = "horizontal",  }, -- creates a new terminal buffer
      ["f"] = { action = actions.create_term, direction = "float", exit_on_action = true   }, -- creates a new terminal buffer
      ["x"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
      ["r"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
      ["n"] = { action = actions.create_and_name_term, exit_on_action = false }, -- provides a prompt to rename a terminal
    },
  },
  titles = {
    preview = "Preview", -- title of the preview buffer in telescope
    prompt = "Pick Term", -- title of the prompt buffer in telescope
    results = "Terminals", -- title of the results buffer in telescope
  },
  results = {
    fields = { -- fields that will appear in the results of the telescope window
      "term_icon", -- a terminal icon
      "term_name", -- toggleterm's display_name if it exists, else the terminal's id assigned by toggleterm
      "space", -- adds space between fields, if desired
      "state", -- the state of the terminal buffer: h = hidden, a = active
    },
    separator = " ", -- the character that will be used to separate each field provided in results.fields  
    term_icon = icons.ui.Terminal, -- the icon that will be used for term_icon in results.fields
  },
  search = {
    field = "term_name" -- the field that telescope fuzzy search will use when typing in the prompt
  },
  sort = {
    field = "term_name", -- the field that will be used for sorting in the telesocpe results
		ascending = true, -- whether or not the field provided above will be sorted in ascending or descending order
  },
}

