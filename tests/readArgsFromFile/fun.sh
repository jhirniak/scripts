#!/bin/bash

funN=1

function f0() {
  dir="$(dirname "$0")"
  script="$dir/../../readArgsFromFile.sh"
  echo $script
}
