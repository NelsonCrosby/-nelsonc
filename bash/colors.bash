# This is free and unencumbered software released into the public domain.
# For more information, please refer to <http://unlicense.org/>

# Utilities for colors.
# Should be `source`d into your bash script.

_ffg=38
_fbg=48
_f24c=2
_f256c=5

_freset=0
_fbold=1
_ful=4
_fnoul=24

_ffgblk=30
_ffgred=31
_ffggrn=32
_ffgylw=33
_ffgblu=34
_ffgmag=35
_ffgcya=36
_ffgwht=37
_fbgblk=40
_fbgred=41
_fbggrn=42
_fbgylw=43
_fbgblu=44
_fbgmag=45
_fbgcya=46
_fbgwht=47

_tc () { local IFS=';'; echo -e "\e[$*m"; }
_ftc () {
  local fmt=("$@") arg='' var=''
  for i in "${!fmt[@]}"; do
    arg="fmt[$i]"
    if ! [[ '^[0-9]+$' =~ "${!arg}" ]]; then
      var="_f${!arg}"
      fmt[$i]="${!var}"
    fi
  done
  _tc "${fmt[@]}"
}

alias \
  _tc24f="_tc $_ffg $_f24c" \
  _tc24b="_tc $_fbg $_f24c" \
  _tc256f="_tc $_ffg $_f256c" \
  _tc256b="_tc $_fbg $_f256c" \
  _ftc24f='_ftc fg 24c' \
  _ftc24b='_ftc bg 24c' \
  _ftc256f='_ftc fg 256c' \
  _ftc256b='_ftc bg 256c'
