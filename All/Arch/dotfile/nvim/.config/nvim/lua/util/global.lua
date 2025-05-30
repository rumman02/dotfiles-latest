local telescope_width = 0.70
local telescope_height = 0.85
local telescope_prompt_position = "bottom"
local telescope_prompt_cutoff = 40
local telescope_preview_width = 0.40
local telescope_sorting_strategy = "ascending"
local winblend = 15
local borderchars1 = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
local borderchars2 = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

--==================================================--
--                    telescope                     --
--==================================================--
TELESCOPE_HORIZONTAL_WIDTH = telescope_width
TELESCOPE_HORIZONTAL_HEIGHT = telescope_height
TELESCOPE_HORIZONTAL_PREVIEW_WIDTH = telescope_preview_width
TELESCOPE_HORIZONTAL_PREVIEW_CUTOFF = telescope_prompt_cutoff
TELESCOPE_HORIZONTAL_PROMPT_POSITION = telescope_prompt_position
TELESCOPE_SORTING_STRATEGY = telescope_sorting_strategy

TELESCOPE_VERTICAL_WIDTH = telescope_width
TELESCOPE_VERTICAL_HEIGHT = telescope_height
TELESCOPE_VERTICAL_PREVIEW_WIDTH = telescope_preview_width
TELESCOPE_VERTICAL_PREVIEW_CUTOFF = telescope_prompt_cutoff
TELESCOPE_VERTICAL_PROMPT_POSITION = telescope_prompt_position

BORDERCHARS = borderchars1
CMP_BORDERCHARS = borderchars2

DIAGNOSTICS_SYMBOLS_HINT_ICON = " "
DIAGNOSTICS_SYMBOLS_INFO_ICON = " "
DIAGNOSTICS_SYMBOLS_WARN_ICON = " "
DIAGNOSTICS_SYMBOLS_ERROR_ICON = " "
DIAGNOSTICS_SYMBOLS_HINT_HIGHLIGHTS = "DiagnosticSignHint"
DIAGNOSTICS_SYMBOLS_INFO_HIGHLIGHTS = "DiagnosticSignInfo"
DIAGNOSTICS_SYMBOLS_WARN_HIGHLIGHTS = "DiagnosticSignWarn"
DIAGNOSTICS_SYMBOLS_ERROR_HIGHLIGHTS = "DiagnosticSignError"

GIT_SYMBOLS_ADDED_ICON = " " -- "+"
GIT_SYMBOLS_MODIFIED_ICON = "󱗝 " -- "~"
GIT_SYMBOLS_DELETED_ICON = "󱋯 " -- "-"
GIT_SYMBOLS_RENAMED_ICON = " "
GIT_SYMBOLS_UNTRACKED_ICON = " "
GIT_SYMBOLS_IGNORED_ICON = " "
GIT_SYMBOLS_UNSTAGED_ICON = " "
GIT_SYMBOLS_STAGED_ICON = " "
GIT_SYMBOLS_CONFLICT_ICON = " "

WINBLEND = winblend
