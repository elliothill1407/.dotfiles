#!/bin/bash
set -e

echo "→ Installing Homebrew packages..."
brew bundle --file="$HOME/.dotfiles/brew/Brewfile"

echo "→ Setting up fzf shell integration..."
"$(brew --prefix)/opt/fzf/install" --all --no-update-rc

echo "→ Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "  Already installed, skipping."
fi

echo "→ Stowing dotfiles..."
cd "$HOME/.dotfiles"
stow alacritty git ssh starship tmux zsh

echo "→ Adding nvim config as submodule (if not already)..."
if [ ! -d "$HOME/.config/nvim/.git" ]; then
  echo "  Skipping — add your nvim repo manually: git submodule add <repo> nvim/.config/nvim"
fi

echo "✓ Done! Restart your shell."
