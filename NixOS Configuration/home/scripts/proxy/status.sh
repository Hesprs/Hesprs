#!/usr/bin/env bash

SYMLINK="${XDG_CONFIG_HOME:-$HOME/.config}/environment.d/99-proxy.conf"

if [ -L "$SYMLINK" ] && [ -f "$SYMLINK" ]; then
  echo ""   # ON icon
else
  echo ""   # OFF icon
fi