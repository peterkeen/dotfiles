#!/bin/sh

path=`readlink -f ${@}`

if [  ! -z "${SSH_CLIENT}" ]; then
    echo $path
    exec ssh -p 8022 -t peter@localhost emacsclient-nt.sh /ssh:testing:$path
fi

filename=$1
shift

emacsclient -n $filename $@
