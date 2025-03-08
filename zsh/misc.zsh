template() {
    local dir=$(fd --max-depth 1 --glob '*' ~/Templates | fzf --prompt="Templates > " --height=~50% --layout=reverse --border --exit-0)
    [[ -z $dir ]] && echo "No Template Selected." && return
    cp -r $dir/* ./
}

make-template() {
    cp -r ./ ~/Templates/$1
}

alias q="exit"

export XDG_CONFIG_HOME="$HOME/.config/"

cl() {
    cd $* && ls
}
zl() {
    z $* && ls
}

alias fetch="fastfetch"

alias ls="ls -a"
alias showpath='printf "%s\n" $path'

alias loc="tokei"

export RAYLIB_INCLUDE_DIR=/opt/homebrew/Cellar/raylib/5.0/include

COWSAY_DIR=/opt/homebrew/Cellar/cowsay/3.04_1/share/cows
# COWSAY_DIR=~/Documents/Cows/

show-cowsay() {
    for f in $COWSAY_DIR/*.cow;
        do cowsay -f "${f:#COWSAY_DIR:-4}" "${f:#COWSAY_DIR:-4}";
    done
}

random_cow() {
    local cow=$(find $COWSAY_DIR -name "*.cow" | sort -R | tail -1)
    # fortune | cowsay -f $cow
    hitchhiker_cow -f $cow
}

show_images() {
    fd --max-depth 20 --glob '*.jpeg' ./ | while read -r file; 
    do
        wezterm imgcat $file
        echo $file
    done
    fd --max-depth 20 --glob '*.jpg' ./ | while read -r file; 
    do
        wezterm imgcat $file
        echo $file
    done
    fd --max-depth 20 --glob '*.png' ./ | while read -r file; 
    do
        wezterm imgcat $file
        echo $file
    done
}


# aoc() {
#     name=$(printf "day_%02d" "$1")
#     cd ~/Documents/dev/advent-of-code/rust2024/
#     nvim "./inputs/${name}.txt"
#     nvim -O "./src/${name}.rs" "./inputs/${name}.txt"
# }
