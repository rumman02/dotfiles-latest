set -g default-terminal "tmux-256color"
# set -as terminal-features ",xterm-256color:RGB"
set -sg terminal-overrides ",*:RGB"
set -g pane-border-lines single							# pane separation border line
set -g pane-border-indicators off						# pane separation border style
set -g base-index 1                                 	# window starting index
set -g pane-base-index 1								# pane starting index
set -g history-limit 50000								# maximum number of line held in window history
set -s escape-time 0									# reduce delay after pressing tmux prefix
set -g repeat-time 5000									# allow press multiple commands without press again prefix
set -g renumber-windows on								# renumber widnows for maintains order after close window
set -g mouse on                                       	# enable mouse access
set -g display-time 5000								# display tmux any message in milliseconds
set -g status-interval 1								# updates status-line every in seconds
set -g status-justify left								# set window number and name to center of status-line
set -g status-position top								# status-line position
set -g automatic-rename on								# automatic widnow name based on workflow
set -g display-panes-time 5000							# showing status message time in milliseconds
set -g mode-keys vi           							# enable copy mode similer like vim
set -g allow-passthrough on 							# nvim plugin config - folke/zen-mode
set -g status-style bg=default							# set status bar transparent
