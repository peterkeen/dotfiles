#!/bin/sh

if [ ! $1 ]; then
    echo "Usage: emacsclien-nt-sudo.sh <filename>"
    exit 1
fi

/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nt /sudo:localhost:$@