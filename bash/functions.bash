
# Aliases
alias ls="ls -h --color=auto"
alias temon="watch -d -t -n1 sensors"

# Toggle powerline fonts for nvim
function plon { export POWERLINE_FONTS=true; }
function ploff { export POWERLINE_FONTS=; }
if [ -z "${POWERLINE_FONTS+x}" ]; then
  case "$TERM" in
    *-256color) plon ;;
  esac
fi

function gi { IFS=,; curl -L -s "https://www.gitignore.io/api/$*"; }

function reinit { source ~/.bashrc; }
