# SPDX-License-Identifier: MIT
# Copyright (C) 2019 Akio Tomita

#=============================================================
# v 1.0 2019/08/23
#=============================================================

#=============================================================
# Settings (may not be change this config.)
#=============================================================
[string]$ConfigFilePath = ".\config.ps1"
[string]$CurrentSignageFile = "sign.odp"

#=============================================================
# Include Config
#=============================================================
. $ConfigFilePath

#=============================================================
# SubModule : CopyFromSource / Copy source to destination via temporary file.
#=============================================================
function CopyFromSource ([string]$SourcePath, [string]$DestinationPath)
{
    try
    {
        $TempFile = New-TemporaryFile                            #Create temporary file object.
        Copy-Item $SourcePath $TempFile.FullName                 #Copy source to temp.
        Move-Item ($TempFile.FullName) $DestinationPath -Force   #Move temp to destination(with override option).
    }
    catch
    {
        Write-Error("error: can't copy or move")
        # ... If you know, Could you tell me how to program error handling?
    }
}

#=============================================================
# Main()
#=============================================================
#Join path.
[string]$CurrentSignageFilePath = Join-Path $PSScriptRoot $CurrentSignageFile

#If file exist more checking something.
if (Test-Path $CurrentSignageFilePath)
{
    #If newer file exist.
    if((Get-ItemProperty $SignageFilePath).LastAccessTime -gt (Get-ItemProperty $CurrentSignageFilePath).LastAccessTime)
    {
        #File has been updated. Copy from source.
        CopyFromSource $SignageFilePath $CurrentSignageFilePath
    }
    else
    {
        #File is not modified. Nothing to do.
    }
}
else
{
    #File was not found. Copy from source.
    CopyFromSource $SignageFilePath $CurrentSignageFilePath
}

#Execute slide show on LibreOffice Impress.
& "$LibreOfficePath" -show $CurrentSignageFilePath