# -----------------------------------------------
# Environment
# -----------------------------------------------

source ~/git-prompt.sh
source ~/git-completion.bash
export EDITOR=vim
# experimental go vendor
export GO15VENDOREXPERIMENT=1
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# -----------------------------------------------
# Prompt
# -----------------------------------------------

green="\[\033[0;32m\]"
blue="\[\033[0;36m\]"
red="\[\033[1;31m\]"
reset="\[\033[0m\]"
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$red\u$green\$(__git_ps1)$blue \W $ $reset"

# -----------------------------------------------
# Path
# -----------------------------------------------

export PATH=$JAVA_HOME/bin:$PATH
export PATH=$M2_HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# -----------------------------------------------
# Alias
# -----------------------------------------------

alias ll='ls -la'
alias vim=nvim
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias x=exit
alias c=clear
# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# -----------------------------------------------
#  User-defined Functions
# -----------------------------------------------

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}

# Usage: smartextract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
smartextract() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1        ;;
            *.tar.gz)   tar -zxvf $1        ;;
            *.bz2)      bunzip2 $1          ;;
            *.dmg)      hdiutil mount $1    ;;
            *.gz)       gunzip $1           ;;
            *.tar)      tar -xvf $1         ;;
            *.tbz2)     tar -jxvf $1        ;;
            *.tgz)      tar -zxvf $1        ;;
            *.zip)      unzip $1            ;;
            *.Z)        uncompress $1       ;;
            *)          echo "'$1' cannot be extracted/mounted via smartextract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -----------------------------------------------
#  END
# -----------------------------------------------
