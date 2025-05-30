# # keybinds
# ## plugins
# prefix + I  = install plugins
# prefix + U = uninstall plugins
# prefix +  = update plugins
#
# ## session
# prefix + S = save session
# prefix + R = restore session
#
# ## cursor
# ### window
# prefix ctrl + h / j / k / l = go window left / down / up / right
# prefix ctrl + 1 / 2 ... 9 / 0 = go window 1, 2, ... 9, 10
#
# ### tab
# prefix alt + 1 / 2 ... 9 / 0 = go tab 1, 2, ... 9, 10
# prefix alt + h / l = go tab left / right
#
# ### session
# prefix alt + j / k = go session down / up
#
# ## pane (i would say it to window)
# prefix 	w		= window
# 			|-- o	  	= open
# 			|   |-- h 		= left
# 			|   |--	j 		= down
# 			|   |--	k 		= up
# 			|   |--	l 		= right
# 			|-- c     	= close
# 			|   |-- h 		= left
# 			|   |--	j 		= down
# 			|   |--	k 		= up
# 			|   |--	l 		= right
# 			|   |--	c 		= current
# 			|   |--	o 		= others
# 			|-- r     	= resize
# 			|   |-- h 		= left
# 			|   |--	j 		= down
# 			|   |--	k 		= up
# 			|   |--	l 		= right
# 			|   |--	m 		= maximize
# 			|-- s     	= swap
# 			|   |-- h 		= left
# 			|   |--	j 		= down
# 			|   |--	k 		= up
# 			|   |--	l 		= right
# 			|   |--	r 		= rotate
# 			|-- t     	= tab
# 			|   |-- h 		= left as new
# 			|   |--	l 		= right as new
# 			|   |-- H 		= left to add
# 			|   |--	L 		= right to add
# 			|   |--	i	= index to add (tab index)
# 			|-- l	  	= list
# 			|-- i	  	= index to go (window index)
# 			|-- L	  	= change layout
#
# ## window (i would say it to tab)
# prefix	t		= tab
# 			|--	o	  	= open
# 			|	|-- h 		= left
# 			|	|--	l 		= right
# 			|	|-- H 		= left with name
# 			|	|--	L 		= right with name
# 			|---c   	= close
# 			|	|-- h 		= left
# 			|	|--	l 		= right
# 			|	|-- c 		= current
# 			|	|--	o 		= others
# 			|---s   	= swap
# 			|	|-- h 		= left
# 			|	|--	l 		= right
# 			|---l	  	= list
# 			|---i	  	= index to go (tab index)
# 			|---r	  	= rename
#
# ## session
# prefix	s		= session
# 			|--	o	  	= open
# 			|	|-- j 		= down
# 			|	|--	k 		= up
# 			|	|-- J 		= down with name
# 			|	|--	K 		= up with name
# 			|---c   	= close
# 			|	|-- c 		= current
# 			|	|--	o 		= others
# 			|	|-- a 		= all
# 			|---s   	= swap
# 			|	|-- h 		= left
# 			|	|--	l 		= right
# 			|---l	  	= list
# 			|---r	  	= rename
#
# ## client
# prefix	c		= client
# 			|---l	  	= list
#
# ## miscs
# prefix	b		= tmux bar hide / unhide
# prefix	d		= detach tmux
# prefix	:		= command mode
# prefix	r		= resourced
# prefix	z		= suspend tmux
# prefix	i		= sync window
#
# ## yank mode (similar binds as vim)
# prefix	y		= enter yank mode
# s + j / k			= scroll down / up without moving current cursor position
# c + u / d  		= half page up / down
# c + b / f			= full page up / down
# v					= enter visual mode and visual normal selection
# c-v				= enter visual line mode from visual normal selection
# s-v				= enter visual block mode from visual normal selection
# y					= yank selection
# c-y				= exit yank mode




source-file ~/dotfile/tmux/config/keybind/unbind.tmux

# set prefix
set -g prefix C-a
bind-key C-a send-prefix

source-file ~/dotfile/tmux/config/keybind/pane.tmux
source-file ~/dotfile/tmux/config/keybind/window.tmux
source-file ~/dotfile/tmux/config/keybind/session.tmux
source-file ~/dotfile/tmux/config/keybind/client.tmux
source-file ~/dotfile/tmux/config/keybind/cursor.tmux
source-file ~/dotfile/tmux/config/keybind/copy_mode.tmux
source-file ~/dotfile/tmux/config/keybind/other.tmux
