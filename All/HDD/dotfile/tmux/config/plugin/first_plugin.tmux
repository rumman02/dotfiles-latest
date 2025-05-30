# Check if the TPM directory exists
if-shell "[ ! -d ~/.config/tmux/plugins/tpm ]" \
  "run-shell ' \
    mkdir -p ~/.config/tmux/plugins && \
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && \
    sleep 2 && \
    tmux source-file ~/.config/tmux/tmux.conf \
  '" \
# "display-message 'TPM is already installed.'"

# tmux plugin manager
set -g @plugin "tmux-plugins/tpm"
