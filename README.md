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

## 🪟 Windows Installation

<sub><sup>⚠️ To many windows package managers! Maybe all winget someday 😥</sup></sub>

1. Install [Scoop](https://scoop.sh/)
2. Enable scoope buckets
```powershell
scoop bucket add extras
scoop bucket add nerd-fonts
```
3. Install [Chocolatey](https://chocolatey.org/install#individual)
4. Install [Winget](https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-gb&gl=gb&rtc=1)
4. Install packages development packages
```powershell
winget install Microsoft.PowerShell
winget install Microsoft.WindowsTerminal
scoop install lazygit starship gh nerd-fonts/JetBrains-Mono extras/jetbrains-toolbox
choco install flameshot firefox 7zip git vscode notion git-lfs
```
4. Install fun packages
```powershell
choco install discord spotify
```
5. Install [NVM Windows](https://github.com/coreybutler/nvm-windows)
6. Install Node LTS
```powershell
nvm install lts
nvm use lts
```
7. Install global node packages
```powershell
npm install -g git-cz
```
8. Login with GitHub CLI `gh auth login`
9. Run setup script. Symlinks are added with powershell
```powershell
./setup.ps1
```