#!/bin/bash
export DEST="./.exvim.docker"
export TOOLS="/Users/joshtrick/.vim/tools/"
export TMP="${DEST}/_ID"
export TARGET="${DEST}/ID"
sh ${TOOLS}/shell/bash/update-idutils.sh
