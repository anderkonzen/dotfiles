# tools.zsh — third-party tool integrations

# AWS
export AWS_CLI_AUTO_PROMPT=on-partial

# bat
export BAT_THEME="Catppuccin Mocha"

# eza
export EZA_CONFIG_DIR="$HOME/.config/eza"

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
command -v exercism >/dev/null && source <(exercism completion zsh)
