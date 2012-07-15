__notmuch_count ()
{
    if [ -n "${SHOW_NOTMUCH_COUNT-}" ]; then
        count=`notmuch count --output=threads $1`
        if [[ $count > 0 ]]; then
            printf "[%s] " $count
        fi
    fi
}


alias m='$EDITOR -e "(inbox)"'