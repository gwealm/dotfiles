# .bashrc

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

. "$HOME/.asdf/asdf.sh"

# Alias definitions
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
. "$HOME/.cargo/env"
