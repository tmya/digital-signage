# digital-signage
An simple digital signage system with LibreOffice Impress on Windows 10 PowerShell

## What's this.

Simple setup to simple digital signage system for PC on a stick.

I'm using this digital signage system in a certain hospital in Japan.

### What's required.

1. Monitor. Pherhaps, need HDMI connector.
1. One PC. I choiced PC on a stick with HDMI output. It mounted backside on TV. Including Windows10.
1. LibreOffice(Software). Free office suite, Awesome work. [LibreOffice The Document Foundation](libreoffice.org)
1. File share server or like it. I'm using Synology NAS. You could choose other way. Of course I mean that in a good way.

### Sequence of start script.

1. Check $SignageFilePath is modified.
1. If modified Copy from new $SignageFilePath file to current folder.
1. Start soffice.exe with -show options.(Automaticlly start presentation.)

## How it works.

Require: Libreoffice Impress

1. Create blank file "config.ps1". it's same folder with "signage.ps1".
1. Edit "config.ps1" add first line, `[string]$SignageFilePath = "C:\some\path\ds.odp"` (You should change this file path config.)
1. Add second line, `[string]$LibreOfficePath = "C:\Program Files\LibreOffice\program\soffice.exe"` (It's default 64bit installation. If you not, change this file path config.)
1. If you want to start on boot add (signage.ps1 or signage.bat) to taskschd.msc. (Need set Working folder.)

Example of config.ps1

```
[string]$SignageFilePath = "\\nas\some\path\ds.odp"
[string]$LibreOfficePath = "C:\Program Files\LibreOffice\program\soffice.exe"
```

### Notice.

Sometimes, cannot execute powershell(signage.ps1) due to Windows execution policy.
In this case, You can choose two options.

- You should execution powershell via command prompt with execution policy option. (Includes bat file in this project.)
- You should change execution policy after escalate to administrator in PowerShell commands. (You'll take some security concerns.)

For more information, see [Set-ExecutionPolicy : Microsoft](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6)
