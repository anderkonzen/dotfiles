# .zshenv — loaded for every shell (login, interactive, scripts)
# Keep this minimal. Only put here what every shell needs.
export ZDOTDIR="$HOME/.config/zsh"

# brew must be here (not .zprofile) so it's on PATH for all shell types,
# including non-login interactive shells where .zprofile is not sourced.
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"
