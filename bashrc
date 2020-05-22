# .bashrc

# interactive vs. non-interactive
if [[ $- = *i* ]]
then
    #Disable Ctrl-S
    stty ixany
    stty ixoff -ixon
else
    return
fi

export PATH=$HOME/src/git-scripts:$PATH
export PATH=/opt/maven/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH
#export CDPATH=":./:~/src/"
export PATH_SET=1
#export DISPLAY=:0.0
export XAUTHORITY=~/.Xauthority

shopt -s checkwinsize
shopt -s histappend

export SHELL=/bin/bash
export INPUTRC=$HOME/.inputrc
export GIT_PAGER=less
export PAGE=less

export EDITOR=vim
export LESS="-XFR"
export LS_COLORS="di=31:ln=36:pi=34:so=33:bd=1;33:cd=1;35:ex=32"
export HISTFILESIZE=50000
export HISTTIMEFORMAT="%F%T "
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export TZ=GMT
export TERM=xterm-256color
export XMLLINT_INDENT="    "
export WORKON=~/Envs
source $HOME/.local/bin/virtualenvwrapper.sh

#[[ -f <path-to-git-completion.bash]] && . <path-to-git-completion.bash
#[[ -f <path-to-git-prompt.sh]] && . <path-to-git-prompt.sh

# The \[ ... \]sequence in PS1 prevents non-printable characters from being counted in the prompt length, which determines when to wrap lines
[[ -f ${HOME}/bin/git-prompt.sh ]] && . ${HOME}/bin/git-prompt.sh

export PS1_BLACK="$(tput bold)$(tput setaf 0)"
export PS1_RED="$(tput bold)$(tput setaf 1)"
export PS1_GREEN="$(tput bold)$(tput setaf 2)"
export PS1_YELLOW="$(tput bold)$(tput setaf 3)"
export PS1_BLUE="$(tput bold)$(tput setaf 4)"
export PS1_MAGENTA="$(tput bold)$(tput setaf 5)"
export PS1_CYAN="$(tput bold)$(tput setaf 6)"
export PS1_WHITE="$(tput bold)$(tput setaf 7)"
export PS1_RESET=$(tput sgr0)
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWCOLORHINTS=1
export PS1_GIT='$(__git_ps1 "[\[$PS1_RED\]%s\[$PS1_RESET\]]")'
export PS1_PWD='\w'
if [[ $CLEARCASE_ROOT ]]
then
    export PS1_CURRENT_VIEW='[\[$PS1_GREEN\]$(basename $CLEARCASE_ROOT)\[$PS1_RESET\]]'
fi
export PS1="\n$PS1_CURRENT_VIEW$PS1_GIT[\[$PS1_GREEN\]scottyp\[$PS1_WHITE\]@\[$PS1_YELLOW\]\h\[$PS1_WHITE\]:\[$PS1_CYAN\]$PS1_PWD\[$PS1_RESET\]]\n\$ "

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[[ -f $HOME/.aliases || -L $HOME/.aliases ]] && . $HOME/.aliases
[[ -f $HOME/.functions || -L $HOME/.functions ]] && . $HOME/.functions

v() { t=${2:-java}; vim $(find $1 -type f -name "*.${t}"); };

alias snes="/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=snes9x-gtk --file-forwarding com.snes9x.Snes9x @@ %F @@"
alias lisp="rlwrap sbcl"
