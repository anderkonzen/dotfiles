export DOTFILES=$HOME/.dotfiles

source ~/.zplug/init.zsh

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins
zplug "modules/history",        from:prezto, depth:1
zplug "plugins/git",            from:oh-my-zsh, depth:1
zplug "plugins/docker",         from:oh-my-zsh, depth:1
zplug "plugins/docker-compose", from:oh-my-zsh, depth:1
zplug "plugins/extract",        from:oh-my-zsh, depth:1
zplug "robbyrussell/oh-my-zsh", use:"lib/grep.zsh", depth:1
zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh", depth:1

# Themes
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Others
zplug "zsh-users/zsh-completions",         defer:0
zplug "zsh-users/zsh-autosuggestions",     defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3, on:"zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

# zsh customization
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# pure customization
PURE_PROMPT_SYMBOL=λ

# Ensure user-installed binaries take precedence
# export PATH=/usr/local/bin:$PATH

# MySQL
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# z
. /usr/local/etc/profile.d/z.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Fix gnupg
export GPG_TTY=$(tty)

# base16
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Use proper sed with gnu-sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# Other files with pattern _*.zsh will be sourced
for config ($DOTFILES/zsh/_*.zsh) source $config
