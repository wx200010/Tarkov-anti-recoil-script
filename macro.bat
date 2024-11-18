@echo off
setlocal


powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command python D:\tarkovc\StupidSolutions26\tarkovPython\mainTarkov.py' -Verb RunAs"
