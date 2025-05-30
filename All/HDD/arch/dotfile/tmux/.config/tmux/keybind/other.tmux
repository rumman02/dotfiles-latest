bind-key h set-option status											# toggle status bar
bind-key d detach-client												# detach tmux
bind-key : command-prompt												# command prompt
bind-key r source-file "$HOME/.config/tmux/tmux.conf" \; \
	display-message "Config file sourced"
bind-key z suspend-client												# suspend current client
bind-key i setw synchronize-panes\; display-message "Synchronize panes #{?pane_synchronized,on,off}" # syncronize all panes
