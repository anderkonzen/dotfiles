# Remove the greeting message
set fish_greeting

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or prompt_pwd
end


