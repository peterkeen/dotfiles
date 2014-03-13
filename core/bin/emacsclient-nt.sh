#!/bin/sh

filename=$1
shift

if [ ! $filename ]; then
    rand=`head -c100 /dev/urandom | md5`
    now=`date '+%Y%m%d-%H%M%S'`
    filename="~/.scratch/$now-$rand.md"
fi

/usr/local/bin/emacsclient -nt $filename $@
