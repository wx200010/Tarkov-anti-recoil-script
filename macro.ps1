if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator")) {
    Write-Output "沒有管理員權限，正在重新以管理員模式啟動..."
    Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}


# 定義進程名稱和腳本路徑
$processName = "塔科夫.ahk"
$tarkovPath = Join-Path -Path $PSScriptRoot -ChildPath "塔科夫.ahk"
$pythonPath = "D:\tarkovc\MytarkovScript\tarkovPython\mainTarkov.py"
# 檢查是否有相關進程
$process = Get-Process AutoHotKeyU64
if ($null -eq $process) {
    Write-Output "Start to execute tarkov.ahk..."
    Start-Process -FilePath $tarkovPath
}
# 執行python
$process = Get-Process python
Stop-Process -Name "python" -Force
python $pythonPath
# Start-Sleep -Seconds 5