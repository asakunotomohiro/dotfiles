# このシステムではスクリプトの実行が無効になっているため、ファイル C:\Users\asakuno tomohiro\Desktop\ftpplugVimFile.ps1 を読み込むことができません。詳細については、「about_Execution_Policies」(https://go.microsoft.com/fwlink/?LinkID=135170) を参照してください。
#    + CategoryInfo          : セキュリティ エラー: (: ) []、ParentContainsErrorRecordException
#    + FullyQualifiedErrorId : UnauthorizedAccess
# ※以下対策コマンド
# Start-Process powershell -Verb runAs
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

Param(
	[String]$Arg1 = ""
)

# Windows10 + PowerShell5.1
$vimdir = "~\.vim\pack\minpac\opt"
$vimdirAfter = "~\.vim\after\ftplugin"
$vimbackdir = "~\.vim_backup"
if (Test-Path $vimdir) {
    echo $vimdir がある。
} else {
	echo $vimdir ない。
	New-Item -Path $vimdir -ItemType Directory
	New-Item -Path $vimbackdir -ItemType Directory
	New-Item -Path $vimdirAfter -ItemType Directory
}

# 以下、シンボリックファイル作成先のディレクトリ内のvimファイルをごっそり削除する。
$vimAfterFiles = (Get-ChildItem -Path $vimdirAfter\*.vim -File).FullName
foreach ( $fileVim in $vimAfterFiles ) {
	echo "---- $fileVim ---"
	Remove-Item $fileVim -Force
}

if ("$Arg1" -eq "" ) {
	$fileArray = (Get-ChildItem -Path .\vimFtplugin\*.vim -File).FullName
}
else {
	$fileArray = (Get-ChildItem -Path $Arg1\vimFtplugin\*.vim -File).FullName
}

foreach($pathFile in $fileArray){
	$fileInfo = Get-ChildItem -Path $pathFile
	$fileName = $fileInfo.Name
	Write-Host $vimdirAfter\$fileName
	New-Item -Force -Value "$pathFile" -Path "$vimdirAfter\$fileName" -ItemType SymbolicLink
}


# ここまで。
# vim: set ts=4 sts=4 sw=4 tw=0 ff=dos fenc=utf-8 ft=powershell noexpandtab:
