export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' frequency 13
plugins=(git z hitchhiker rust web-search)
source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

fd --glob "*.zsh" ~/.config/zsh/ | while read -r file;
	do source $file;
done

# random_cow

