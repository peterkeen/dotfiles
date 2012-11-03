export EMAIL='pkeen@kongregate.com'
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_EMAIL=$EMAIL
export KONGROOT="/Users/pkeen/devel/kongregate"
export SHOW_NOTMUCH_INBOX_COUNT=true

if [[ -f $HOME/.kongpass ]]; then
    . ~/.kongpass
fi

alias s="open-story"