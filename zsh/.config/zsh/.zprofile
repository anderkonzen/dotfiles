# .zprofile — loaded for login shells only

# Re-eval brew shellenv to undo path_helper reordering from /etc/zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
