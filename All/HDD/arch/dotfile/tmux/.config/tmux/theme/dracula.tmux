set -g @plugin "dracula/tmux"							# dracula theme
set -g @dracula-show-powerline true
set -g @dracula-show-left-sep 
set -g @dracula-show-right-sep 
set -g @dracula-refresh-rate 1
set -g @dracula-show-flags false            			# show '*' beside the window number
set -g @dracula-border-contrast true
set -g @dracula-show-empty-plugins false    			# not showing empty space of empty plugins
set -g @dracula-show-left-icon ""          			# "hostname" (full hostname), "session", "shortname" (short name), "smiley", "window", or any character.
set -g @dracula-left-icon-padding 1         			# 1 enable, 0 disable
set -g @dracula-plugins "git cpu-usage ram-usage time"  # battery, cpu-usage, git, gpu-usage, ram-usage, tmux-ram-usage, network, network-bandwidth, network-ping, ssh-session, attached-clients, network-vpn, weather, time, mpc, spotify-tui, playerctl, kubernetes-context, synchronize-panes
set -g @dracula-cpu-usage-label ""
set -g @dracula-cpu-display-load true
set -g @dracula-ram-usage-label " ‎"
set -g @dracula-network-bandwidth en0
set -g @dracula-network-bandwidth-interval 0
set -g @dracula-network-bandwidth-show-interface false
set -g @dracula-show-ssh-session-port true
set -g @dracula-synchronize-panes-label "Sync"
# color settings pattern :- 
# set -g @dracula-[plugin-name]-colors "[background] [foreground]"
# colors: white, gray, dark_gray, light_purple, dark_purple, cyan, green, orange, red, pink, yellow
set -g @dracula-cpu-usage-colors "dark_purple dark_gray"
set -g @dracula-ram-usage-colors "pink dark_gray"
set -g @dracula-git-colors "pink dark_gray"
# time settings pattern :- 
# set -g @dracula-time-format "%l:%M:%S"
# times: a, b, d, l, p, r, M, S
set -g @dracula-time-format "%a %b %d %l:%M %p"
set -g @dracula-show-timezone false
set -g @dracula-git-disable-status true
set -g @dracula-git-no-repo-message ""
