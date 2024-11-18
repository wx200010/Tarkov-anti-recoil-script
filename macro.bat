@echo off
setlocal


powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command python .\tarkovPython\mainTarkov.py' -Verb RunAs"
