#!/bin/bash

if [ ! $INSIDE_EMACS ]; then
    emacsclient -t --alternate-editor='emacs-server-if-needed.pl && sleep 1 && emacsclient -t'
else
    echo "Already inside emacsclient"
fi