#!/bin/bash

inputs="forgefed forgefed-vocabulary"

render () {
    dir="$1"
    file="$2"
    if [ "$3" == "true" ]; then
        toc="--table-of-contents"
    else
        toc=""
    fi
    pandoc $dir/$file.md \
        --from markdown \
        --to html \
        --template html/template.html \
        $toc \
        --output html/$file.html
        # --highlight-style=STYLE \
        # --number-sections \
}

render html index "false"

for file in $inputs; do
    render specification $file "true"
done
