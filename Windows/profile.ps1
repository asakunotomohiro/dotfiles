function prompt() {
	Write-Host ("[") -nonewline
	Write-Host ($env:USERNAME) -nonewline -foregroundcolor YELLOW
	Write-Host ("@") -nonewline -foregroundcolor RED
	Write-Host ($env:COMPUTERNAME) -nonewline -foregroundcolor GREEN
	Write-Host (" ") -nonewline
	Write-Host (Split-Path (Get-Location) -Leaf) -nonewline -foregroundcolor BLUE
	Write-Host ("]") -nonewline
	Write-Host (" ") -nonewline
	Write-Host (">") -nonewline

	return " "
}

$desktop = [Environment]::GetFolderPath('Desktop')
Set-Location $desktop

# Windows11の右クリック内容を従来のWindows10と同様にすべて展開した状態にする。
#New-ItemProperty -LiteralPath 'Registry::コンピューター\HKEY_CURRENT_USER\Software\Classes\CLSID' -Name 'AutoRun' -PropertyType 'String' -Value "`"${xxxxxxx}`"" -Force
#	※管理者権限で実行してください
$registryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
#	InprocServer32 キーの作成
New-Item -Path $registryPath -Force | Out-Null
#	既定値を空に設定
Set-ItemProperty -Path $registryPath -Name "(default)" -Value "" | Out-Null
Write-Host "端末再起動後、有効。" -ForegroundColor Green

# 以上。
#	PowerShell用のシンタックスハイライトファイル：https://vim-jp.org/vimdoc-ja/ft_ps1.html
# vim: set ts=4 sts=4 sw=4 tw=0 ff=dos fenc=utf-8 ft=ps1 noexpandtab:
