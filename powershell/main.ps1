Invoke-Expression (&starship init powershell)

function Set-Gaming {
    Get-Process -Name "jetbrains-toolbox" -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-Process -Name "flameshot" -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-Process -Name "Grammarly.Desktop" -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-Process -Name "WhatsApp" -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-Process -Name "ArcControl" -ErrorAction SilentlyContinue | Stop-Process -Force
    Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue | Stop-Process -Force
    net stop "MSSQLSERVER" 
}


