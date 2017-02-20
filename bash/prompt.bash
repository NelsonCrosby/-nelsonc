if [ -n "${debian_chroot+_}" ]; then
  export CHROOT="$debian_chroot"
fi
if [ -n "${CHROOT+_}" ]; then
  export SHELL_CTX="$CHROOT/$SHELL_CTX"
fi

# Custom shell prompt
# [  0] II:MM:SS user @ computer (context)
#   : VAR=value
#   : ~/dir (master)
#   $ _
function __prompt_command {
  local last_exit="$?"

  local TITLE="\[\e]2;\u @ \h\007\]"

  PS1="${TITLE}\n"

  # Useful escape codes
  local reset="\[$(_ftc reset)\]"
  local green="\[$(_ftc bold fggrn)\]"
  local blue="\[$(_ftc bold fgblu)\]"
  local red="\[$(_ftc bold fgred)\]"
  local magenta="\[$(_ftc bold fgmag)\]"
  local grey="\[$(_ftc bold fgblk)\]"

  # Last exit code
  if [ "$last_exit" -gt "0" ]; then
    PS1+="${red}"
    if [ "$last_exit" -lt "10" ]; then
      PS1+="[  ${last_exit}]"
    elif [ "$last_exit" -lt "100" ]; then
      PS1+="[ ${last_exit}]"
    else
      PS1+="[${last_exit}]"
    fi
  else
    PS1+="${grey}[  0]"
  fi
  PS1+="${reset}"

  declare -A extra
  if [ -n "${VIRTUAL_ENV+_}" ]; then
    local relenv="$(realpath --relative-to=. "$VIRTUAL_ENV")"
    extra[VIRTUAL_ENV]="${relenv}"
  fi

  local extras=()
  for k in "${!extra[@]}"; do
    extras+=("$(_tc256f 166)${k}$(_tc256f 8)=$(_tc256f 220)${extra[$k]}${reset}")
  done

  if [ -n "$SHORTPROMPT" ]; then
    # Shorten the prompt by only showing the cwd name and context
    PS1+="${SHELL_CTX+ $magenta($SHELL_CTX)$reset} ${blue}\W${reset} \$ "
  else
    # Longer prompt: show time, login info and directory
    PS1+=" ${grey}\T${reset} "
    PS1+="${green}\u${reset} @ ${green}\h${reset}"
    PS1+="${SHELL_CTX+ $magenta($SHELL_CTX)$reset}\n"
    if [ "${#extras[@]}" -gt 0 ]; then
      PS1+="  : ${extras[@]}\n"
    fi
    PS1+="  : ${blue}\w${reset}"
    # If inside a git repo, show current HEAD
    PS1+="${magenta}$(__git_ps1)${reset}"
    # Final prompt
    PS1+="\n  \$ "
  fi
}

# Toggle between long and short prompts
function short {
  if [ -z "$SHORTPROMPT" ]
  then export SHORTPROMPT=true
  else export SHORTPROMPT=
  fi
}

export PROMPT_COMMAND=__prompt_command
alias long=short
