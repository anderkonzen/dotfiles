These are my dotfiles and configurations for some of the programs I use.
In general the configurations are optimized for a system running macOS, with iTerm2, neovim, git and Homebrew.

# Install

The files are managed by [`stow`](https://www.gnu.org/software/stow/), so basically:

1. Clone the repository:

```shell
git clone https://github.com/anderkonzen/dotfiles.git ~/dotfiles
```

2. Setup `stow`: 

```shell
cd .dotfiles
stow -t ~ stow
```

The stow directory should be the first one so the stow configuration is installed properly (global ignore files, etc).

3. Install the desired packages with `stow <dir>`

# Conventions

Directories starting with a `_` are not supposed to be *stowed*.

# Requirements

I use a few apps that not necessarily need to be installed prior to issuing the stow commands.

zsh and other stuff will use the apps, so you'll need to install or adjust accordingly to your needs.

# Configuring other apps

## git

Use `~/.gitconfig.local` to store sensitive data like git credentials and other local configurations.
For instance:


```shell
[user]
    name = Anderson Konzen
    email = anderkonzen@example.com
```

# TODO

* nvim configuration and requirements
* a list of common apps I use (to be in sync with stow)
* antibody

# Acknowledgements

The work on this repo is inspired and based on other great configurations.
Below you will find some of the people/repos I took ideas from to create my own stuff:

* https://github.com/Kraymer/F-dotfiles
* http://dotfiles.github.io
* https://github.com/webpro/awesome-dotfiles

* https://github.com/ches/dotfiles
* https://github.com/junegunn/dotfiles
