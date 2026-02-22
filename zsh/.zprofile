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
export PATH="$GOPATH/bin:$PATH"

# AWS
export AWS_CLI_AUTO_PROMPT=on-partial

# bat
export BAT_THEME="base16"

# dotfiles and custom bin
export DOTFILES=$HOME/dotfiles
export PATH="$PATH:$DOTFILES/_bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.lmstudio/bin"
export PATH="$PATH:$HOME/.cache/rebar3/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
