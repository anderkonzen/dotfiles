fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/brew" )
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/brew/brew.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/git" )
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/git/git.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/kubectl" )
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/kubectl/kubectl.plugin.zsh"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/compfix.zsh"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/completion.zsh"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/directories.zsh"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/git.zsh"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/history.zsh"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/lib/key-bindings.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-powerlevel10k" )
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-powerlevel10k/powerlevel10k.zsh-theme"
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-powerlevel10k/powerlevel9k.zsh-theme"
if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-defer" )
  source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-romkatv-SLASH-zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-syntax-highlighting" )
zsh-defer source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search" )
zsh-defer source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions" )
zsh-defer source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions" )
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions/zsh-completions.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-chriskempson-SLASH-base16-shell" )
source "$HOME/Library/Caches/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-chriskempson-SLASH-base16-shell/base16-shell.plugin.zsh"
