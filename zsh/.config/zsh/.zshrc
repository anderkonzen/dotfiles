# .zshrc — interactive shell
# Load order: .zshenv -> .zprofile -> .zshrc
#
# | zshenv   : always
# | zprofile : if login shell
# | zshrc    : if interactive shell
# | zlogin   : if login shell, after zshrc
# | zlogout  : if login shell, after logout
#
# https://zsh.sourceforge.io/Doc/Release/Files.html#Files

# History
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=5000000
export SAVEHIST=5000000
export LISTMAX=1000

# compinit must run before antidote so plugins that call compdef find it ready
autoload -Uz compinit
compinit

# mise (early, so managed tools are on PATH before plugins/completions)
# https://github.com/jdx/mise
eval "$(mise activate zsh)"

# worktrunk
# https://github.com/max-sixty/worktrunk
if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

# antidote
# https://getantidote.github.io
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# Load topic configs
for config in "$ZDOTDIR/conf.d/"*.zsh; do
  source "$config"
done

# p10k prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Local overrides — machine-specific config, not committed
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
