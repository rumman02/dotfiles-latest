#!/bin/bash

tmux_colorscheme() {
	export tmux_colorscheme_filepath="$HOME/.config/tmux/configs/current_colorscheme.conf"
	while true; do
		clear

		echo " _____ _____ _____ _____ _____ _____ "
		echo "|_   _|  |  |   __|     |   __|   __|"
		echo "  | | |     |   __| | | |   __|__   |"
		echo "  |_| |__|__|_____|_|_|_|_____|_____|"
		echo "====================================="
		echo "Current tool: Tmux"
		echo "Choose colorscheme:"
		echo "1 - Gruvbox"
		echo "2 - Catppuccin"
		echo "3 - Dracula"
		echo
		echo "q - Quit"
		echo

		echo -n "Enter option: "
		read tmux_colorscheme_value

		if [ "$tmux_colorscheme_value" -eq 1 ]; then
			source $colorscheme_filepath/tmux/gruvbox/gruvbox.sh
			tmux_colorscheme_gruvbox
			break
		elif [ "$tmux_colorscheme_value" -eq 2 ]; then
			source $colorscheme_filepath/tmux/catppuccin/catppuccin.sh
			tmux_colorscheme_catppuccin
			break
		elif [ "$tmux_colorscheme_value" -eq 3 ]; then
			source $colorscheme_filepath/tmux/dracula/dracula.sh
			tmux_colorscheme_dracula
			break
		elif [ "$tmux_colorscheme_value" == "q" ]; then
			echo "Exiting..."
			break
		else
			echo "Invalid option selected."
		fi

	done
}
