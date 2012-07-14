#!/usr/bin/env bash

# desc:
#     Allows stdin to be 'piped' to an emacs server.
#
# options:
#     none
#
# usage:
#     $ echo "hello there" | emacsclientw.sh
#     $ cat ~/.emacs | emacsclientw.sh
#     $ emacsclientw.sh ~/.emacs
#
# author:
#     Phil Jackson (phil@shellarchive.co.uk)

tmp_file="$(mktemp)"
lisp_to_accept_file="(phil/fake-stdin-slurp \"${tmp_file}\")"

if [ ! -t 0  ]; then
    cat > "${tmp_file}"

    emacsclient -e "${lisp_to_accept_file}" ${@}

    if [ ${?} -ne 0 ]; then
        echo "failed: your input was saved in '${tmp_file}'"
    else
        rm -f "${tmp_file}"
    fi
else
    # nothing from stdin
    emacsclient -n ${@}
fi
