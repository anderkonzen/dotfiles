These are my dotfiles and configurations for some of the programs I use.
In general the configurations are optimized for a system running macOS.

# Pre-requisites

Some programs are required to be installed prior to issuing the stow commands.
Make sure the following are installed:

* git
* [Homebrew](https://brew.sh/)
* [stow](https://www.gnu.org/software/stow/) (`brew install stow`)

Also, I recommend installing first the apps and then stow the configs.

# Install

The files are managed by `stow`, so basically:

1. Clone the repository:

```shell
git clone https://github.com/anderkonzen/dotfiles.git ~/dotfiles
```

2. Initialize git submodules:

```shell
cd ~/dotfiles
git submodule init
git submodule update
```

3. Setup `stow`:

```shell
cd dotfiles
stow -t ~ stow
```

The stow directory should be the first one so the stow configuration is installed properly (global ignore files, etc).

4. Install the desired packages with `stow <dir>`:

```shell
stow mise
stow p10k
# etc...
```

# Conventions

Directories starting with a `_` are not supposed to be *stowed*.

# Configuring other apps

## git

Use `~/.gitconfig.local` to store sensitive data like git credentials and other local configurations.
For instance:

```shell
[user]
    name = Foo Bar
    email = foo.bar@example.com
```

# Apps I like to use

* LuLu (https://objective-see.org/products/lulu.html)
* Postgres.app (https://postgresapp.com/)
* Grammarly
* Ice (https://github.com/jordanbaird/Ice)
* iStat Menus (https://bjango.com/mac/istatmenus/)
* KeepingYouAwake (https://github.com/newmarcel/KeepingYouAwake)
* CleanShot (https://cleanshot.com/)
* AppCleaner (https://freemacsoft.net/appcleaner/)
* Zed (https://zed.dev/)
* Sublime Text (https://www.sublimetext.com/)
* 1Password (https://1password.com/)
* Time Out (https://dejal.com/timeout/)
* Numi (https://numi.app/)
* GPG Suite (https://gpgtools.org/)

And for command line:

* antidote (https://github.com/mattmc3/antidote)
* atuin (https://atuin.sh/)
* bat (https://github.com/sharkdp/bat)
* colima (https://github.com/abiosoft/colima)
* difftastic (https://github.com/Wilfred/difftastic)
* eza (https://github.com/eza-community/eza)
* fd (https://github.com/sharkdp/fd)
* fzf (https://github.com/junegunn/fzf)
* lazygit (https://github.com/jesseduffield/lazygit)
* mise (https://github.com/jdx/mise)
* neovim (https://neovim.io/)
* ripgrep (https://github.com/BurntSushi/ripgrep)
* zoxide (https://github.com/ajeetdsouza/zoxide)

# Acknowledgements

The work on this repo is inspired and based on other great configurations.
Below you will find some of the people/repos I took ideas from to create my own stuff:

* https://github.com/Kraymer/F-dotfiles
* http://dotfiles.github.io
* https://github.com/webpro/awesome-dotfiles
* https://github.com/ches/dotfiles
* https://github.com/junegunn/dotfiles
