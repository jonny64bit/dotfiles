# 👽 Jonny64bit dotfiles! 🍰

This is an attempt to keep my dotfiles, install scripts & settings in sync across multiple machines.

The idea being that I can run the setup script on a new machine and have it setup the way I like it. (🪟Windows or 🐧Linux)

I admit though this has spawned into a bit of a monster, but I'm having fun with it. 🤖

## 🐧 Linux Installation 

This was all designed to work on Arch linux but i suspect it will work on other distros if you install the correct packages from their package manager.

### 📦 Packages

These are the packages im currently using to enable my Arch setup.

- [Qtile](https://qtile.org/)
    - [python-xlib](https://pypi.org/project/python-xlib/)
    - [pyxdg](https://pypi.org/project/pyxdg/)
    - [psutil](https://pypi.org/project/psutil/)
- [Rofi](https://github.com/davatorium/rofi)
    - [Rofi Emoji](https://github.com/Mange/rofi-emoji)
        - [xdotool](https://github.com/jordansissel/xdotool)
- [Alacritty](https://alacritty.org/)
- [Flameshot](https://flameshot.org/)
- [Nitrogen](https://github.com/l3ib/nitrogen/)
- [Polkit Gnome](https://gitlab.gnome.org/Archive/policykit-gnome)
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- [Fish](https://fishshell.com/)
- [Starship](https://starship.rs/)
- [Arandr](https://christian.amsuess.com/tools/arandr/)
- [Stow](https://www.gnu.org/software/stow/)
- [Dracula GTK Theme](https://draculatheme.com/gtk)
- [Firefox](https://www.mozilla.org/en-GB/firefox/new/)
- [Git](https://git-scm.com/)
- [GitHub CLI](https://cli.github.com/)
- [LXAppearance](https://github.com/lxde/lxappearance)
- [Neofetch](https://github.com/dylanaraps/neofetch)
- [Notion](https://www.notion.so/) - need to move to Obsidian 📒
- [p7zip](https://www.7-zip.org/)
- [Thunar](https://docs.xfce.org/xfce/thunar/start)
- [Timeshift](https://github.com/linuxmint/timeshift) - btrfs!🥳
- [Visual Studio Code](https://code.visualstudio.com/)
- [JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/)
- [Cronie](https://github.com/cronie-crond/cronie/)

### 😺 Fun Packages

- [Steam](https://store.steampowered.com/)
- [Discord](https://discord.com/)

### 🐟 Arch Linux

1. Install [Paru](https://github.com/Morganamilo/paru) or use your favourite AUR helper.

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
2. Install packages

```bash
paru -S qtile python-xlib python-pyxdg python-psutil rofi rofi-emoji xdotool alacritty flameshot nitrogen polkit-gnome ttf-jetbrains-mono-nerd stow fish starship arandr dracula-gtk-theme firefox git github-cli lxappearance neofetch notion-app p7zip thunar timeshift visual-studio-code-bin jetbrains-toolbox cronie
```

3. Install fun packages

```bash
paru -S steam ttf-ms-win11-auto discord_arch_electron
```

4. Open LXAppearance and set the theme to Dracula.
5. Open Nitrogen and set the wallpaper to the desired wallpaper.
6. Login with GitHub CLI `gh auth login`
7. Setup timeshift scheduled backups.

### 🔧 Setup 

On Linux I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage the symlinks.

Running the setup script will symlink the dotfiles to the correct locations.

```bash
sh setup.sh
```

### 📓 Notes
 
- Qtile calls an auto start script on login. (autostart.sh)[/qtile/autostart.sh]
    - Starts Nitrogen to set the wallpaper.
    - Starts polkit agent.
- Everything is current based around the [Dracula](https://draculatheme.com/) theme.
- Arandar can be used to setup a complex monitor setup and then save the layout to a script. Its worth adding this to your login script.