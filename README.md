# .dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

| Directory   | Config                        |
|-------------|-------------------------------|
| `alacritty` | Alacritty terminal            |
| `git`       | `.gitconfig`, `.gitignore_global` |
| `ssh`       | `.ssh/config`                 |
| `starship`  | Starship prompt               |
| `tmux`      | tmux config + plugins         |
| `zsh`       | `.zshrc`                      |

## Fresh install

```bash
# 1. Clone
git clone https://github.com/elliothill14/dotfiles ~/.dotfiles

# 2. Run bootstrap
cd ~/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

## Adding a new dotfile

```bash
# Move config into the repo, then stow it
mv ~/.config/foo ~/.dotfiles/foo/.config/foo
cd ~/.dotfiles && stow foo
```

## Manual steps

- **Neovim**: `git clone git@github.com:elliothill1407/nvim.git ~/.config/nvim`
- **oh-my-zsh**: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- **tmux plugins**: open tmux and press `prefix + I` to install via TPM
