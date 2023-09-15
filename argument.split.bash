#!/bin/bash

SYNOPSIS=<<EOD
'scriptname --arg1 --arg2 'some' 'opts' 'values' --arg3 -arg..  INPUT' 
EOD

INPUT="${@: -1}"

i=0; while (( i++ < ($# - 1))) # last argument in cli is file or directory $INPUT
do
  if [[ ${@:i:1} =~ ^-- ]]; then
  ((start=i)); ((end=1)); ((j++))
  eval 'opts'$j='("${@:start:end}")'
  else 
  eval 'opts'$j'=("${@:start:++end}")'
  fi
done

while (( j > 0 ))
do 
eval 'opt=("${opts'$j'[@]}"); ((j--)); i=0; arg=""'

  if   [[ "$opt" = '--arg-1' ]] ; then while [[ ! -z "${opt[++i]}" ]]; do arg+="^${opt[i]}$|"; done; __ARG_1="${arg%|}"
  elif [[ "$opt" = '--arg-2' ]] ; then while [[ ! -z "${opt[++i]}" ]]; do arg+="${opt[i]}|"; done; __ARG_2="${arg%|}"
  elif [[ "$opt" = '--arg-3' ]] ; then while [[ ! -z "${opt[++i]}" ]]; do arg+="${opt[i]}|"; done; __ARG_3="${arg%|}"
  elif [[ "$opt" = '--arg-4' ]] ; then __ARG_4='1'; 
#  else echo "$USAGE"; break
  fi
done

echo "$__ARG_1"
echo "$__ARG_2"
echo "$__ARG_3"
echo "$__ARG_4"


