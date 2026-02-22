# functions.zsh

# Print available terminal colors and their numbers
function colours() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}"
    (( $i % 5 == 0 )) && printf "\n" || printf "\t"
  done
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_"
}

# cd into the frontmost Finder window
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Show network IPs
function myip() {
  ipconfig getifaddr en0
  ipconfig getifaddr en1 2>/dev/null || true
}

# Start a local HTTP server in the current directory
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  python3 -m http.server "$port"
}
