# digital-signage
An simple digital signage system with LibreOffice Impress on Windows 10 PowerShell

## What's this.

simple setup to simple digital signage system for PC on a stick.

### Sequence of start script.

1. Check $SignageFilePath is modified.
1. If modified Copy from new $SignageFilePath file to current folder.
1. Start soffice.exe with -show options.(Automaticlly start presentation.)

## How it works.

Require: Libreoffice Impress

1. Create blank file "config.ps1". it's same folder with "signage.ps1".
1. Edit "config.ps1" add first line, `[string]$SignageFilePath = "C:\some\path\ds.odp"` (You should change this file path config.)
1. add second line, `[string]$LibreOfficePath = "C:\Program Files\LibreOffice\program\soffice.exe"` (It's default 64bit installation. If you not, change this file path config.)
1. If you want to start on boot add (signage.ps1 or signage.bat) to taskschd.msc.

### Notice.

Sometimes, cannot execute powershell(signage.ps1) due to Windows execution policy.
In this case, You can choose two options.

- You should execution powershell via command prompt with execution policy option. (Includes bat file in this project.)
- You should change execution policy after escalate to administrator in PowerShell commands.

For more information, see [Set-ExecutionPolicy : Microsoft](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6)

Example of config.ps1

```
[string]$SignageFilePath = "C:\some\path\ds.odp"
[string]$LibreOfficePath = "C:\Program Files\LibreOffice\program\soffice.exe"
```

