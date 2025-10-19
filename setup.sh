set -euo pipefail
CURRENT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo rm "/etc/nixos"
sudo ln -s "$CURRENT/NixOS Configuration" "/etc/nixos"

rm "$HOME/.config/VSCodium/User/settings.json"
ln -s "$CURRENT/VSCode Configuration/settings.json" "$HOME/.config/VSCodium/User/settings.json"

rm "$HOME/.config/VSCodium/User/keybindings.json"
ln -s "$CURRENT/VSCode Configuration/keybindings.json" "$HOME/.config/VSCodium/User/keybindings.json"