# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/home/gui1612/.oh-my-zsh"
export ZPLUG_HOME=$HOME/.zplug
export PATH="$HOME/bin:$PATH"

source $ZPLUG_HOME/init.zsh

# Rustup completion
fpath+=~/.zfunc

# Tab complete
autoload -U compinit && compinit


zplug clear
#################################################################################
# Packages
#
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
#zplug "history-substring-search"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Autocomplete options

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# COMPLETION_WAITING_DOTS="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    colored-man-pages
    history-substring-search
    zsh-z
    sudo
    vscode
    git
    npm
    asdf
)


source $ZSH/oh-my-zsh.sh

# Alias definitions
source ~/.alias

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

###########################################################

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"
export PATH=/opt/firefox/firefox:$PATH
export PATH=$HOME/.dotnet/tools:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export JEKYLL_GITHUB_TOKEN=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
export SSL_CERT_FILE=$HOME/Documents/cacert.pem


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. $HOME/.asdf/asdf.sh
