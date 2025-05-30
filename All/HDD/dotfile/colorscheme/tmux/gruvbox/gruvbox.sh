#!/bin/bash

tmux_colorscheme_gruvbox() {
	while true; do
		clear

		echo " _____ _____ _____ _____ _____ _____ "
		echo "|_   _|  |  |   __|     |   __|   __|"
		echo "  | | |     |   __| | | |   __|__   |"
		echo "  |_| |__|__|_____|_|_|_|_____|_____|"
		echo "====================================="

		echo "Current tool: Neovim"
		echo "Current colorscheme: Gruvbox"
		echo "Choose theme:"
		echo "1 - Soft   (⚪ Light theme)"
		echo "2 - Medium (⚪ Light theme)"
		echo "3 - Hard   (⚪ Light theme)"
		echo "4 - Soft   (⚫ Dark theme)"
		echo "5 - Medium (⚫ Dark theme) [⭐Default]"
		echo "6 - Hard   (⚫ Dark theme)"
		echo
		echo "t/T - No transparent [⭐Default] / Transparent"
		echo
		echo "q - Quit"
		echo

		echo -n "Enter option (Nothing will set to default): "
		read neovim_colorscheme_value

		# this file where the changes first write
		file=$colorscheme_filepath/neovim/gruvbox/gruvbox.lua

		# search words
		searchWord1='contrast'
		searchWord2='vim.o.background'
		searchWord3='SignColumn'
		searchWord4='FloatBorder'
		searchWord5='CmpBorder'
		searchWord6='CmpDocBorder'
		searchWord7='WhichKeyBorder'
		searchWord8='FlashLabel'
		searchWord9='NeotreeNormal '
		searchWord10='NeotreeNormalNC '
		searchWord30='transparent_mode'

		newLine1=""
		newLine2=""
		newLine3=""
		newLine4=""
		newLine5=""
		newLine6=""
		newLine7=""
		newLine8=""
		newLine9=""
		newLine10=""
		newLine30=""

		# if user no input, then sets default
		if [ -z "$neovim_colorscheme_value" ]; then
			neovim_colorscheme_value="5t"
			echo "No input provided. Using defaults"
			echo "Theme - Medium (Dark theme)"
			echo "Transparency - False"
		fi

		# loop through each character in the input
		for (( i=0; i<${#neovim_colorscheme_value}; i++ )); do
			char=$(echo "$neovim_colorscheme_value" | cut -c $((i + 1)))

			# this lines as variable
			contrast="			contrast = "
			background="		vim.o.background = "
			transparent_mode="			transparent_mode = "

			sign_column="				SignColumn = "
			float_border="				FloatBorder = "
			cmp_border="				CmpBorder = "
			cmp_doc_border="				CmpDocBorder = "
			which_key_border="				WhichKeyBorder = "
			flash_label="				FlashLabel = "
			neotree_normal="				NeotreeNormal = "
			neotree_normal_nc="				NeotreeNormalNC = "

			# user input char match here and execute that
			case "$char" in
				"1")
					newLine1="${contrast}\"soft\","
					newLine2="${background}\"light\""
					newLine3="${sign_column}{},"
					newLine4="${float_border}{},"
					newLine5="${cmp_border}{},"
					newLine6="${cmp_doc_border}{},"
					newLine7="${which_key_border}{},"
					newLine8="${flash_label}{},"
					newLine9="${neotree_normal}{},"
					newLine10="${neotree_normal_nc}{},"
					;;
				"2")
					newLine1="${contrast}\"\","
					newLine2="${background}\"light\""
					newLine3="${sign_column}{},"
					newLine4="${float_border}{},"
					newLine5="${cmp_border}{},"
					newLine6="${cmp_doc_border}{},"
					newLine7="${which_key_border}{},"
					newLine8="${flash_label}{},"
					newLine9="${neotree_normal}{},"
					newLine10="${neotree_normal_nc}{},"
					;;
				"3")
					newLine1="${contrast}\"hard\","
					newLine2="${background}\"light\""
					newLine3="${sign_column}{},"
					newLine4="${float_border}{},"
					newLine5="${cmp_border}{},"
					newLine6="${cmp_doc_border}{},"
					newLine7="${which_key_border}{},"
					newLine8="${flash_label}{},"
					newLine9="${neotree_normal}{},"
					newLine10="${neotree_normal_nc}{},"
					;;
				"4")
					newLine1="${contrast}\"soft\","
					newLine2="${background}\"dark\""
					newLine3="${sign_column}{},"
					newLine4="${float_border}{},"
					newLine5="${cmp_border}{},"
					newLine6="${cmp_doc_border}{},"
					newLine7="${which_key_border}{},"
					newLine8="${flash_label}{},"
					newLine9="${neotree_normal}{},"
					newLine10="${neotree_normal_nc}{},"
					;;
				"5")
					newLine1="${contrast}\"\","
					newLine2="${background}\"dark\""
					newLine3="${sign_column}{ bg = \"none\" },"
					newLine4="${float_border}{ link = \"GruvboxBg2\" },"
					newLine5="${cmp_border}{ link = \"GruvboxBg2\" },"
					newLine6="${cmp_doc_border}{ link = \"GruvboxBg2\" },"
					newLine7="${which_key_border}{ link = \"GruvboxBg2\" },"
					newLine8="${flash_label}{ fg = \"#fff100\" },"
					newLine9="${neotree_normal}{ bg = \"#1c1c1c\" },"
					newLine10="${neotree_normal_nc}{ bg = \"#1c1c1c\" },"
					;;
				"6")
					newLine1="${contrast}\"hard\","
					newLine2="${background}\"dark\""
					newLine4="${sign_column}{},"
					newLine3="${sign_column}{},"
					newLine4="${float_border}{},"
					newLine5="${cmp_border}{},"
					newLine6="${cmp_doc_border}{},"
					newLine7="${which_key_border}{},"
					newLine8="${flash_label}{},"
					newLine9="${neotree_normal}{},"
					newLine10="${neotree_normal_nc}{},"
					;;
				"t") newLine30="${transparent_mode}false," ;;
				"T") newLine30="${transparent_mode}true," ;;
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
			echo "No valid contrast option selected."
		fi

		if [ -n "$newLine2" ]; then
			sed -i "/${searchWord2}/c\\${newLine2}" $file
		else
			# echo "No valid background option selected."
		fi

		if [ -n "$newLine30" ]; then
			sed -i "/${searchWord30}/c\\${newLine30}" $file
		else
			echo "No valid transparency option selected."
		fi

		# these are always execute
		sed -i "/${searchWord3}/c\\${newLine3}" $file
		sed -i "/${searchWord4}/c\\${newLine4}" $file
		sed -i "/${searchWord5}/c\\${newLine5}" $file
		sed -i "/${searchWord6}/c\\${newLine6}" $file
		sed -i "/${searchWord7}/c\\${newLine7}" $file
		sed -i "/${searchWord8}/c\\${newLine8}" $file
		sed -i "/${searchWord9}/c\\${newLine9}" $file
		sed -i "/${searchWord10}/c\\${newLine10}" $file

		# this line is, write all the things of this file to that file
		cat $colorscheme_filepath/neovim/gruvbox/gruvbox.lua > $neovim_colorscheme_filepath
		break
	done
}
