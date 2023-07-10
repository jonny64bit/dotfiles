#!/usr/bin/env bash

# what directories should be installed
configs=(
    qtile
)

config_directory="$HOME/.config/"

if [ ! -d $config_directory ]; then
    mkdir $config_directory
    echo "Created $config_directory Directory"
else
    echo "$config_directory Exists"
fi


for config in ${configs[@]}; do
    echo ""
    echo "---- Setup $config ----"
    stow -v -R -d "$PWD/$config" -t "$config_directory/$config" .
done

echo ""
echo ""
echo "<><><> ALL DONE <><><>"