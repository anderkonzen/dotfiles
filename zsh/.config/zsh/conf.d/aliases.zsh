# aliases.zsh

alias df='df -P -kHl'
alias du='du -h -c'
alias cat='bat -p'

# Directory listings via eza
alias ls='eza --icons=always --color=auto'
alias l='eza --all --icons=always -l --time-style long-iso'
alias ll='eza -l --icons=always --time-style long-iso'
alias la='eza --all -l --icons=always --time-style long-iso'
alias e='eza --all --color-scale=size --color-scale-mode=gradient --icons=always -l --time modified --time-style long-iso'

# git
alias cb='gba | fzf | xargs git checkout'
