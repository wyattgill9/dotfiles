eval "$(zoxide init zsh)"

alias cd='z'
export PATH=$PATH:/opt/ghc/12.1.1/bin
export PATH=/Users/wyattgill/.nimble/bin:$PATH

mkdir -p ~/.ghcup
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$PATH:/Applications/Julia-1.11.app/Contents/Resources/julia/bin"

eval "$(thefuck --alias)"

eval "$(starship init zsh)"

alias ls='lsd'
alias cat="bat"
alias c="clear"
alias n="nvim"

# bun completions
[ -s "/Users/wyattgill/.bun/_bun" ] && source "/Users/wyattgill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Users/wyattgill/.modular/bin"

export PATH=$PATH:/Users/wyattgill/.spicetify


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/wyattgill/.opam/opam-init/init.zsh' ]] || source '/Users/wyattgill/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
