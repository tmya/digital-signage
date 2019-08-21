# まだ未完成
# This program is incomplete

[string]$ConfigFilePath = ".\config.ps1"
[string]$TempSignageFilePath = ".\sign.odp"

#コンフィグを読む
. $ConfigFilePath

#サイネージファイルが存在しているかチェック
if (Test-Path $TempSignageFilePath)
{
    #サイネージファイルが新しいかチェック
    if((Get-ItemProperty $SignageFilePath).LastAccessTime -gt (Get-ItemProperty $TempSignageFilePath).LastAccessTime)
    {
        #新しいのを発見した
        #サイネージファイルを手元に持ってくる

        echo "持ってくる ファイルが新しい"
    }
    else
    {
        echo "ファイルが新しくない"
    }
}
else
{
    #サイネージファイルを手元に持ってくる
    echo "持ってくる ファイルが無い"
}


#LibreOffice Impressで実行
## soffice -show %filepath%.odp