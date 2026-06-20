# Global preferences

These apply to all Claude Code sessions, across every project.

## Environment

- Dotfiles live in `~/dotfiles` and are managed with GNU **stow** (one package per tool).
  Files under e.g. `~/dotfiles/claude/.claude/` are symlinked into `~/.claude/`.
  To edit a config, edit the file inside `~/dotfiles`, not the symlink target.

## Conventions

- Only commit or push when I explicitly ask.
- When a skill might apply to a task, do not invoke it automatically.
  List all plausibly-relevant skills and wait for me to choose.
  Exception: skills I invoke explicitly (e.g. /brainstorming).
