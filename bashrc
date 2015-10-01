# Enable tab completion
source ~/git-completion.bash

# Set relative line numbers
# set relativenumber

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;36m\]"
red="\[\033[1;31m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$red\u$green\$(__git_ps1)$blue \W $ $reset"
# export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH
# export M2_HOME="/usr/local/Cellar/maven/3.2.5/libexec"
export PATH=$M2_HOME/bin:$PATH

export PATH=$GOPATH/bin:$PATH

export EDITOR=nvim
export GO15VENDOREXPERIMENT=1
alias ll='ls -la'
alias vim=nvim
alias ..='cd ..'


# function vim { nvim "$1"; }
# export -f vim
