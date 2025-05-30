# Set the tmux config directory
tmux=~/.config/tmux
tpm="$tmux/plugins/tpm"

# Check if the TPM directory exists
if [ ! -d "$tpm" ]; then
	# Create the plugins directory if it doesn't exist
	    mkdir -p "$tmux/plugins"
	
	# Clone the TPM repository
	    git clone https://github.com/tmux-plugins/tpm "$tpm"
	
	# Delay for a few seconds (e.g., 2 seconds)
	  sleep 2
	# Source the tmux configuration
	tmux source "$tmux/tmux.conf"
fi
