# .zshrc — interactive shell
# Load order: .zshenv -> .zprofile -> .zshrc

# compinit must run before antidote so plugins that call compdef find it ready
autoload -Uz compinit
compinit

# mise (early, so managed tools are on PATH before plugins/completions)
eval "$(mise activate zsh)"

# antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# Load topic configs
for config in "$ZDOTDIR/conf.d/"*.zsh; do
  source "$config"
done

path=($path "$HOME/.local/bin")

# p10k prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Local overrides — machine-specific config, not committed
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
