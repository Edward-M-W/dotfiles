if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

alias v="nvim"
alias vimdiff="nvim -d"
alias view="nvim -R"

# boot vim with any config in format ~/.config/nvim*
vv() {
  local config=$(fd --max-depth 1 --glob 'nvim*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)
 
  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return
 
  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim $@
}

