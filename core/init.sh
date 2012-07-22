unset PROMPT_COMMAND
export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


__dotfiles_status ()
{
    printf "%s " `cd ~/dotfiles && rake show_differences_stat`
}

. ~/dotfiles/core/aliases.sh