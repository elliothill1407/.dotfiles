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

echo "→ Generating SSH key..."
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -C "elliothill1407@gmail.com" -f "$HOME/.ssh/id_ed25519" -N ""
  eval "$(ssh-agent -s)"
  ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519"
  echo ""
  echo "  ┌─────────────────────────────────────────────────────┐"
  echo "  │  Add this public key to GitHub before continuing:   │"
  echo "  │  https://github.com/settings/ssh/new                │"
  echo "  └─────────────────────────────────────────────────────┘"
  echo ""
  cat "$HOME/.ssh/id_ed25519.pub"
  echo ""
  read -p "  Press enter once you've added the key to GitHub..."
else
  echo "  SSH key already exists, skipping."
fi

echo "→ Stowing dotfiles..."
cd "$HOME/.dotfiles"
stow alacritty git ssh starship tmux zsh

echo "→ Adding nvim config as submodule (if not already)..."
if [ ! -d "$HOME/.config/nvim/.git" ]; then
  echo "  Skipping — add your nvim repo manually: git submodule add <repo> nvim/.config/nvim"
fi

echo "✓ Done! Restart your shell."
