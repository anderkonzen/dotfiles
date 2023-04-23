# Print available colors and their numbers
function colours() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}m colour${i}"
    if (( $i % 5 == 0 )); then
      printf "\n"
    else
      printf "\t"
    fi
  done
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_"
}

# cd into whatever is the forefront Finder window.
function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

function myip {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0 : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/" &
  ruby -run -e httpd . -p "$port"
}

function arv_profile() {
  export PROFILE="$@"
  direnv reload
}

