#!/bin/bash
# Claude Code status line: directory | branch | model | effort | context
# Reads the statusLine JSON from stdin (schema per Claude Code docs).

input=$(cat)

dir_path=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // empty')
# Full path, with $HOME collapsed to ~ for brevity.
dir="$dir_path"
[ -n "$HOME" ] && dir="${dir/#$HOME/~}"
model=$(printf '%s' "$input" | jq -r '.model.display_name // empty')
effort=$(printf '%s' "$input" | jq -r '.effort.level // empty')
used=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')

# Git branch (not in the JSON) — compute from the current dir, fail quietly.
branch=""
if [ -n "$dir_path" ]; then
  branch=$(git -C "$dir_path" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
  [ "$branch" = "HEAD" ] && branch=$(git -C "$dir_path" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
fi

# Dimmed ANSI colors (terminal renders the status line dimmed).
CYAN=$'\033[36m'; GREEN=$'\033[32m'; BLUE=$'\033[34m'
YELLOW=$'\033[33m'; DIM=$'\033[2m'; RESET=$'\033[0m'
SEP="${DIM} | ${RESET}"

out="${CYAN}${dir}${RESET}"
[ -n "$branch" ] && out="${out}${SEP}${GREEN}⎇ ${branch}${RESET}"
[ -n "$model" ]  && out="${out}${SEP}${BLUE}${model}${RESET}"
[ -n "$effort" ] && out="${out}${SEP}${YELLOW}${effort}${RESET}"
if [ -n "$used" ]; then
  out="${out}${SEP}${DIM}ctx $(printf '%.0f' "$used")%${RESET}"
fi

printf '%b' "$out"
