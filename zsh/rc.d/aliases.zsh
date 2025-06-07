alias c="clear"
alias x="exit"
alias :q="exit"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# alacritty opacity changer
if test -d "${HOME}/dotfiles/alacritty"; then
	# alias aoc="${HOME}/dotfiles/alacritty/aoc.sh"
	alias aoc="${HOME}/.config/alacritty/aoc.sh"
fi

if command -v eza &>/dev/null; then
	alias l='eza -a --oneline --group-directories-first --icons' # simpler listings
	alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
	alias lsz='eza -al --color=always --total-size --group-directories-first --icons' # include file size
	alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
	alias ll='eza -l --color=always --group-directories-first --icons'  # long format
	alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
	alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
else
	alias ls='ls --color=auto'
	alias la='ls -a'
	alias ll='ls -alFh'
	alias l='ls'
	alias l.="ls -A | egrep '^\.'"
	alias listdir="ls -d */ > list"
fi

if command -v git &>/dev/null; then
  alias gst="git status"
  alias glg="git log"
  alias gpo="git pull origin main"
  alias gPo="git push origin main"
  # lazygit
  alias lg="lazygit"
fi

if command -v zypper &>/dev/null; then
	# opensuse package manager(zypper)
	alias install="sudo zypper install"
	alias search="sudo zypper search"
	alias remove="sudo zypper remove"
elif command -v pkg &>/dev/null; then
	# termux package manager(pkg)
	alias install="pkg install"
	alias search="pkg search"
	alias remove="pkg remove"
elif command -v pacman &>/dev/null; then
	# arch linux package manager(pacman)
	alias install="sudo pacman -S --noconfirm"
	alias search="sudo pacman -Ss"
	alias remove="sudo pacman -Rns"

	alias in="sudo pacman -S --noconfirm"
	alias se="sudo pacman -Ss"
	alias re="sudo pacman -Rns"
fi

alias nb="${EDITOR} .bashrc"
alias nf="cd ${XDG_CONFIG_HOME}/fish && ${EDITOR}"
alias nz="cd ${XDG_CONFIG_HOME}/zsh && ${EDITOR}"
alias nzenv="${EDITOR} ${HOME}/.zshenv"
if command -v zsh &>/dev/null; then
	if test -d ${XDG_CONFIG_HOME}/zsh; then
		alias 'reload!'="clear; source '${XDG_CONFIG_HOME}/zsh/.zshrc'"
		alias :r="clear; source '${XDG_CONFIG_HOME}/zsh/.zshrc'"
	elif test -f ${HOME}/.zshrc; then
		alias 'reload!'="clear; source '${HOME}/.zshrc'"
		alias :r="clear; source '${HOME}/.zshrc'"
	fi
elif command -v bash &>/dev/null; then
	alias 'reload!'="clear; source '${HOME}/.bashrc'"
	alias :r="clear; source '${HOME}/.bashrc'"
fi


alias nyazi="${EDITOR} ${XDH_CONFIG_HOME}/yazi/yazi.toml"
if [[ -d "${HOME}/dotfiles" ]]; then
  alias npkg="${EDITOR} ${HOME}/dotfiles/pkgs.txt"
fi

# system
alias offn="shutdown now"
alias on="shutdown -r now"

# Neovim Related
alias v="nvim" # default neovim
alias vs='NVIM_APPNAME=nvim-simpler nvim' # Simpler
alias ve='NVIM_APPNAME=nvim-eovim nvim' # eovim
alias vee='NVIM_APPNAME=nvim-eeovim nvim' # eovim
