source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump
antigen bundle brew

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme ys

antigen apply

alias sp='export ALL_PROXY="socks5://127.0.0.1:10808"'
alias op='export ALL_PROXY=""'

export PATH=$HOME/.local/bin:$PATH

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

