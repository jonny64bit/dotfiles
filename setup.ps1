function Update-Link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target -Force
}

$appData = (Get-Item -Path Env:appdata).Value
$userProfile = $env:USERPROFILE

# Lazygit 🦥
$lazygitConfig = Join-Path $PSScriptRoot "lazygit\config.yml"
$lazygitFolder = $appData + "\lazygit\"

if (-not (Test-Path -LiteralPath $lazygitFolder)) {
    New-Item -ItemType Directory $lazygitFolder
}

Write-Host $lazygitConfig
Update-Link $lazygitConfig ($lazygitFolder + "\config.yml")

# PowerShell Profile
if (-not (Test-Path -LiteralPath $Profile)) {
    New-Item -ItemType File $Profile -Force
}

$powerShellRoot = Join-Path $PSScriptRoot "powershell\main.ps1"
Write-Host $powerShellRoot
$powerShellRoot | Out-File -FilePath $Profile

#IdeaVim
$ideaVimConfig = Join-Path $PSScriptRoot ".\ideavim\.ideavimrc"
Update-Link $ideaVimConfig ($userProfile + "\.ideavimrc")

# Alacritty 🦥
$alacrittyConfig = Join-Path $PSScriptRoot "alacritty-windows\alacritty.yml"
$alacrittyThemeConfig = Join-Path $PSScriptRoot "alacritty-windows\themes\dracula.yml"
$alacrittyFolder = $appData + "\alacritty\"
$alacrittyThemesFolder = $appData + "\alacritty\themes\"

if (-not (Test-Path -LiteralPath $alacrittyFolder)) {
    New-Item -ItemType Directory $alacrittyFolder
}
if (-not (Test-Path -LiteralPath $alacrittyThemesFolder)) {
    New-Item -ItemType Directory $alacrittyThemesFolder
}

Update-Link $alacrittyConfig ($alacrittyFolder + "\alacritty.yml")
Update-Link $alacrittyThemeConfig ($alacrittyThemesFolder + "\dracula.yml")