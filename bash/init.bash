#!/bin/bash

# The ever-changing preferred editor
[ -z "$EDITOR" ] && export EDITOR='nvim'

parts=(
  colors
  prompt
  functions
  paths
)

_dir="$(CDPATH= cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
for part in ${parts[@]}; do
  source "$_dir/$part.bash"
done

export LC_COLLATE='C'
