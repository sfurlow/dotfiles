# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/src/git-scripts:$PATH"

HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=10000
HISTFILESIZE=2000

export EDITOR=vim

shopt -s histappend # append to the history file, don't overwrite it

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

fi

# some more ls aliases
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias vi='vim -X'
alias which=type
#alias pip=pip3
alias starttomcat="systemctl start tomcat8"
alias stoptomcat="systemctl stop tomcat8"
alias restarttomcat="systemctl restart tomcat8"
#alias python=python3
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias more="less"
alias src="cd ~/src"
alias scm="cd ~/scm"
alias ghc="stack ghc"
alias ghci="stack ghci"
alias gt="gnupod-tools"
alias gnupod_search="gnupod_search -m /media/scottyp/BEARS\!/"
alias gnupod_addsong="gnupod_search -m /media/scottyp/BEARS\!/"
alias gnupod_unplug='mktunes -m /media/scottyp/BEARS\!/ && umount /media/scottyp/BEARS\!/'
alias lynx="lynx -cfg=/home/scottyp/lynx.cfg"
alias open="xdg-open"

function dc
{
  if [[ $# != 1 ]]
  then
    echo "Usage: dc <characters>
    Will move up a directory for every character type"
    return
  fi
  local temp
  temp="$1"
  for i in 1 $(seq 1  $((${#temp}-1)))
  do
    cd ..
  done
}
