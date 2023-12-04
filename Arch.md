# Arch 🐧
Generally i use Arch linux if i can on a work station machine.

## Install
1. Install [Paru](https://github.com/Morganamilo/paru) or use your favourite AUR helper.
```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
2. Install genernal packages
```bash
paru -S qtile python-xlib python-pyxdg python-psutil rofi rofi-emoji xdotool alacritty flameshot nitrogen polkit-gnome ttf-jetbrains-mono-nerd stow fish arandr dracula-gtk-theme starship firefox git lxappearance neofetch p7zip thunar timeshift cronie dunst volctl playerctl picom xclip
```
3. Install fun packages
    - Steam needs the multilib repository enabled see [docs](https://wiki.archlinux.org/title/Official_repositories#multilib)
    - Then install these packages
```bash
paru -S steam ttf-ms-win11-auto discord_arch_electron spotify-launcher
```
4. Install development packages
```bash
paru -S lazygit github-cli visual-studio-code-bin jetbrains-toolbox notion-app nvm git-lfs
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
11. Run setup script. Symlinks are managed with [GNU Stow](https://www.gnu.org/software/stow/)
```bash
sh setup.sh
```

### 📓 Notes
 
- Qtile calls an auto start script on login. (autostart.sh)[/qtile/autostart.sh]
    - Starts Nitrogen to set the wallpaper.
    - Starts polkit agent.
- Everything is current based around the [Dracula](https://draculatheme.com/) theme.
- Arandar can be used to setup a complex monitor setup and then save the layout to a script. Its worth adding this to your login script.

