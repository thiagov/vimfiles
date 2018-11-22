#!/bin/bash

SUBMODULES=`echo $(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')`

javaSupport=false
typescriptSupport=false
commandTSupport=false
for var in "$@"; do
  if [ "$var" = "complete" ]; then
    javaSupport=true
    typescriptSupport=true
    commandTSupport=true
  elif [ "$var" = "javaSupport" ]; then
    javaSupport=true
  elif [ "$var" = "commandTSupport" ]; then
    commandTSupport=true
  elif [ "$var" = "typescriptSupport" ]; then
    typescriptSupport=true
  fi
done

for module in $SUBMODULES; do
  if [ "$module" = "bundle/vim-javacomplete2" ] && [ $javaSupport = false ]; then
    continue
  fi
  if [ "$module" = "bundle/command-t" ] && [ $commandTSupport = false ]; then
    continue
  fi
  if [ "$module" = "bundle/tsuquyomi" ] && [ $typescriptSupport = false ]; then
    continue
  fi
  echo "$module"
  echo $(git submodule update --init "$module")
done
