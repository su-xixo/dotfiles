# zmodload zsh/zprof
function is_command(){
	command -v $1 &>/dev/null
}
eval "$(starship init zsh)"

# Load environments
source "${XDG_CONFIG_HOME}/zsh/rc.d/env.zsh"

# Load plugins
is_command zinit || source "${XDG_CONFIG_HOME}/zsh/rc.d/plugins/01-init.zsh"
for plug in ${XDG_CONFIG_HOME}/zsh/rc.d/plugins/**/*.zsh; do
	if [[ $(basename $plug) =~ "init" ]]; then
		continue
	fi
	source $plug
done

# Load completions
# NOTE: Always load complition after fpath and plugins
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

is_command zinit && zinit cdreplay -q

# Load zsh settings and options
source "${XDG_CONFIG_HOME}/zsh/rc.d/options.zsh"

# Load aliases, functions and abbevations
source "${XDG_CONFIG_HOME}/zsh/rc.d/aliases.zsh"
source "${XDG_CONFIG_HOME}/zsh/rc.d/functions.zsh"

is_command zoxide && eval "$(zoxide init --cmd cd zsh)"
is_command fzf && source <(fzf --zsh)
# zprof
