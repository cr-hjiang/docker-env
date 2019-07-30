#!/bin/bash
export DEST="./.exvim.docker"
export TOOLS="/Users/joshtrick/.vim/tools/"
export TMP="${DEST}/_symbols"
export TARGET="${DEST}/symbols"
sh ${TOOLS}/shell/bash/update-symbols.sh
