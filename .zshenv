#!/usr/bin/zsh 
  
 [ -e "$HOME/.profile" ] && source "$HOME/.profile" 
 [ -e "$ASDF_DIR/plugins/java/set-java-home.zsh" ] && source "$ASDF_DIR/plugins/java/set-java-home.zsh"
 [ -e "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
