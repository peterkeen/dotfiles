unset PROMPT_COMMAND
export PATH=/Applications/Emacs.app/Contents/MacOS/bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='emacsclient'


__dotfiles_status ()
{
    if [[ `ruby --version | grep jruby` != "" ]]; then
        return
    fi

    diffs=`cd ~/dotfiles && rake -s show_differences_stat`
    if [[ $diffs != "" ]]; then
        printf "%s " $diffs
    fi
}

. ~/dotfiles/core/aliases.sh
