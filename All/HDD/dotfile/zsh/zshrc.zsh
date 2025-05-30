# first_load_comman 
# put this command in the .zshrc very first line for getting warning from p10klevel
source ~/dotfile/zsh/config/first_command/command.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh plugin manager
source ~/dotfile/zsh/config/plugin/zinit.zsh

# install all the plugins by zsh plugin manager
source ~/dotfile/zsh/config/plugin/plugin.zsh

# settings the configs of zsh
source ~/dotfile/zsh/config/setting/setting.zsh

# shell_features
source ~/dotfile/zsh/config/shell_feature/main.zsh

# set all aliases
source ~/dotfile/zsh/config/aliase/aliase.zsh

# executed files
# code_here

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
