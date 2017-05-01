# Get OS X Software Updates, and update Homebrew
function update
    brew update
    brew outdated
    brew upgrade
    brew cleanup
end
