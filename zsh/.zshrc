export DOTFILES=$HOME/.dotfiles

# Antibody
# https://github.com/getantibody/antibody
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

# Custom bindkeys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Pure Customization
# https://github.com/sindresorhus/pure
PURE_PROMPT_SYMBOL=λ

# Base16 Shell
# https://github.com/chriskempson/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# Use proper sed with gnu-sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Ensure user-installed binaries take precedence
# export PATH=/usr/local/bin:$PATH

# MySQL
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# tmuxinator
source $DOTFILES/tmux/tmuxinator.zsh

autoload -Uz compinit; compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anderkonzen/Developer/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/anderkonzen/Developer/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/anderkonzen/Developer/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/anderkonzen/Developer/opt/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/anderkonzen/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/anderkonzen/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/anderkonzen/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/anderkonzen/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# kubectl completions
source <(kubectl completion zsh)

