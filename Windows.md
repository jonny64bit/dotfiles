# Windows 🪟 

## Install

1. Install [Scoop](https://scoop.sh/)
2. Enable scoope buckets
```powershell
scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts
```
3. Install [Winget](https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-gb&gl=gb&rtc=1)
4. Install packages development packages
```powershell
winget install Microsoft.PowerShell
winget install Microsoft.WindowsTerminal
scoop install main/lazygit main/starship main/gh nerd-fonts/JetBrains-Mono extras/jetbrains-toolbox main/gcc main/neovim extras/alacritty main/ripgrep main/fd extras/flameshot main/7zip main/git main/git-lfs extras/vscode
```
5. Install fun packages
```powershell
choco install discord spotify
```
6. Install [NVM Windows](https://github.com/coreybutler/nvm-windows)
7. Install Node LTS
```powershell
nvm install lts
nvm use lts
```
8. Install global node packages
```powershell
npm install -g git-cz
```
9. Login with GitHub CLI `gh auth login`
10. Run setup script. Symlinks are added with powershell
```powershell
./setup.ps1
```

## Updates!

1. Update scoop packages
```powershell
scoop update *
```
2. Update Winget packages
```powershell
winget upgrade --all
```
3. Update nvm version
```powershell
nvm install lts
nvm use lts
```
4. Update
```powershell
npm update -g
```
