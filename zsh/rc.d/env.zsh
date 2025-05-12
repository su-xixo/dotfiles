# fix locale utf-8 problem for utf-8 charcters
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export BAT_CONFIG_PATH="${XDG_COBFIG_HOME:-$HOME/.config}/bat/bat.conf"

if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
	PATH="${HOME}/bin:${PATH}"
	# echo "'$HOME/bin' path added..."
fi

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
	PATH="$HOME/.local/bin:${PATH}"
	# echo "'$HOME/.local/bin' path added..."
fi

## zxoide specific
export _ZO_DATA_DIR="${XDG_CONFIG_HOME}/zoxide"
# export _ZO_FZF_OPTS="" # custom options to pass to fzf during interactive selection.
export _ZO_RESOLVE_SYMLINKS=1
