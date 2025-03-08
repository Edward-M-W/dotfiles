# ZVM - Zig Version Manager export ZVM_INSTALL=$HOME/.zvm/self
export PATH=$PATH:$HOME/.zvm/bin
export ZVM_INSTALL=$HOME/.zvm/self
export PATH=$PATH:$ZVM_INSTALL/

# Odin

export ODIN_ROOT=~/Odin
export PATH=$PATH:~/Odin


# LLVM

# what the fuck

# export LDFLAGS=-L/opt/homebrew/opt/llvm@14/lib
# export CPPFLAGS=-I/opt/homebrew/opt/llvm@14/include
# export LLVM_CONFIG=/opt/homebrew/Cellar/llvm@14/14.0.6/bin/llvm-config

# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export PATH="/opt/homebrew/opt/llvm@17/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@17/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@17/include"

export LLVM_LIB_DIR="/opt/homebrew/Cellar/llvm@17/17.0.6/lib"

# export LLVM_SYS_170_PREFIX=/opt/homebrew/Cellar/llvm/17.0.6_1
# export CMAKE_PREFIX_PATH=/opt/homebrew/Cellar/llvm/18.1.5
# export PATH=$PATH:/opt/homebrew/Cellar/llvm@14/14.0.6/bin

# export PATH=$PATH:LDFLAGSexport PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"

# Go

export GOPATH=~/go
export PATH=$PATH:~/go/bin

alias got=/Library/Got/got

# Python (venvs)

alias py-init="python3 -m venv venv && py-act"
alias py-act="source venv/bin/activate"
alias py-install="python -m pip install"

# Rust

# export CARGO_TARGET_DIR=~/rust-target/
# export RUST_BACKTRACE=full # or 1 for a less full backtrace


# Javascript
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

