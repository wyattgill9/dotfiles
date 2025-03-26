
eval "$(zoxide init zsh)"

alias cd='z'
export PATH=$PATH:/opt/ghc/12.1.1/bin
export PATH=/Users/wyattgill/.nimble/bin:$PATH

mkdir -p ~/.ghcup
export PATH="$HOME/.ghcup/bin:$PATH"

eval "$(thefuck --alias)"

eval "$(starship init zsh)"


# bun completions
[ -s "/Users/wyattgill/.bun/_bun" ] && source "/Users/wyattgill/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Users/wyattgill/.modular/bin"
