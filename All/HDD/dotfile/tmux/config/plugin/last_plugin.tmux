set -g @plugin "tmux-plugins/tmux-resurrect"        	# enables tmux session after computer restart
set -g @plugin "tmux-plugins/tmux-continuum"        	# automatically saves sessions
set -g @resurrect-dir "~/.local/share/tmux/resurrect" 	# current session saving directory
set -g @resurrect-capture-pane-contents "on"
set -g @resurrect-save "S"                            	# save session with S-s
set -g @resurrect-restore "R"                         	# restore session with S-r
set -g @continuum-save-interval "5"                   	# save session every 5 minutes
