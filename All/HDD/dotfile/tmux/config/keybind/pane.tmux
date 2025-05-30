# pane (p)
bind-key -T prefix p switch-client -T pane								# pane

# pane open (p-o)
bind-key -T pane o switch-client -T pane_open							# pane - open
bind-key -rT pane_open h split-window -h -b -c "#{pane_current_path}" \; send-keys 'clear' C-m	# split pane left
bind-key -rT pane_open j split-window -v -c "#{pane_current_path}" \; send-keys 'clear' C-m     # split pane down
bind-key -rT pane_open k split-window -v -b -c "#{pane_current_path}" \; send-keys 'clear' C-m  # split pane up
bind-key -rT pane_open l split-window -h -c "#{pane_current_path}" \; send-keys 'clear' C-m     # split pane right

# pane close (p-c)
bind-key -T pane c switch-client -T pane_close							# pane - close
bind-key -rT pane_close h select-pane -L \; kill-pane					# close pane left
bind-key -rT pane_close j select-pane -D \; kill-pane					# close pane down
bind-key -rT pane_close k select-pane -U \; kill-pane					# close pane up
bind-key -rT pane_close l select-pane -R \; kill-pane					# close pane right
bind-key -rT pane_close c kill-pane										# close pane current
bind-key -T pane_close o kill-pane -a									# close pane others

# pane resize (p-r)
bind-key -T pane r switch-client -T pane_resize							# pane - resize
bind-key -rT pane_resize h resize-pane -L 2								# decrease vertical pane size
bind-key -rT pane_resize j resize-pane -D 2								# drecrease horizontal pane size
bind-key -rT pane_resize k resize-pane -U 2								# increase horizontal pane size
bind-key -rT pane_resize l resize-pane -R 2								# increasse vertical pane size

# pane swap (p-s)
bind-key -T pane s switch-client -T pane_swap							# pane - swap
bind-key -rT pane_swap h swap-pane -s "{left-of}"						# swap pane to left
bind-key -rT pane_swap j swap-pane -s "{down-of}"						# swap pane to down
bind-key -rT pane_swap k swap-pane -s "{up-of}"							# swap pane to up
bind-key -rT pane_swap l swap-pane -s "{right-of}"						# swap pane to right
bind-key -rT pane_swap r rotate-window									# swap pane as rotate

# pane break pane as window (p-w)
bind-key -T pane w switch-client -T pane_window							# pane - swap
bind-key -T pane_window h break-pane -b -d			 					# open as window left
bind-key -T pane_window l break-pane -a -d			 					# open as window right
bind-key -rT pane_window H move-pane -t:-1 -h -d
bind-key -rT pane_window L move-pane -t:+1 -h -d
bind-key -rT pane_window i command-prompt -p "Move to window:" "move-pane -t '%%' -h -d"

# pane tree (p-t)
bind-key -T pane t choose-tree

# pane index (p-i)
bind-key -T pane i display-panes
# make a keybinds here for pane switch to 1-9

# pane layout (p-l)
bind-key -rT pane l next-layout

# pane maximize (p-m)
bind-key -rT pane_resize m resize-pane -Z								# maximize pane size
