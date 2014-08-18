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
