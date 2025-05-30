# window
bind-key -T prefix w switch-client -T window							# window

# window (w-o)
bind-key -T window o switch-client -T window_open						# window open
bind-key -rT window_open h new-window -b -d								# Open left
bind-key -rT window_open l new-window -a -d								# Open right
bind-key -T window_open n switch-client -T window_open_name				# window open name
bind-key -rT window_open_name h command-prompt -p "Window name:" "new-window -b; rename-window '%%'; next-window"		# open left with name
bind-key -rT window_open_name l command-prompt -p "Window name:" "new-window -a; rename-window '%%'; previous-window"	# open right with name

# window (w-c)
bind-key -T window c switch-client -T window_close						# window close
bind-key -rT window_close h previous-window \; kill-window				# close left
bind-key -rT window_close l next-window \; kill-window					# close right
bind-key -rT window_close c kill-window									# close current
bind-key -rT window_close o kill-window -a								# close others

# window switch (w-h/l/0-9)
bind-key -rT window 1 select-window -t 1								# go window 1
bind-key -rT window 2 select-window -t 2								# go window 2
bind-key -rT window 3 select-window -t 3								# go window 3
bind-key -rT window 4 select-window -t 4								# go window 4
bind-key -rT window 5 select-window -t 5								# go window 5
bind-key -rT window 6 select-window -t 6								# go window 6
bind-key -rT window 7 select-window -t 7								# go window 7
bind-key -rT window 8 select-window -t 8								# go window 8
bind-key -rT window 9 select-window -t 9								# go window 9
bind-key -rT window 0 select-window -t 10								# go window 10
bind-key -rT window i command-prompt -p "Window index:" "select-window -t '%%'"	# command prompt to go window index
bind-key -rT window h previous-window									# go window previous
bind-key -rT window l next-window										# go window next

# window swap (p-s)
bind-key -T window s switch-client -T window_swap						# window swap
bind-key -rT window_swap h swap-window -d -t:-1							# swap with previous
bind-key -rT window_swap l swap-window -d -t:+1							# swap with next

# window list (w-t)
bind-key -T window t choose-tree -w

# window rename (w-n)
bind-key -T window n command-prompt -p "Window name:" "rename-window '%%'"
