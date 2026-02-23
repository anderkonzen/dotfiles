# tools.zsh — third-party tool integrations

# zoxide — smarter cd
eval "$(zoxide init zsh)"

# fzf — fuzzy finder
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="rg --hidden"
command -v bat > /dev/null && export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# atuin — shell history
eval "$(atuin init zsh --disable-up-arrow)"

# direnv — per-project env vars
eval "$(direnv hook zsh)"

# exercism completions
source <(exercism completion zsh)
