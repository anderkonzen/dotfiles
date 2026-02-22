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

# base16
BASE16_SHELL=$(antidote path chriskempson/base16-shell)
[[ -n "$PS1" && -s "$BASE16_SHELL/profile_helper.sh" ]] && source "$BASE16_SHELL/profile_helper.sh"

# Load topic configs
for config in "$ZDOTDIR/conf.d/"*.zsh; do
  source "$config"
done

# p10k prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Local overrides — machine-specific config, not committed
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
