# .zprofile — loaded for login shells only
# Use for PATH setup, brew, and env vars that only need to be set once.

# less
export LESSCHARSET='utf-8'

# History
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=5000000
export SAVEHIST=5000000
export LISTMAX=1000

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Go
export GOPATH=$HOME/go
path=("$GOPATH/bin" $path)

# AWS
export AWS_CLI_AUTO_PROMPT=on-partial

# bat
export BAT_THEME="rose-pine"

# dotfiles and custom bin
export DOTFILES=$HOME/dotfiles
path=($path "$DOTFILES/bin")
path=($path "$HOME/.local/bin")
path=($path "$HOME/.lmstudio/bin")
path=($path "$HOME/.cache/rebar3/bin")
path=($path "/Applications/Postgres.app/Contents/Versions/latest/bin")
