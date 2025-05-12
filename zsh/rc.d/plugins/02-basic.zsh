zinit wait'0a' lucid light-mode for \
	atinit"zicompinit; zicdreplay"\
	zsh-users/zsh-syntax-highlighting \
	zsh-users/zsh-completions \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-history-substring-search \

zinit wait'0b' lucid light-mode for \
	Aloxaf/fzf-tab \
	olets/zsh-abbr \

# zsh-abbr
export ABBR_USER_ABBREVIATIONS_FILE="${XDG_CONFIG_HOME}/zsh/rc.d/abbrs.zsh"
export ABBR_TMPDIR="${XDG_CONFIG_HOME}/zsh/rc.d/tmp/"
