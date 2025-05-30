# enter copy_mode
bind-key y copy-mode
bind-key -T copy-mode-vi C-y send-keys -X cancel

bind-key -T copy-mode-vi v send-keys -X begin-selection  	# select terminal like vim into copy mode
bind-key -T copy-mode-vi y send-keys -X copy-selection   	# copy termianl like vim into copy mode
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle 	# select terminal like vim into copy mode
unbind -T copy-mode-vi MouseDragEnd1Pane 

bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\\ select-pane -l
