#!/bin/bash

date=$(date +%Y%m%d-%H%M%S)
tarsnap -c -f 1Password-$date /Users/peter/Dropbox/1Password/
tarsnap -c -f financials-$date /Users/peter/financials
tarsnap -c -f okapi-$date /Users/peter/okapi
sleep 10
