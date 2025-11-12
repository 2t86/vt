#!/usr/bin/env bash

update=0

while getopts u opt; do
    if [[ "$opt" == 'u' ]]; then
        update=1
    fi
done

filepaths=($(git ls-files .config bin))

copy() {
    local src="$1" dest="$2"
    perm=$(stat -c%a "$src")
    install -Dv -m"$perm" "$src" "$dest"
}


if (( update )); then
    for filepath in "${filepaths[@]}"; do
        src="$HOME/$filepath" dest="$filepath"
        copy "$src" "$dest"
    done
else
    for filepath in "${filepaths[@]}"; do
        src="$filepath" dest="$HOME/$filepath"
        copy "$src" "$dest"
    done
fi
