#!/bin/bash

neovim_colorscheme() {
	export neovim_colorscheme_filepath="$HOME/.config/nvim/lua/utilities/settings/current_colorscheme.lua"
	while true; do
		clear

		echo " _____ _____ _____ _____ _____ _____ "
		echo "|_   _|  |  |   __|     |   __|   __|"
		echo "  | | |     |   __| | | |   __|__   |"
		echo "  |_| |__|__|_____|_|_|_|_____|_____|"
		echo "====================================="
		echo "Current tool: Neovim"
		echo "Choose colorscheme:"
		echo "1 - Gruvbox"
		echo "2 - Catppuccin"
		echo
		echo "q - Quit"
		echo

		echo -n "Enter option: "
		read neovim_colorscheme_value

		if [ "$neovim_colorscheme_value" -eq 1 ]; then
			source $colorscheme_filepath/neovim/gruvbox/gruvbox.sh
			neovim_colorscheme_gruvbox
			break
		elif [ "$neovim_colorscheme_value" -eq 2 ]; then
			source $colorscheme_filepath/neovim/catppuccin/catppuccin.sh
			neovim_colorscheme_catppuccin
			break
		elif [ "$neovim_colorscheme_value" == "t" ]; then
			break 
		elif [ "$neovim_colorscheme_value" == "q" ]; then
			echo "Exiting..."
			break
		else
			echo "Invalid option selected."
		fi

	done
}
