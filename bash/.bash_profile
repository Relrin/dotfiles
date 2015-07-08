# add bash completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# set default editors
export EDITOR=mvim
export GIT_EDITOR=vim

# set custom prompt
RELRIN_DEFAULT_COLOR="[00m"
RELRIN_GRAY_COLOR="[37m"
RELRIN_PINK_COLOR="[35m"
RELRIN_GREEN_COLOR="[32m"
RELRIN_ORANGE_COLOR="[33m"
RELRIN_RED_COLOR="[31m"
if [ `id -u` == '0' ]; then
  RELRIN_USER_COLOR=$RELRIN_RED_COLOR
else
  RELRIN_USER_COLOR=$RELRIN_PINK_COLOR
fi

RELRIN_VC_PROMPT=$' on \033[34m%n\033[00m:\033[00m%b\033[32m'
RELRIN_VC_PROMPT_EX="$RELRIN_VC_PROMPT%m%u"

mitsuhikos_vcprompt() {
  path=`pwd`
  prompt="$RELRIN_VC_PROMPT"
  if [[ "$path" != /Users/relrin/code/* ]]; then
    prompt="$RELRIN_VC_PROMPT_EX"
  fi
  vcprompt -f "$prompt"
}

mitsuhikos_lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37m exited \033[31m'
    echo -n $code
    echo -n $'\033[37m'
  fi
}

mitsuhikos_backgroundjobs() {
  jobs|python -c 'if 1:
    import sys
    items = ["\033[36m%s\033[37m" % x.split()[2]
             for x in sys.stdin.read().splitlines()]
    if items:
      if len(items) > 2:
        string = "%s, and %s" % (", ".join(items[:-1]), items[-1])
      else:
        string = ", ".join(items)
      print("\033[37m running %s" % string)
  '
}

mitsuhikos_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    if [[ $VIRTUAL_ENV == *.virtualenvs/* ]]; then
      ENV_NAME=`basename "${VIRTUAL_ENV}"`
    else
      folder=`dirname "${VIRTUAL_ENV}"`
      ENV_NAME=`basename "$folder"`
    fi
    echo -n $' \033[37mworkon \033[31m'
    echo -n $ENV_NAME
    echo -n $'\033[00m'
    # Shell title
    echo -n $'\033]0;venv:'
    echo -n $ENV_NAME
    echo -n $'\007'
  fi
}

export RELRIN_BASEPROMPT='\e]0;\007\n\e${RELRIN_USER_COLOR}\u \
\e${RELRIN_GRAY_COLOR}at \e${RELRIN_ORANGE_COLOR}\h \
\e${RELRIN_GRAY_COLOR}in \e${RELRIN_GREEN_COLOR}\w\
`mitsuhikos_lastcommandfailed`\
\e${RELRIN_GRAY_COLOR}`mitsuhikos_vcprompt`\
`mitsuhikos_backgroundjobs`\
`mitsuhikos_virtualenv`\
\e${RELRIN_DEFAULT_COLOR}'
export PS1="\[\033[G\]${RELRIN_BASEPROMPT} \n=> "

# enable colored terminal
export TERM=xterm-256color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
if [ `uname` == "Darwin" ]; then
  export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
  export LC_CTYPE=en_US.utf-8
  export LC_ALL=en_US.utf-8
else
  alias ls='ls --color=auto'
fi

# for homebrew
export PATH=/usr/local/bin:$PATH

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# don't let virtualenv show prompts by itself
VIRTUAL_ENV_DISABLE_PROMPT=1

# Rust lang: racer autocomplete settings
export RUST_SRC_PATH=$HOME/rust/src

# flags for some Python librarires
ARCHFLAGS="-arch i386 -arch x86_64"
PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/

# user aliases
alias ..='cd ..'

# Docker preferences
DOCKER_HOST=tcp://192.168.59.103:2376
DOCKER_CERT_PATH=/Users/savicvalera/.boot2docker/certs/boot2docker-vm
DOCKER_TLS_VERIFY=1

# Make sure window sizes update correctly.
shopt -s checkwinsize
