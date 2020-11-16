export CLICOLOR=1
export VISUAL=vim
export EDITOR=$VISUAL

# pure prompt
fpath+=$HOME/.config/zsh/pure
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
