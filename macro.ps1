# 定義進程名稱和腳本路徑
$processName = "塔科夫.ahk"
$tarkovPath = Join-Path -Path $PSScriptRoot -ChildPath "塔科夫.ahk"
$pythonPath = "D:\tarkovc\StupidSolutions26\tarkovPython\mainTarkov.py"
# 檢查是否有相關進程
$process = Get-Process AutoHotKeyU64
if ($null -eq $process) {
    Write-Output "Start to execute tarkov.ahk..."
    Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $tarkovPath;" -Verb RunAs

} else {
}

$process = Get-Process python
if ($null -eq $process) {
    Write-Output "Start to execute python..."
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command python $pythonPath;" -Verb RunAs

} else {
}
# Start-Sleep -Seconds 5