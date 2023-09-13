#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).

# Alias definitions
if [ -f ~/.alias ]; then
    . ~/.alias
fi

. $HOME/.asdf/asdf.sh
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gui1612/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gui1612/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gui1612/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gui1612/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
