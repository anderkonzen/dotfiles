# .zshrc
#   zshenv -> zprofile -> zshrc (current)
#
# | zshenv   : always
# | zprofile : if login shell
# | zshrc    : if interactive shell
# | zlogin   : if login shell, after zshrc
# | zlogout  : if login shell, after logout
#
# https://zsh.sourceforge.io/Doc/Release/Files.html#Files


# asdf-vm
# https://github.com/asdf-vm/asdf
. $HOME/.asdf/asdf.sh
# append completions to fpath, ensure compinit is below your sourcing of asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# brew completion setup
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Initialize compinit
autoload -Uz compinit
compinit

# antidote
# https://getantidote.github.io/
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# base16
# https://github.com/chriskempson/base16-shell
BASE16_SHELL=$(antidote path chriskempson/base16-shell)
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"

# bat customization
# https://github.com/sharkdp/bat
export BAT_THEME="base16"

# zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# fzf
# https://github.com/junegunn/fzf
# https://github.com/BurntSushi/ripgrep
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="rg --hidden"
command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# atuin
eval "$(atuin init zsh --disable-up-arrow)"

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# rebar3
export PATH=$PATH:~/.cache/rebar3/bin

# haskell
# export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# MySQL
# export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"
# The following is necessary because being a specific version, brew won't
# export automatically
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# kubectl completions
source <(kubectl completion zsh)
if command -v kubecolor > /dev/null; then
  alias kubectl="kubecolor"
  # make completion work with kubecolor
  compdef kubecolor=kubectl
fi

# nvm/nodejs
# https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yarn
export PATH="$PATH:$(yarn global bin)"

# pnpm
export PNPM_HOME="/Users/anderkonzen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# aws
# https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html
export AWS_CLI_AUTO_PROMPT=on-partial

# Postres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# dotfiles and custom bin
export DOTFILES=$HOME/dotfiles
export PATH=$PATH:$DOTFILES/_bin
export PATH=$PATH:$HOME/.local/bin

# Source custom stuff
if [ -f $HOME/.anderkonzen.zsh ]; then
  source $HOME/.anderkonzen.zsh
fi
source "$DOTFILES/zsh/_aliases.zsh"
source "$DOTFILES/zsh/_functions.zsh"

# direnv hooks
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# For wezterm
# Usage: set_user_var KEY VALUE
function set_user_var() {
   printf "\033]1337;SetUserVar=%s=%s\007" $1 `echo -n $2 | base64`
}

set_user_var DOTFILES "$DOTFILES"


# Added by Windsurf
export PATH="/Users/anderkonzen/.codeium/windsurf/bin:$PATH"
