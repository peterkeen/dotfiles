unset PROMPT_COMMAND
export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


__dotfiles_status ()
{
    diffs=`cd ~/dotfiles && rake show_differences_stat`
    if [[ $diffs != "" ]]; then
        printf "%s " $diffs
    fi
}

. ~/dotfiles/core/aliases.sh