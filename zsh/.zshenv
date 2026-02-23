# .zshenv — loaded for every shell (login, interactive, scripts)
# Keep this minimal. Only put here what every shell needs.

export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES=$HOME/dotfiles

# brew must be here (not .zprofile) so it's on PATH for all shell types,
# including non-login interactive shells where .zprofile is not sourced.
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export LESSCHARSET='utf-8'

export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Java
# Check installed versions with '/usr/libexec/java_home -V'
# export JAVA_HOME=`/usr/libexec/java_home -v 17`
if /usr/libexec/java_home &>/dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Go
export GOPATH=$HOME/go

# AWS
export AWS_CLI_AUTO_PROMPT=on-partial

# bat
export BAT_THEME="Catppuccin Mocha"

# eza
export EZA_CONFIG_DIR="$HOME/.config/eza"

# PATH
path=(
  $path
  "$DOTFILES/bin"
  "$HOME/.local/bin"
  "$GOPATH/bin"
)

# Local overrides — machine-specific config, not committed
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
