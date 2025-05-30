# Check if the TPM directory exists
# if-shell "[ -d ~/.config/tmux/plugins/tmux ]" \
#   "run-shell ' \
#     rm -rf ~/.config/tmux/plugins/tmux/ 
#     git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && \
#     sleep 2 && \
#     tmux source-file ~/.config/tmux/tmux.conf \
#   '" \

set -g @plugin 'catppuccin/tmux#v1.0.3'
set -g @catppuccin_flavor 'mocha' # latte, frappe, macchiato or mocha
set -g @catppuccin_window_status_style "rounded"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W "

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W "

set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_directory_text "#{pane_current_path}"

# Run catppuccin plugin manually or through tpm
# ...

set -g status-left ""
set -g  status-right "#{E:@catppuccin_status_directory}"
set -ag status-right "#{E:@catppuccin_status_user}"
set -ag status-right "#{E:@catppuccin_status_host}"
set -ag status-right "#{E:@catppuccin_status_session}"
