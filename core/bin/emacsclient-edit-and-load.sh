#!/bin/sh

FILENAME=$1

emacsclient $FILENAME && emacsclient -e "(load-file ""\"$FILENAME""\")"