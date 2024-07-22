#!/usr/bin/env bash

# what directories should be installed
configs=(
    hypr
	nvim
    waybar
    swaync
    alacritty
    lazygit
    rofi
)

config_directory="$HOME/.config"
echo "---- Setup $config_directory ----"

check_and_create_directory () {
    local path=$1
    if [ ! -d $path ]; then
        mkdir $path
        echo "Created $path Directory"
    else
        echo "$path Exists"
    fi
}

check_and_create_directory $config_directory

for config in ${configs[@]}; do
    echo ""
    echo "---- Setup $config ----"
    check_and_create_directory "$config_directory/$config"
    stow -v -R -d "$PWD/$config" -t "$config_directory/$config" .
done

ln -f "$PWD/ideavim/.ideavimrc" "$HOME/.ideavimrc"

echo ""
echo ""
echo "<><><> ALL DONE <><><>"
