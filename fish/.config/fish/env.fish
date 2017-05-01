# Language default
set -x LANGUAGE en_US.UTF-8
set -x LANG $LANGUAGE
set -x LC_ALL $LANGUAGE
set -x LC_CTYPE $LANGUAGE

# Editor
set -x EDITOR nvim

# Pager
set -x PAGER less

# Less status line
set -x LESS '-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
set -x LESSCHARSET utf-8

# Colorful man pages
setenv -x LESS_TERMCAP_mb (set_color -o red)
setenv -x LESS_TERMCAP_md (set_color -o red)
setenv -x LESS_TERMCAP_me (set_color normal)
setenv -x LESS_TERMCAP_se (set_color normal)
setenv -x LESS_TERMCAP_so (set_color -b blue -o yellow)
setenv -x LESS_TERMCAP_ue (set_color normal)
setenv -x LESS_TERMCAP_us (set_color -o green)

# grep colors
setenv -x GREP_OPTIONS "--color=auto"

# Custom bin path
set -x PATH ~/bin $PATH

