# Environment variables
source $HOME/.config/fish/env.fish

# Load preferred theme for shell
if test -f $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
  eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
end

# Load local config, ignored by git
if test -f $HOME/.config/fish/local.fish
  . $HOME/.config/fish/local.fish
end
