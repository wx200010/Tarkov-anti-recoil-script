@echo off
set location=D:\tarkovc\MytarkovScript\tarkovPython\mainTarkov.py

powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command python %location%;  Start-Sleep -Seconds 5' -Verb RunAs"