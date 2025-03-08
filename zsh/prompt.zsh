eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/minimalish.toml)"

switch_prompt() {
  local selected=$(                                                            \
    fd --max-depth 2 --glob '*' ~/.config/ohmyposh/ |                          \
    fzf --prompt="Prompt > " --height=~50% --layout=reverse --border --exit-0  \
  )
  [[ -z $selected ]] && echo "No Prompt Selected." && return
  eval "$(oh-my-posh init zsh --config $selected)"
}
