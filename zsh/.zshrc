export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ── Aliases ──────────────────────────────────────────────────────────────────
alias ip="ipconfig getifaddr en0"
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias alaconfig="nvim ~/.config/alacritty/alacritty.toml"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias sshhome="cd ~/.ssh"
alias sshconfig="nvim ~/.ssh/config"
alias gitconfig="nvim ~/.gitconfig"
alias lg="lazygit"
alias dotfiles="cd ~/.dotfiles"
alias brewup="brew update && brew upgrade && brew cleanup"
alias ls="eza --icons --grid --group-directories-first"
alias ll="eza -la --icons --group-directories-first"

# ── Functions ─────────────────────────────────────────────────────────────────
mkcd() { mkdir -p "$1" && cd "$1" }

# ── PATH ─────────────────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$HOME/.local/bin:$PATH:$(go env GOPATH)/bin"

# ── Completions ───────────────────────────────────────────────────────────────
autoload -U compinit && compinit

# ── Tools ────────────────────────────────────────────────────────────────────
eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"
[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
