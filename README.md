# 👽 Jonny64bit dotfiles! 🍰

This is an attempt to keep my dotfiles, install scripts & settings in sync across multiple machines.

The idea being that I can run the setup script on a new machine and have it setup the way I like it. (🪟Windows or 🐧Linux)

I admit though this has spawned into a bit of a monster, but I'm having fun with it. 🤖

## 🐧 Linux Installation 

This was all designed to work on Arch linux but i suspect it will work on other distros if you install the correct packages from their package manager.

### 🐟 Arch Linux

1. Install [Paru](https://github.com/Morganamilo/paru) or use your favourite AUR helper.

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
2. Install genernal packages

```bash
paru -S qtile python-xlib python-pyxdg python-psutil rofi rofi-emoji xdotool alacritty flameshot nitrogen polkit-gnome ttf-jetbrains-mono-nerd stow fish arandr dracula-gtk-theme starship firefox git lxappearance neofetch p7zip thunar timeshift cronie dunst volctl playerctl
```

3. Install fun packages

```bash
paru -S steam ttf-ms-win11-auto discord_arch_electron
```

4. Install development packages

```bash
paru -S lazygit github-cli visual-studio-code-bin jetbrains-toolbox notion-app nvm
```

5. Open LXAppearance and set the theme to Dracula.
6. Open Nitrogen and set the wallpaper to the desired wallpaper.
7. Login with GitHub CLI `gh auth login`
8. Setup timeshift scheduled backups.
9. Setup Node
```bash
nvm install --lts
nvm use --lts
```
10. Install global node packages
```bash
npm install -g git-cz
```

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

## 🪟 Windows Installation

1. Install [Scoop](https://scoop.sh/)
2. Enable scoope extras
```powershell
scoop bucket add extras
```
3. Install packages
```powershell
scoop install lazygit starship gh
```
4. Install [NVM Windows](https://github.com/coreybutler/nvm-windows)
5. Install Node LTS
```powershell
nvm install lts
nvm use lts
```
6. Install global node packages
```powershell
npm install -g git-cz
```
