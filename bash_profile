# .bash_profile

export GEM_HOME=~/.ruby
export PATH=$HOME/src/git-scripts:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/.ruby/bin:$PATH
export PATH_SET=1
export XAUTHORITY=~/.Xauthority

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

[[ -f ${HOME}/bin/git-prompt.sh ]] && . ${HOME}/bin/git-prompt.sh

# interactive vs. non-interactive
if [[ $- = *i* ]]
then
    #Disable Ctrl-S
    stty ixany
    stty ixoff -ixon
else
    return
fi

test -f ~/.bashrc && source ~/.bashrc
