#!/bin/bash

# Map function

# Arguments:
# 1 - map function
# 2.. - values to map over

# Returns:
# mapped values

function map() {
  declare -a res

  for (( i=0; i<$(($# - 1)); i++ )); do
    n=$((i+2))
    x=${!n}
    res[i]="`$1 $x`"
  done

  echo ${res[@]}
}

function inc() {
  echo $(($1 + 1))
}

map inc 0 1 2 3 4 5
#echo $res
#a=(1 2 3 4 5)
#echo "${a[@]}"
#echo ${res[@]}
