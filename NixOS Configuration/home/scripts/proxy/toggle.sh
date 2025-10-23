#!/usr/bin/env bash
set -euo pipefail

SCRIPTS_DIR="$HOME/.local/scripts/proxy"

TEMPLATE="$SCRIPTS_DIR/template.conf"
SYMLINK="${XDG_CONFIG_HOME:-$HOME/.config}/environment.d/99-proxy.conf"

if [ ! -f "$TEMPLATE" ]; then
  echo "Error: template not found at $TEMPLATE" >&2
  exit 1
fi

# Toggle
if [ -L "$SYMLINK" ] || [ -f "$SYMLINK" ]; then
  # OFF
  rm -f "$SYMLINK"
  systemctl --user unset-environment http_proxy https_proxy all_proxy no_proxy
  echo "off"
else
  # ON
  mkdir -p "$(dirname "$SYMLINK")"
  ln -sf "$TEMPLATE" "$SYMLINK"
  # Load into current systemd user session
  export $(grep -v '^[[:space:]]*#' "$TEMPLATE" | xargs)
  systemctl --user import-environment http_proxy https_proxy all_proxy no_proxy
  unset http_proxy https_proxy all_proxy no_proxy
  echo "on"
fi

# Refresh Waybar
pkill -SIGRTMIN+10 waybar 2>/dev/null || true