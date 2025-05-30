# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# shell_integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
