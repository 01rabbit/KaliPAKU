#!/bin/bash

function say-hello () {
  echo "Hello, world!"
}

set -o emacs
bind -x '"\t":"say-hello"'

read -ep ">>> " line