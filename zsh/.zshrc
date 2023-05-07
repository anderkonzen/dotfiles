# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

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
#

# brew completion setup
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh

zplug "lib/compfix", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh

# (defer:2 means syntax-highlighting gets loaded after completions)
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# (defer:3 means history-substring search gets loaded after syntax-highlighting)
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug 'zsh-users/zsh-completions', depth:1

zplug 'chriskempson/base16-shell', from:github

# Source plugins and add commands to $PATH
zplug load

# pure customization
# https://github.com/sindresorhus/pure
PURE_PROMPT_SYMBOL=λ

# base16
# https://github.com/chriskempson/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --hidden"
command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# asdf-vm
# https://github.com/asdf-vm/asdf
. $HOME/.asdf/asdf.sh

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# haskell
# export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

# MySQL
# export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

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

# aws
# https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-prompting.html
export AWS_CLI_AUTO_PROMPT=on-partial

# assh
# https://github.com/moul/assh
alias ssh="assh wrapper ssh --"

# Postres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# dotfiles and custom bin
export DOTFILES=$HOME/dotfiles
export PATH=$PATH:$DOTFILES/_bin

# Source custom stuff
if [ -f $HOME/.anderkonzen.zsh ]; then
  source $HOME/.anderkonzen.zsh
fi
source "$DOTFILES/zsh/_aliases.zsh"
source "$DOTFILES/zsh/_functions.zsh"

# direnv hooks
eval "$(direnv hook zsh)"

# starship.rs
# https://starship.rs/
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

