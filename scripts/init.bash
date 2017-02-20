#!/bin/bash

# The ever-changing preferred editor
[ -z "$EDITOR" ] && export EDITOR='nvim'

_dir="$(CDPATH= cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source "$_dir/colors.bash"
source "$_dir/prompt.bash"

# Aliases
alias ls="ls -h --color=auto"
alias temon="watch -d -t -n1 sensors"

export LC_COLLATE='C'

function plon { export POWERLINE_FONTS=true; }
function ploff { export POWERLINE_FONTS=; }
if [ -z "${POWERLINE_FONTS+x}" ]; then
  case "$TERM" in
    *-256color) plon ;;
  esac
fi

[ -d "/media/soft/apps/android-sdk-linux" ] \
    && export ANDROID_HOME="/media/soft/apps/android-sdk-linux" \
    && export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Enable user bin dir
[ -d "$HOME/.npm-global" ] && export PATH="$HOME/.npm-global/bin:$PATH"
[ -d "$HOME/bin/scripts" ] && export PATH="$HOME/bin/scripts:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"

# Node binaries in the current directory should also be accessible
export PATH="./node_modules/.bin:$PATH"

# Go stuff
export GOPATH="$HOME/go"
[ -n "$GOPATH" -a -d "$GOPATH/bin" ] && export PATH="$PATH:$GOPATH/bin"
#export GOROOT="$GOPATH/go"
[ -n "$GOROOT" -a -d "$GOROOT" ] && export PATH="$PATH:$GOROOT/bin"

# Luarocks
command -v luarocks >/dev/null 2>&1 && eval $(luarocks path)

# Quick cd with pdir (deprecated)
#function cdp () {
#  cd `pdir --absolute-path "$@"`
#}
function gi() { IFS=,; curl -L -s "https://www.gitignore.io/api/$*"; }

function reinit { source ~/bin/scripts/init.bash; }
