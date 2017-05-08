function brew_update -d "Update homebrew (update, upgrade and cleanup)"
    brew update
    brew outdated
    brew upgrade
    brew cleanup
end
