export EMAIL='pkeen@kongregate.com'
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_EMAIL=$EMAIL
export KONGROOT="$HOME/devel/kongregate"
export SHOW_NOTMUCH_INBOX_COUNT=true

if [[ -f $HOME/.kongpass ]]; then
    . ~/.kongpass
fi

alias s="open-story"
alias today="yesterday today"
alias summary="kong-summary.rb"

function y {
    yesterday | awk '{print $3}' | grep -v master | sort -u
}

function t {
    yesterday today | awk '{print $3}' | grep -v master | sort -u
}

function d {
    grep '\[DEPLOY\]' ~/.konglog
}
