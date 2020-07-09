# .bashrc

shopt -s checkwinsize
shopt -s histappend

export PS1_BLACK="$(tput bold)$(tput setaf 0)"
export PS1_RED="$(tput bold)$(tput setaf 1)"
export PS1_GREEN="$(tput bold)$(tput setaf 2)"
export PS1_YELLOW="$(tput bold)$(tput setaf 3)"
export PS1_BLUE="$(tput bold)$(tput setaf 4)"
export PS1_MAGENTA="$(tput bold)$(tput setaf 5)"
export PS1_CYAN="$(tput bold)$(tput setaf 6)"
export PS1_WHITE="$(tput bold)$(tput setaf 7)"
export PS1_RESET=$(tput sgr0)
export PS1_GIT='$(__git_ps1 "[\[$PS1_RED\]%s\[$PS1_RESET\]]")'
export PS1_PWD='\w'
export PS1="\n$PS1_GIT[\[$PS1_GREEN\]scottyp\[$PS1_WHITE\]@\[$PS1_YELLOW\]\h\[$PS1_WHITE\]:\[$PS1_CYAN\]$PS1_PWD\[$PS1_RESET\]]\n\$ "

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias cmus_clear="rm -r /home/scottyp/.config/cmus"
alias ctags="ctags -R --exclude=build --exclude=dist --exclude=lib"
alias grep="grep --color=auto"
alias jsonlint="python3 -m json.tool"
alias lisp="rlwrap sbcl"
alias list_mouse="xinput list"
alias ls="ls --color=auto"
alias mkdir="mkdir -pv"
alias more="less"
alias open="xdg-open"
alias path="echo ${PATH} | tr -s ':' '\n'"
alias pianobar='/usr/bin/pianobar | tee -a $HOME/songs.txt'
alias remap_mouse="xinput set-button-map 10 1 3 2 4 5"
alias scm="cd ~/scm"
alias snes="/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=snes9x-gtk --file-forwarding com.snes9x.Snes9x @@ %F @@"
alias src="cd ~/src"
alias test_mouse="xinput test 10"
alias unhash="hash -d"
alias uuid="uuidgen"
alias veiw='vim -XR'
alias vi='vim -X'
alias view='vim -XR'
alias vimdiff="vimdiff -c 'set diffopt+=iwhite'"
alias which='type'
alias xargs='xargs '
alias youtube='mpsyt'

v() { t=${2:-java}; vim $(find $1 -type f -name "*.${t}"); };

topng()
{
    if [[ $# != 1 ]]
    then
        echo "Usage: topng <input_file>"
        return
    fi
    pdftoppm -png $1 > $1.png
    echo "$1.png written"
}

a()
{
    ant -quiet "$@" -find build.xml
}

cdd()
{
    cd $(dirname $1)
}

dc()
{
    for ((i=0; i<${#1}; i++))
    {
        cd ..
    }
}

sum_retire_analysis()
{
    if [[ "$#" != 1 ]]
    then
        echo "Usage $0 input_file"
    else
        if [[ -f $1 ]]
        then
            cat "$1" | awk '{a[$1"\t"$2"\t"$3]+=$4}END{for(name in a)print name "\t" a[name]}' | sort | column -t
        else
            echo "$1 is not a file"
        fi
    fi
}

function createusr
{
    if [[ $# -ne 1 ]]
    then
        echo "Need username"
    else
        d=~/.certauthority
        mkdir ${d}/newcerts/${1}
        openssl req -config ${d}/config.cnf -newkey rsa:2048 -keyout ${d}/newcerts/${1}/${1}.key -out ${d}/newcerts/${1}/${1}.req
    fi
}

function signusr
{
    if [[ $# -ne 1 ]]
    then
        echo "Need username"
    else
        d=~/.certauthority
        ( cd ~ && openssl ca -config ${d}/config.cnf -out ${d}/newcerts/${1}/${1}.crt -infiles ${d}/newcerts/${1}/${1}.req )
    fi
}

convertpfx()
{
    if [[ $# -ne 1 ]]
    then
        echo "Need username"
    else
        d=~/.certauthority
        e=${d}/newcerts/${1}
        ( cd ~ && openssl pkcs12 -export -out ${e}/${1}.pfx -inkey ${e}/${1}.key -in ${e}/${1}.crt -certfile ${d}/ca.cert.pem )
    fi
}

getbpm()
{
    sox $1 -r 44100 -e float -c 1 -t raw - 2>/dev/null | bpm
}

function gpgtest
{
  gpg -o /dev/null -d $@ 2>/dev/null && echo "Success"
}
