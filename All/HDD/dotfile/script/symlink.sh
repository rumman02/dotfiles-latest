# make a symlinks for every tools to crate a link between dotfiles to that tools required files
# file or file anythng can be done
# ln -s <from path> <to path>				no replace and shows error if any file/folder exist
# ln -sf <from path> <to path>				force replace with existing
# make dir with link example
# mkdir -p <to path> && ln -s <from path> <to path>
# make sure start your path from he $HOME ( ~/... ) path
#
# also you can create many things in dotfiles, but you can only link the nessecary file what you need for the tool
# also you dont need to edit file inside tool directory, you can just edit in dotfiles directory

# for zshrc
# ln -s ~/dotfiles/zsh/zshrc.zsh .zshrc
#
# for nvim
# ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
# ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua
# or full path
# ln -s ~/dotfiles/nvim ~/.config/
