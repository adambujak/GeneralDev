export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/usr/local/opt/python@3.7/bin
alias ibrew="arch -x86_64 /usr/local/bin/brew"
source ~/venv/bin/activate

alias lsusb='ioreg -p IOUSB'
alias tmux='tmux -2'
alias vim='nvim'
alias gadd='git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -'

#make ctrl p work exactly like up arrow
bindkey "^P" up-line-or-search

#ignore ORIG_HEAD in git autocomplete
zstyle ':completion:*:*:git*:*' ignored-patterns '*ORIG_HEAD'

if [ "$TMUX" = "" ]; then tmux; fi

