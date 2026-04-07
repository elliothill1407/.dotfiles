#!/bin/bash

PASS=0
FAIL=0

check() {
  local label="$1"
  local path="$2"
  if [ -L "$path" ]; then
    echo "  ✓ $label → $(readlink "$path")"
    ((PASS++))
  elif [ -e "$path" ]; then
    echo "  ✗ $label exists but is NOT a symlink (stow may not have run)"
    ((FAIL++))
  else
    echo "  ✗ $label missing"
    ((FAIL++))
  fi
}

echo "Checking symlinks..."
check ".zshrc"                   "$HOME/.zshrc"
check ".gitconfig"               "$HOME/.gitconfig"
check ".gitignore_global"        "$HOME/.gitignore_global"
check ".ssh/config"              "$HOME/.ssh/config"
check "alacritty.toml"           "$HOME/.config/alacritty/alacritty.toml"
check "tmux.conf"                "$HOME/.config/tmux/tmux.conf"
check "starship.toml"            "$HOME/.config/starship.toml"

echo ""
echo "Checking tools..."
for tool in nvim zoxide fzf starship stow brew gh lazygit tmux eza bat; do
  if command -v "$tool" &>/dev/null; then
    echo "  ✓ $tool"
    ((PASS++))
  else
    echo "  ✗ $tool not found"
    ((FAIL++))
  fi
done

echo ""
echo "Results: $PASS passed, $FAIL failed"
[ "$FAIL" -eq 0 ] && exit 0 || exit 1
