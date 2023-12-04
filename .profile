export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"

source $HOME/.cargo/env

if [ -f $HOME/.asdf/asdf.sh ]; then 
   source $HOME/.asdf/asdf.sh 
  
   [ -d "$(asdf where flutter)" ] && export FLUTTER_ROOT="$(asdf where flutter)" 
   [ -d "$(asdf where golang)" ] && export GOROOT="$(asdf where golang)/go" 
   [ -d "$(asdf where java)" ] && export JAVA_HOME="$(asdf where java)" 
fi 
