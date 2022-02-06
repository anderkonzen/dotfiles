# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Editor
export EDITOR=nvim

# Pager
export PAGER=less

# less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# less man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# lscolors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Rust
. "$HOME/.cargo/env"

# Java
# Check installed versions with '/usr/libexec/java_home -V'
export JAVA_HOME=`/usr/libexec/java_home -v 17`

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"
