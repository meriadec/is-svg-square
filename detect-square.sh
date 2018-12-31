#!/bin/env bash

# exit on error
set -eo pipefail

find svgs -name "*.svg" | while read -r f; do

  IS_SQUARE=0

  SIZE=$(sed -E 's/.*viewBox="0 0 (.*) .*".*/\1/g' "$f")
  if grep "0 0 $SIZE $SIZE" "$f" &>/dev/null ; then
    IS_SQUARE=1
  fi

  echo "$f: IS_SQUARE: $IS_SQUARE"
done
