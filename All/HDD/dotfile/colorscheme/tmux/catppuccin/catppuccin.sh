#!/bin/bash

tmux_colorscheme_catppuccin() {
	while true; do
		clear

		echo " _____ _____ _____ _____ _____ _____ "
		echo "|_   _|  |  |   __|     |   __|   __|"
		echo "  | | |     |   __| | | |   __|__   |"
		echo "  |_| |__|__|_____|_|_|_|_____|_____|"
		echo "====================================="
		echo "Current tool: Tmux"
		echo "Current colorscheme: Catppuccin"
		echo "Choose theme:"
		echo "1 - Latte     (⚪ Light theme)"
		echo "2 - Mocha     (⚫ Dark theme) [⭐Default]"
		echo "3 - Macchiato (⚫ Dark theme)"
		echo "4 - Frappe    (⚫ Dark theme)"
		echo
		echo "t/T - No transparent [⭐Default] / Transparent"
		echo
		echo "q - Quit"
		echo

		echo -n "Enter option (Nothing will set to default): "
		read neovim_colorscheme_value

		# this file where the changes first write
		file=$colorscheme_filepath/neovim/catppuccin/catppuccin.lua

		# search words
		searchWord1='flavour'
		searchWord2='transparent_background'

		newLine1=""
		newLine2=""

		# if user no input, then sets default
		if [ -z "$neovim_colorscheme_value" ]; then
			neovim_colorscheme_value="2t"
			echo "No input provided. Using defaults"
			echo "Theme - Mocha (Dark theme)"
			echo "Transparency - False"
		fi

		# loop through each character in the input
		for (( i=0; i<${#neovim_colorscheme_value}; i++ )); do
			char=$(echo "$neovim_colorscheme_value" | cut -c $((i + 1)))


			# user input char match here and execute that
			case "$char" in
				"1")
					newLine1="${flavour}\"latte\","
					;;
				"2")
					newLine1="${flavour}\"mocha\","
					;;
				"3")
					newLine1="${flavour}\"macchiato\","
					;;
				"4")
					newLine1="${flavour}\"frappe\","
					;;
				"t") newLine2="${transparent_background}false," ;;
				"T") newLine2="${transparent_background}true," ;;
				"q")
					echo "Exiting..."
					break
					;;
				*) 
					continue
					;;
			esac
		done

		# this conditions are, find the searchword and repalce the like of the file
		if [ -n "$newLine1" ]; then
			sed -i "/${searchWord1}/c\\${newLine1}" $file
		else
			echo "No valid flavour option selected."
		fi

		if [ -n "$newLine2" ]; then
			sed -i "/${searchWord2}/c\\${newLine2}" $file
		else
			echo "No valid transparency option selected."
		fi

		# this line is, write all the things of this file to that file
		cat $colorscheme_filepath/neovim/catppuccin/catppuccin.lua > $neovim_colorscheme_filepath 
		break
	done
}
