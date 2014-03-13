#!/bin/sh

if [ ! $1 ]; then
    echo "Usage: emacsclien-nt-sudo.sh <filename>"
    exit 1
fi

emacsclient -nt /sudo:localhost:$@
