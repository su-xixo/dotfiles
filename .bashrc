#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG="en_US.UTF-8"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='nvim'
export VISUAL='nvim'
export DOTFILES="$HOME/dotfiles"
export CUST_BIN="$HOME/.local/bin"

export VIM4HELIX="$HOME/.local/src/vim4helix"
if [ -f "$VIM4HELIX/contrib/hx.bash" ]; then
  source "$VIM4HELIX/contrib/hx.bash"
fi

lazygit-cd() {
  lazygit
}
# Launch lazygit with Ctrl+G
bind -x '"\eg": lazygit-cd'

# Launch Yazi with Alt+Y
bind -x '"\ey": yazi'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias path='echo "$PATH" | tr ":" "\n" | nl -ba'
alias nvc='NVIM_APPNAME=nvim-nvchad nvim'
PS1='[\u@\h \W]\$ '

eval "$(zoxide init --cmd cd bash)"
