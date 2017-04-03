These are my dotfiles and configurations for some of the programs I use. In general the configurations take into account a system running OS X, with iTerm2, zsh, neovim, git and Homebrew.

# Setup

Just clone this repo and configure/symlink/etc. the programs you use. Some programs can be installed using `brew bundle` (see Brewfile and [here](https://github.com/Homebrew/homebrew-bundle) for more info). 

## zsh

Use `~/.zprofile` if you want to have local configurations. zsh will source this file before `~/.zshrc`.

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

### Themes

Use `~/.vimrc_background` to have local settings for the colorscheme. For example:

```sh
# ~/.vimrc_background

" colorscheme base16-tomorrow-night

" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu
```

### deoplete.vim

I am using [deoplete.vim](https://github.com/Shougo/deoplete.nvim) to have omni auto-complete for a few languages (ruby, elixir and javascript). In order to have all this working, you need to have python3 and node.js installed (already covered in the brew bundle).

Before installing the plugin in neovim, you also need to install the neovim-python module with:

```sh
pip3 install --user neovim
```

Then, in neovim, execute `:PlugInstall` and then `:UpdateRemotePlugins`. You can check if everything is working fine with `:CheckHealth`.

Note: for javascript the plugin installs [ternjs](http://ternjs.net/), so you also need node installed in your system.

# Acknowledgements

The work on this repo is inspired and based on other great configurations. Below some of the people/repos I took ideas to create my own stuff:

* https://github.com/alrra/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/gf3/dotfiles
* https://github.com/paulirish/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/driesvints/dotfiles

