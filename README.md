These are my dotfiles and configurations for some of the programs I use. In general the configurations take into account a system running OS X, with iTerm2, zsh, neovim, git and Homebrew.

# Setup

Just clone this repo and configure/symlink/etc. the programs you use. Some programs can be installed using `brew bundle` (see Brewfile and [here](https://github.com/Homebrew/homebrew-bundle) for more info). 

## git

Use `~/.gitconfig.local` to store sensitive data like git credentials and other local configurations. For instance:

```bash
[user]
    name = Anderson Konzen
    email = anderkonzen@example.com
```

## neovim

[Neovim](https://neovim.io/) follows the XDG convention. Thus, if you cloned the repo into `~/dotfiles` you can create the following symlink:

```bash
# First make sure ~/.config/nvim exists
$ ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

# Acknowledgements

The work on this repo is inspired and based on other great configurations. Below some of the people/repos I took ideas to create my own stuff:

* https://github.com/alrra/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/gf3/dotfiles
* https://github.com/paulirish/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/driesvints/dotfiles

