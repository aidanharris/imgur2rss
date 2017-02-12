#!/bin/sh
SCRIPT_DIR="$(dirname "$0")"
CLI="$SCRIPT_DIR/cli.js"

if [ "$(which nodejs 2>/dev/null)" != "" ]
then
  NODE="nodejs"
fi

if [ "$(which node 2>/dev/null)" != "" ] && [ -z "$NODE" ]
then
  NODE="node"
else
  if [ -z "$NODE" ]
  then
    echo "Nodejs is not installed, please install it!"
    exit 1
  fi
fi

env "$NODE" "$CLI" "$@" | sed '1 s/^.*$/<?xml version="1.0" encoding="UTF-8"?><rss version="2.0" xmlns:media="http:\/\/search.yahoo.com\/mrss\/">/'
