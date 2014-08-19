#!/usr/bin/env bash

dir="$(dirname "$(readlink -f "$0")")"

while read -r url node attr params all; do
  echo "Params: $params"
  "$dir/getURL.sh" "$url" "$node" "$attr" "$params" "$all"
done < "$1"
