alias ea='$EDITOR ~/dotfiles/core/aliases.sh && . ~/dotfiles/core/aliases.sh && pushd ~/dotfiles && git commit -m "edited aliases" core/aliases.sh && git push origin master && popd'

alias ls='ls -lh'
alias sl='ls -lh'
alias e='emacsclient-nt.sh'
alias es='emacsclient-nt-sudo.sh'
alias et='emacsclient-t.sh'
alias vi='emacsclient-nt.sh'
alias vim='emacsclient-nt.sh'
alias marginalia="rvm system do marginalia"
alias okapi='ledger -f /Users/peter/okapi/ledger.txt'
alias cora='ledger -f /Users/peter/cora-st/ledger.txt'
alias rack=/opt/boxen/homebrew/bin/ack
alias expose=/Users/peter/devel/Expose/expose.sh

if [[ `which ag` != "" ]]; then
    alias ack=ag
fi
