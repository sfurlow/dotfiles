# .bashrc

if [[ -z $PATH_SET ]]
then
    export PATH=~/.local/bin:$PATH
    export PATH=$HOME/src/git-scripts:$PATH
    export PATH_SET=1
fi


export SHELL=/bin/bash
export INPUTRC=$HOME/.inputrc
export GIT_PAGER=less
export PAGE=less

export EDITOR=vim
export LESS="-XFR"
export LS_COLORS="di=31:ln=36:pi=34:so=33:bd=1;33:cd=1;35:ex=32"
export HISTFILESIZE=50000
export TZ=GMT
export TERM=xterm-256color
export XMLLINT_INDENT="    "

#[[ -f <path-to-git-completion.bash]] && . <path-to-git-completion.bash
#[[ -f <path-to-git-prompt.sh]] && . <path-to-git-prompt.sh

# The \[ ... \]sequence in PS1 prevents non-printable characters from being counted in the prompt length, which determines when to wrap lines
export PS1_BLACK="$(tput bold)$(tput setaf 0)"
export PS1_RED="$(tput bold)$(tput setaf 1)"
export PS1_GREEN="$(tput bold)$(tput setaf 2)"
export PS1_YELLOW="$(tput bold)$(tput setaf 3)"
export PS1_BLUE="$(tput bold)$(tput setaf 4)"
export PS1_MAGENTA="$(tput bold)$(tput setaf 5)"
export PS1_CYAN="$(tput bold)$(tput setaf 6)"
export PS1_WHITE="$(tput bold)$(tput setaf 7)"
export PS1_RESET=$(tput sgr0)
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export PS1_GIT='$(__git_ps1 "[\[$PS1_RED\]%s\[$PS1_RESET\]]")'
export PS1_PWD='\w'
if [[ $CLEARCASE_ROOT ]]
then
    export PS1_CURRENT_VIEW='[\[$PS1_GREEN\]$(basename $CLEARCASE_ROOT)\[$PS1_RESET\]]'
fi
export PS1="\n$PS1_CURRENT_VIEW$PS1_GIT[\[$PS1_GREEN\]scottyp\[$PS1_WHITE\]@\[$PS1_YELLOW\]\h\[$PS1_WHITE\]:\[$PS1_CYAN\]$PS1_PWD\[$PS1_RESET\]]\n\$ "

# interactive vs. non-interactive
if [[ $- = *i* ]]
then
    #Disable Ctrl-S
    stty ixany
    stty ixoff -ixon
fi

[[ -f $HOME/.aliases || -L $HOME/.aliases ]] && . $HOME/.aliases
[[ -f $HOME/.functions || -L $HOME/.functions ]] && . $HOME/.functions
