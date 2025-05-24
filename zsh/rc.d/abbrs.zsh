abbr c='clear'
abbr x='exit'
abbr :q='exit'
abbr xz='clear && exec zsh'

if command -v git &?/dev/null; then
  abbr gst='git status'
  abbr glg='git log'
  abbr gpo='git pull origin main'
  abbr gPo='git push origin main'
fi

# Nvim Abbrevations
abbr ee='NVIM_APPNAME=nvim-stable nvim'
