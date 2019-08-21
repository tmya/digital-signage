# digital-signage
An simple digital signage system with LibreOffice Impress on Windows 10 PowerShell

## Important notice.

This project is incompleted. Make it will soon.

## What's this.

simple setup to light digital signage system for PC on a stick.

### Sequence of start script.

1. Check $SignageFilePath is modified.
1. If modified Copy from new $SignageFilePath file to current folder.
1. Start soffice.exe with -show options.(Automaticlly start presentation.)

## How it works.

Require: Libreoffice Impress

1. Create file "config.ps1". it's same folder with "signage.ps1".
1. Edit "config.ps1" add first line, '[string]$SignageFilePath = "C:\some\path\ds.odp"'
1. add second line, '[string]$LibreOfficePath = "C:\Program Files\LibreOffice\program\soffice.exe"' (It's default 64bit installation. If you not, change this.)
1. If you want to start on boot add task to taskschd.msc.

Example of config.ps1

```
[string]$SignageFilePath = "C:\some\path\ds.odp"
[string]$LibreOfficePath = "C:\Program Files\LibreOffice\program\soffice.exe"
```

