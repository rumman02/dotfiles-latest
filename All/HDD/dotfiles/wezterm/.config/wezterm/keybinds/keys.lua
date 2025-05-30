--  found keyname: https://sw.kovidgoyal.net/kitty/keyboard-protocol/#functional-key-definitions
--
-- NOTE: To achive that in many way
--  1. Inside nvim(outside tmux) in insert mode <C-k> and press that key that how its supports
--  2. Inside nvim in terminal mode command(outside tmux): kitten show-key, get that send_text
--  3. In terminal command(outside tmux): kitten show-key -m kitty, get keycode like
--  	 only focus on PRESS, not RELEASE or anything else
-- 		 (ex:
-- 		 ctrl+space PRESS
-- 		 CSI 32 ; 5 u
-- 		 ), then map your key without "CSI" keyword like
-- 		 map ctrl+space send_text all \x1b[32;5u
-- 	4. some keypreset is:
-- 		 shift+<key> = \x1b[<keycode>;2u
-- 		 alt+<key> = \x1b[<keycode>;3u
-- 		 alt+shift+<key> = \x1b[<keycode>;4u
-- 		 ctrl+<key> = \x1b[<keycode>;5u
-- 		 ctrl+shift+<key> = \x1b[<keycode>;6u
-- 		 ctrl+alt+<key> = \x1b[<keycode>;7u
-- 		 ctrl+alt+shift+<key> = \x1b[<keycode>;8u
-- 		 super+<key> = \x1b[<keycode>;9u
-- 		 super+shift+<key> = \x1b[<keycode>;10u
-- 		 alt+super+<key> = \x1b[<keycode>;11u
-- 		 alt+shift+super+<key> = \x1b[<keycode>;12u
-- 		 ctrl+super+<key> = \x1b[<keycode>;13u
-- 		 ctrl+shift+super+<key> = \x1b[<keycode>;14u
-- 		 ctrl+alt+super+<key> = \x1b[<keycode>;15u
-- 		 ctrl+alt+shift+super+<key> = \x1b[<keycode>;16u

local SendString = require("wezterm").action.SendString

return {
	{ key = '0', mods = 'CTRL', action = SendString('\x1b[48;5u') },
	{ key = '1', mods = 'CTRL', action = SendString('\x1b[49;5u') },
	{ key = '2', mods = 'CTRL', action = SendString('\x1b[50;5u') },
	{ key = '3', mods = 'CTRL', action = SendString('\x1b[51;5u') },
	{ key = '4', mods = 'CTRL', action = SendString('\x1b[52;5u') },
	{ key = '5', mods = 'CTRL', action = SendString('\x1b[53;5u') },
	{ key = '6', mods = 'CTRL', action = SendString('\x1b[54;5u') },
	{ key = '7', mods = 'CTRL', action = SendString('\x1b[55;5u') },
	{ key = '8', mods = 'CTRL', action = SendString('\x1b[56;5u') },
	{ key = '9', mods = 'CTRL', action = SendString('\x1b[57;5u') },

	{ key = '0', mods = 'ALT', action = SendString('\x1b[48;3u') },
	{ key = '1', mods = 'ALT', action = SendString('\x1b[49;3u') },
	{ key = '2', mods = 'ALT', action = SendString('\x1b[50;3u') },
	{ key = '3', mods = 'ALT', action = SendString('\x1b[51;3u') },
	{ key = '4', mods = 'ALT', action = SendString('\x1b[52;3u') },
	{ key = '5', mods = 'ALT', action = SendString('\x1b[53;3u') },
	{ key = '6', mods = 'ALT', action = SendString('\x1b[54;3u') },
	{ key = '7', mods = 'ALT', action = SendString('\x1b[55;3u') },
	{ key = '8', mods = 'ALT', action = SendString('\x1b[56;3u') },
	{ key = '9', mods = 'ALT', action = SendString('\x1b[57;3u') },

	{ key = '0', mods = 'SHIFT', action = SendString('\x1b[48;2u') },
	{ key = '1', mods = 'SHIFT', action = SendString('\x1b[49;2u') },
	{ key = '2', mods = 'SHIFT', action = SendString('\x1b[50;2u') },
	{ key = '3', mods = 'SHIFT', action = SendString('\x1b[51;2u') },
	{ key = '4', mods = 'SHIFT', action = SendString('\x1b[52;2u') },
	{ key = '5', mods = 'SHIFT', action = SendString('\x1b[53;2u') },
	{ key = '6', mods = 'SHIFT', action = SendString('\x1b[54;2u') },
	{ key = '7', mods = 'SHIFT', action = SendString('\x1b[55;2u') },
	{ key = '8', mods = 'SHIFT', action = SendString('\x1b[56;2u') },
	{ key = '9', mods = 'SHIFT', action = SendString('\x1b[57;2u') },

	{ key = '0', mods = 'CTRL|SHIFT', action = SendString('\x1b[48;6u') },
	{ key = '1', mods = 'CTRL|SHIFT', action = SendString('\x1b[49;6u') },
	{ key = '2', mods = 'CTRL|SHIFT', action = SendString('\x1b[50;6u') },
	{ key = '3', mods = 'CTRL|SHIFT', action = SendString('\x1b[51;6u') },
	{ key = '4', mods = 'CTRL|SHIFT', action = SendString('\x1b[52;6u') },
	{ key = '5', mods = 'CTRL|SHIFT', action = SendString('\x1b[53;6u') },
	{ key = '6', mods = 'CTRL|SHIFT', action = SendString('\x1b[54;6u') },
	{ key = '7', mods = 'CTRL|SHIFT', action = SendString('\x1b[55;6u') },
	{ key = '8', mods = 'CTRL|SHIFT', action = SendString('\x1b[56;6u') },
	{ key = '9', mods = 'CTRL|SHIFT', action = SendString('\x1b[57;6u') },

	{ key = '0', mods = 'ALT|SHIFT', action = SendString('\x1b[48;4u') },
	{ key = '1', mods = 'ALT|SHIFT', action = SendString('\x1b[49;4u') },
	{ key = '2', mods = 'ALT|SHIFT', action = SendString('\x1b[50;4u') },
	{ key = '3', mods = 'ALT|SHIFT', action = SendString('\x1b[51;4u') },
	{ key = '4', mods = 'ALT|SHIFT', action = SendString('\x1b[52;4u') },
	{ key = '5', mods = 'ALT|SHIFT', action = SendString('\x1b[53;4u') },
	{ key = '6', mods = 'ALT|SHIFT', action = SendString('\x1b[54;4u') },
	{ key = '7', mods = 'ALT|SHIFT', action = SendString('\x1b[55;4u') },
	{ key = '8', mods = 'ALT|SHIFT', action = SendString('\x1b[56;4u') },
	{ key = '9', mods = 'ALT|SHIFT', action = SendString('\x1b[57;4u') },

	{ key = '0', mods = 'CTRL|ALT', action = SendString('\x1b[48;7u') },
	{ key = '1', mods = 'CTRL|ALT', action = SendString('\x1b[49;7u') },
	{ key = '2', mods = 'CTRL|ALT', action = SendString('\x1b[50;7u') },
	{ key = '3', mods = 'CTRL|ALT', action = SendString('\x1b[51;7u') },
	{ key = '4', mods = 'CTRL|ALT', action = SendString('\x1b[52;7u') },
	{ key = '5', mods = 'CTRL|ALT', action = SendString('\x1b[53;7u') },
	{ key = '6', mods = 'CTRL|ALT', action = SendString('\x1b[54;7u') },
	{ key = '7', mods = 'CTRL|ALT', action = SendString('\x1b[55;7u') },
	{ key = '8', mods = 'CTRL|ALT', action = SendString('\x1b[56;7u') },
	{ key = '9', mods = 'CTRL|ALT', action = SendString('\x1b[57;7u') },

	{ key = '0', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[48;8u') },
	{ key = '1', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[49;8u') },
	{ key = '2', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[50;8u') },
	{ key = '3', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[51;8u') },
	{ key = '4', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[52;8u') },
	{ key = '5', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[53;8u') },
	{ key = '6', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[54;8u') },
	{ key = '7', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[55;8u') },
	{ key = '8', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[56;8u') },
	{ key = '9', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[57;8u') },

	{ key = ',', mods = 'CTRL', action = SendString('\x1b[44;5u') },
	{ key = '.', mods = 'CTRL', action = SendString('\x1b[46;5u') },
	{ key = '/', mods = 'CTRL', action = SendString('\x1b[47;5u') },
	{ key = ';', mods = 'CTRL', action = SendString('\x1b[59;5u') },
	{ key = "'", mods = 'CTRL', action = SendString('\x1b[39;5u') },
	{ key = '[', mods = 'CTRL', action = SendString('\x1b[91;5u') },
	{ key = ']', mods = 'CTRL', action = SendString('\x1b[93;5u') },
	{ key = '\\', mods = 'CTRL', action = SendString('\x1b[92;5u') },
	{ key = '-', mods = 'CTRL', action = SendString('\x1b[45;5u') },
	{ key = '=', mods = 'CTRL', action = SendString('\x1b[61;5u') },
	{ key = '`', mods = 'CTRL', action = SendString('\x1b[96;5u') },

	{ key = ',', mods = 'ALT', action = SendString('\x1b[44;3u') },
	{ key = '.', mods = 'ALT', action = SendString('\x1b[46;3u') },
	{ key = '/', mods = 'ALT', action = SendString('\x1b[47;3u') },
	{ key = ';', mods = 'ALT', action = SendString('\x1b[59;3u') },
	{ key = "'", mods = 'ALT', action = SendString('\x1b[39;3u') },
	{ key = '[', mods = 'ALT', action = SendString('\x1b[91;3u') },
	{ key = ']', mods = 'ALT', action = SendString('\x1b[93;3u') },
	{ key = '\\', mods = 'ALT', action = SendString('\x1b[92;3u') },
	{ key = '-', mods = 'ALT', action = SendString('\x1b[45;3u') },
	{ key = '=', mods = 'ALT', action = SendString('\x1b[61;3u') },
	{ key = '`', mods = 'ALT', action = SendString('\x1b[96;3u') },

	{ key = ',', mods = 'SHIFT', action = SendString('\x1b[44;2u') },
	{ key = '.', mods = 'SHIFT', action = SendString('\x1b[46;2u') },
	{ key = '/', mods = 'SHIFT', action = SendString('\x1b[47;2u') },
	{ key = ';', mods = 'SHIFT', action = SendString('\x1b[59;2u') },
	{ key = "'", mods = 'SHIFT', action = SendString('\x1b[39;2u') },
	{ key = '[', mods = 'SHIFT', action = SendString('\x1b[91;2u') },
	{ key = ']', mods = 'SHIFT', action = SendString('\x1b[93;2u') },
	{ key = '\\', mods = 'SHIFT', action = SendString('\x1b[92;2u') },
	{ key = '-', mods = 'SHIFT', action = SendString('\x1b[45;2u') },
	{ key = '=', mods = 'SHIFT', action = SendString('\x1b[61;2u') },
	{ key = '`', mods = 'SHIFT', action = SendString('\x1b[96;2u') },

	{ key = ',', mods = 'CTRL|SHIFT', action = SendString('\x1b[44;6u') },
	{ key = '.', mods = 'CTRL|SHIFT', action = SendString('\x1b[46;6u') },
	{ key = '/', mods = 'CTRL|SHIFT', action = SendString('\x1b[47;6u') },
	{ key = ';', mods = 'CTRL|SHIFT', action = SendString('\x1b[59;6u') },
	{ key = "'", mods = 'CTRL|SHIFT', action = SendString('\x1b[39;6u') },
	{ key = '[', mods = 'CTRL|SHIFT', action = SendString('\x1b[91;6u') },
	{ key = ']', mods = 'CTRL|SHIFT', action = SendString('\x1b[93;6u') },
	{ key = '\\', mods = 'CTRL|SHIFT', action = SendString('\x1b[92;6u') },
	{ key = '-', mods = 'CTRL|SHIFT', action = SendString('\x1b[45;6u') },
	{ key = '=', mods = 'CTRL|SHIFT', action = SendString('\x1b[61;6u') },
	{ key = '`', mods = 'CTRL|SHIFT', action = SendString('\x1b[96;6u') },

	{ key = ',', mods = 'ALT|SHIFT', action = SendString('\x1b[44;4u') },
	{ key = '.', mods = 'ALT|SHIFT', action = SendString('\x1b[46;4u') },
	{ key = '/', mods = 'ALT|SHIFT', action = SendString('\x1b[47;4u') },
	{ key = ';', mods = 'ALT|SHIFT', action = SendString('\x1b[59;4u') },
	{ key = "'", mods = 'ALT|SHIFT', action = SendString('\x1b[39;4u') },
	{ key = '[', mods = 'ALT|SHIFT', action = SendString('\x1b[91;4u') },
	{ key = ']', mods = 'ALT|SHIFT', action = SendString('\x1b[93;4u') },
	{ key = '\\', mods = 'ALT|SHIFT', action = SendString('\x1b[92;4u') },
	{ key = '-', mods = 'ALT|SHIFT', action = SendString('\x1b[45;4u') },
	{ key = '=', mods = 'ALT|SHIFT', action = SendString('\x1b[61;4u') },
	{ key = '`', mods = 'ALT|SHIFT', action = SendString('\x1b[96;4u') },

	{ key = ',', mods = 'CTRL|ALT', action = SendString('\x1b[44;7u') },
	{ key = '.', mods = 'CTRL|ALT', action = SendString('\x1b[46;7u') },
	{ key = '/', mods = 'CTRL|ALT', action = SendString('\x1b[47;7u') },
	{ key = ';', mods = 'CTRL|ALT', action = SendString('\x1b[59;7u') },
	{ key = "'", mods = 'CTRL|ALT', action = SendString('\x1b[39;7u') },
	{ key = '[', mods = 'CTRL|ALT', action = SendString('\x1b[91;7u') },
	{ key = ']', mods = 'CTRL|ALT', action = SendString('\x1b[93;7u') },
	{ key = '\\', mods = 'CTRL|ALT', action = SendString('\x1b[92;7u') },
	{ key = '-', mods = 'CTRL|ALT', action = SendString('\x1b[45;7u') },
	{ key = '=', mods = 'CTRL|ALT', action = SendString('\x1b[61;7u') },
	{ key = '`', mods = 'CTRL|ALT', action = SendString('\x1b[96;7u') },

	{ key = ',', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[44;8u') },
	{ key = '.', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[46;8u') },
	{ key = '/', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[47;8u') },
	{ key = ';', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[59;8u') },
	{ key = "'", mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[39;8u') },
	{ key = '[', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[91;8u') },
	{ key = ']', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[93;8u') },
	{ key = '\\', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[92;8u') },
	{ key = '-', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[45;8u') },
	{ key = '=', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[61;8u') },
	{ key = '`', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[96;8u') },

	{ key = 'Enter', mods = 'SHIFT', action = SendString('\x1b[13;2u') },
	{ key = 'Tab', mods = 'SHIFT', action = SendString('\x1b[9;2u') },
	{ key = 'Backspace', mods = 'SHIFT', action = SendString('\x1b[127;2u') },
	{ key = 'Escape', mods = 'SHIFT', action = SendString('\x1b[27;2u') },
	{ key = 'Space', mods = 'SHIFT', action = SendString('\x1b[32;2u') },

	{ key = 'Enter', mods = 'ALT', action = SendString('\x1b[13;3u') },
	{ key = 'Tab', mods = 'ALT', action = SendString('\x1b[9;3u') },
	{ key = 'Backspace', mods = 'ALT', action = SendString('\x1b[127;3u') },
	{ key = 'Escape', mods = 'ALT', action = SendString('\x1b[27;3u') },
	{ key = 'Space', mods = 'ALT', action = SendString('\x1b[32;3u') },

	{ key = 'Enter', mods = 'ALT|SHIFT', action = SendString('\x1b[13;4u') },
	{ key = 'Tab', mods = 'ALT|SHIFT', action = SendString('\x1b[9;4u') },
	{ key = 'Backspace', mods = 'ALT|SHIFT', action = SendString('\x1b[127;4u') },
	{ key = 'Escape', mods = 'ALT|SHIFT', action = SendString('\x1b[27;4u') },
	{ key = 'Space', mods = 'ALT|SHIFT', action = SendString('\x1b[32;4u') },

	{ key = 'Enter', mods = 'CTRL', action = SendString('\x1b[13;5u') },
	{ key = 'Tab', mods = 'CTRL', action = SendString('\x1b[9;5u') },
	{ key = 'Backspace', mods = 'CTRL', action = SendString('\x1b[127;5u') },
	{ key = 'Escape', mods = 'CTRL', action = SendString('\x1b[27;5u') },
	{ key = 'Space', mods = 'CTRL', action = SendString('\x1b[32;5u') },

	{ key = 'Enter', mods = 'CTRL|SHIFT', action = SendString('\x1b[13;6u') },
	{ key = 'Tab', mods = 'CTRL|SHIFT', action = SendString('\x1b[9;6u') },
	{ key = 'Backspace', mods = 'CTRL|SHIFT', action = SendString('\x1b[127;6u') },
	{ key = 'Escape', mods = 'CTRL|SHIFT', action = SendString('\x1b[27;6u') },
	{ key = 'Space', mods = 'CTRL|SHIFT', action = SendString('\x1b[32;6u') },

	{ key = 'Enter', mods = 'CTRL|ALT', action = SendString('\x1b[13;7u') },
	{ key = 'Tab', mods = 'CTRL|ALT', action = SendString('\x1b[9;7u') },
	{ key = 'Backspace', mods = 'CTRL|ALT', action = SendString('\x1b[127;7u') },
	{ key = 'Escape', mods = 'CTRL|ALT', action = SendString('\x1b[27;7u') },
	{ key = 'Space', mods = 'CTRL|ALT', action = SendString('\x1b[32;7u') },

	{ key = 'Enter', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[13;8u') },
	{ key = 'Tab', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[9;8u') },
	{ key = 'Backspace', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[127;8u') },
	{ key = 'Escape', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[27;8u') },
	{ key = 'Space', mods = 'CTRL|ALT|SHIFT', action = SendString('\x1b[32;8u') },
}

