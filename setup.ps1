function Update-Link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

$appData = (Get-Item -Path Env:appdata).Value

$lazygitConfig = Join-Path $PSScriptRoot lazygit config.yml
$lazygitFolder = $appData + "\lazygit\"

if (-not (Test-Path -LiteralPath $lazygitFolder)) {
    New-Item -ItemType Directory $lazygitFolder
}

Write-Host $lazygitConfig
Update-Link $lazygitConfig ($lazygitFolder + "\config.yml")