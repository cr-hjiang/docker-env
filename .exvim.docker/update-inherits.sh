#!/bin/bash
export DEST="./.exvim.docker"
export TOOLS="/Users/joshtrick/.vim/tools/"
export TMP="${DEST}/_inherits"
export TARGET="${DEST}/inherits"
sh ${TOOLS}/shell/bash/update-inherits.sh
