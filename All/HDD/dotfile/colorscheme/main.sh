#!/bin/bash


colorscheme() {
	export colorscheme_filepath="$HOME/.config/colorschemes/"

	while true; do
		clear

		echo " _____ _____ _____ _____ _____ _____ "
		echo "|_   _|  |  |   __|     |   __|   __|"
		echo "  | | |     |   __| | | |   __|__   |"
		echo "  |_| |__|__|_____|_|_|_|_____|_____|"
		echo "====================================="
		echo "Choose tools:"
		echo "1 - Hyprland"
		echo "2 - Waybar"
		echo "3 - Wofi"
		echo "4 - Kitty"
		echo "5 - Wezterm"
		echo "6 - Bash"
		echo "7 - Zsh"
		echo "8 - Tmux"
		echo "9 - Vim"
		echo "a - Neovim"
		echo "b - Lualine"
		# echo "c - Powerlevel10k"
		echo
		echo "q - Quit"
		echo

		echo -n "Enter option: "
		read main_tool_value

		case "$main_tool_value" in
			"1")
				# Code for option 1
				break
				;;
			"2")
				# Code for option 2
				break
				;;
			"3")
				# Code for option 3
				break
				;;
			"4")
				# Code for option 4
				break
				;;
			"5")
				# Code for option 5
				break
				;;
			"6")
				# Code for option 6
				break
				;;
			"7")
				# Code for option 7
				break
				;;
			"8")
				break
				;;
			"9")
				# Code for option 9
				break
				;;
			"a")
				source $colorscheme_filepath/neovim/main.sh
				neovim_colorscheme
				break
				;;
			"b")
				# Code for option b
				break
				;;
			"q")
				echo "Exiting..."
				break
				;;
			*)
				echo "Invalid option selected."
				continue
				;;
		esac

	done
}
