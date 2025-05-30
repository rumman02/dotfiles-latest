# session
bind-key -T prefix s switch-client -T session							# session

# session open (s-o)
bind-key -T session o switch-client -T session_open						# session open
bind-key -rT session_open h new-session -d 								# open new session
bind-key -rT session_open j new-session -d 								# open new session
bind-key -rT session_open k new-session -d 								# open new session
bind-key -rT session_open l new-session -d 								# open new session
bind-key -T session_open n switch-client -T session_open_name			# session open with name
bind-key -rT session_open_name l command-prompt -p "Session name:" "new-session -d; rename-session '%%'" 	# open new session with name
bind-key -rT session_open_name j command-prompt -p "Session name:" "new-session -d; rename-session '%%'" 	# open new session with name
bind-key -rT session_open_name h command-prompt -p "Session name:" "new-session -d; rename-session '%%'" 	# open new session with name
bind-key -rT session_open_name k command-prompt -p "Session name:" "new-session -d; rename-session '%%'" 	# open new session with name

# session close (s-c)
bind-key -T session c switch-client -T session_close					# session close
bind-key -rT session_close c kill-session								# session close current
bind-key -rT session_close o kill-session -a							# session close others
bind-key -rT session_close a kill-server								# session close all

# session switch previous & next (s-h/j/k/l)
bind-key -rT session h switch-client -p									# previous session
bind-key -rT session j switch-client -n									# next session
bind-key -rT session k switch-client -p									# previous session
bind-key -rT session l switch-client -n									# next session

# session lists (s-t)
bind-key -T session t choose-tree -s									# open session list

# session rename (s-n)
bind-key -T session n command-prompt -p "Session name:" "rename-session '%%'"	# rename current session

