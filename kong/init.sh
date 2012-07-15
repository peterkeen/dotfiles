export EMAIL='pkeen@kongregate.com'
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_EMAIL=$EMAIL
export KONGROOT="/Users/pkeen/devel/kongregate"

if [[ -f $HOME/.kongpass ]]; then
    . ~/.kongpass
fi
