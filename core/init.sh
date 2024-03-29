unset PROMPT_COMMAND
export PATH=/Applications/Emacs.app/Contents/MacOS/bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR='emacsclient'
export LC_CTYPE="UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

shopt -s histappend
shopt -s checkhash

export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
export HISTCONTROL=erasedups

export BASH_SILENCE_DEPRECATION_WARNING=1

export PROMPT_COMMAND='history -a'

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

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

[ -f /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)

. ~/dotfiles/core/aliases.sh
