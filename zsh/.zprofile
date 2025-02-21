# LANGUAGE must be set by en_US
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Editor
export EDITOR=nvim
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER=less

# less status line
export LESSCHARSET='utf-8'

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=5000000
export SAVEHIST=5000000
# The size of asking history
export LISTMAX=1000

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Java
# Check installed versions with '/usr/libexec/java_home -V'
# export JAVA_HOME=`/usr/libexec/java_home -v 17`

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"
