alias df='df -P -kHl' # disk free report
alias du='du -h -c' # calculate disk usage for a folder

alias cat='bat -p'

# List directory contents
alias lsa='ls -lah --color=auto'
alias l='ls -lah --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lAh --color=auto'

alias e='eza --all --color-scale=size --color-scale-mode=gradient --icons=always -l --time modified --time-style long-iso'

# git
alias cb='gba | fzf | xargs git checkout'
