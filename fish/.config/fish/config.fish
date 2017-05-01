# Remove the greeting message
set fish_greeting

# Better fish titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end

# Environment variables
source $HOME/.config/fish/env.fish

