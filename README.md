# dotfiles

Personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- git
- [Homebrew](https://brew.sh/)
- [stow](https://www.gnu.org/software/stow/) (`brew install stow`)

Install the apps first, then stow the configs.

## Install

```shell
git clone https://github.com/anderkonzen/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Stow must be set up first so its global ignore rules are in place:

```shell
stow -t ~ stow
```

Then install any package:

```shell
stow zsh
stow git
stow nvim
stow claude
# etc.
```

Note: `mise` is ignored by stow on purpose. See the `Mise` section below for more info.

## Zsh

The shell config is split into layers:

- `.zshenv` -- environment variables, PATH, editor defaults (runs for all shells)
- `.zprofile` -- login shell settings (history)
- `.zshrc` -- interactive shell: plugins (antidote), completions, prompt (p10k), tool integrations (fzf, zoxide, atuin, direnv)
- `conf.d/` -- modular configs loaded from `.zshrc`: aliases, functions, tools

### Local overrides

Two files allow per-machine customization without touching the repo:

- **`~/.zshenv.local`** -- machine-specific environment variables (e.g. work paths, tokens)
- **`~/.zshrc.local`** -- machine-specific shell settings (e.g. extra aliases, tool configs)

Both are sourced at the end of their respective files and are not tracked by git.

## Mise

[mise](https://mise.jdx.dev/) manages runtime versions for development tools. The config lives at `~/.config/mise/config.toml` and pins versions for tools like Node, Python, Ruby, Go, Erlang, Elixir, and others.

Mise is activated early in `.zshrc` so managed tools are on PATH before plugins and completions load.

 Copy the `mise` directory to `~/.config/mise` manually, and adjust the tools to your liking. This gives you some flexibility in managing your tool versions (for instance, having a personal versus a work config).

## Git

The git config uses `user.useConfigOnly = true`, so name and email must be set in a local file:

```shell
# ~/.gitconfig.local
[user]
    name = Your Name
    email = your@email.com
```

This file is also a good place for machine-specific settings (signing keys, credential helpers, work profiles).

## Neovim

Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim). On first launch, run `:Lazy` to install all plugins.

Key plugins: blink.cmp (completion), fzf-lua (fuzzy finder), snacks.nvim (dashboard, indent guides, lazygit, notifications), treesitter, LSP via mason + lspconfig, conform (formatting), gitsigns, trouble, which-key.

Config structure:

```
nvim/.config/nvim/
  init.lua            -- entry point
  lua/user/           -- globals, options, keymaps, autocmds
  lua/plugins/        -- one file per plugin or plugin group
```

## Claude Code

Config for [Claude Code](https://claude.com/claude-code) lives under `~/.claude/`,
which is mostly runtime state and secrets. Only the hand-authored files are tracked
here; stow folds them into the existing `~/.claude/` directory as individual symlinks.

Tracked (`claude/.claude/`):

- `settings.json` -- model, theme, statusline, tui (no secrets)
- `statusline-command.sh` -- custom status line script

When you add custom slash commands, subagents, skills, hooks, global instructions, or
keybindings, track those too by moving them into `claude/.claude/`:

- `commands/`, `agents/`, `skills/`, `hooks/`, `CLAUDE.md`, `keybindings.json`

Never track (account data, secrets, caches, session/runtime state):

- `~/.claude.json`, `.credentials.json`, `settings.local.json`
- `sessions/`, `projects/`, `history.jsonl`, `shell-snapshots/`, `session-env/`,
  `daemon/`, `cache/`, `file-history/`, `backups/`, `plans/`, `plugins/`

Project-level config (`.claude/settings.json`, `.mcp.json`, `CLAUDE.md`, project
commands/agents/skills) belongs in each project's own repo, not here.

## CLI tools

These are expected to be installed via Homebrew:

- [antidote](https://github.com/mattmc3/antidote) -- zsh plugin manager
- [atuin](https://atuin.sh/) -- shell history
- [bat](https://github.com/sharkdp/bat) -- cat with syntax highlighting
- [colima](https://github.com/abiosoft/colima) -- container runtime
- [difftastic](https://github.com/Wilfred/difftastic) -- structural diff
- [eza](https://github.com/eza-community/eza) -- modern ls
- [fd](https://github.com/sharkdp/fd) -- modern find
- [fzf](https://github.com/junegunn/fzf) -- fuzzy finder
- [lazygit](https://github.com/jesseduffield/lazygit) -- git TUI
- [mise](https://mise.jdx.dev/) -- tool version manager
- [neovim](https://neovim.io/) -- editor
- [ripgrep](https://github.com/BurntSushi/ripgrep) -- fast grep
- [zoxide](https://github.com/ajeetdsouza/zoxide) -- smarter cd

## macOS apps

- [1Password](https://1password.com/)
- [AppCleaner](https://freemacsoft.net/appcleaner/)
- [CleanShot](https://cleanshot.com/)
- [GPG Suite](https://gpgtools.org/)
- [Ice](https://github.com/jordanbaird/Ice)
- [iStat Menus](https://bjango.com/mac/istatmenus/)
- [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake)
- [LuLu](https://objective-see.org/products/lulu.html)
- [Numi](https://numi.app/)
- [Postgres.app](https://postgresapp.com/)
- [Time Out](https://dejal.com/timeout/)
- [Zed](https://zed.dev/)
