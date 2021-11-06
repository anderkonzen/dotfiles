# Antibody
# https://github.com/getantibody/antibody
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

# Custom bindkeys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# Pure Customization
# https://github.com/sindresorhus/pure
PURE_PROMPT_SYMBOL=λ

# Base16 Shell
# https://github.com/chriskempson/base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# bat Customization
# https://github.com/sharkdp/bat
export BAT_THEME="base16"

# z - jump around
# https://github.com/rupa/z
# . /usr/local/etc/profile.d/z.sh

# zoxide (replaces z)
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# go
export GOPATH=$HOME/go
# Makes it easier to execute go applications
export PATH="$GOPATH/bin:$PATH"

# haskell
# export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# MySQL
export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/anderkonzen/Developer/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/anderkonzen/Developer/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/anderkonzen/Developer/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/anderkonzen/Developer/opt/google-cloud-sdk/completion.zsh.inc'; fi

# kubectl completions
source <(kubectl completion zsh)

# kube-ps1
# https://github.com/jonmosco/kube-ps1
export KUBE_PS1_SYMBOL_ENABLE=false
source "$HOME/Developer/opt/kube-ps1/kube-ps1.sh"
PS1='$(kube_ps1) '$PS1

# nvm/nodejs
# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# .NET telemetry opt out
# https://docs.microsoft.com/en-us/dotnet/core/tools/telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# aws
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
complete -C '/usr/local/bin/aws_completer' aws

# assh
# alias ssh="assh wrapper ssh --"

# asdf-vm
. $HOME/.asdf/asdf.sh

# dotfiles and custom bin
export DOTFILES=$HOME/dotfiles
export PATH=$PATH:$DOTFILES/_bin
export PATH=$PATH:/usr/local/sbin
source "$DOTFILES/zsh/_aliases.zsh"
source "$DOTFILES/zsh/_functions.zsh"
