function prompt() {
	Write-Host ("[") -nonewline
	Write-Host ($env:USERNAME) -nonewline -foregroundcolor YELLOW
	Write-Host ("@") -nonewline -foregroundcolor RED
	Write-Host ($env:COMPUTERNAME) -nonewline -foregroundcolor GREEN
	Write-Host (" ") -nonewline
	Write-Host (Split-Path (Get-Location) -Leaf) -nonewline
	Write-Host ("]") -nonewline
	Write-Host (" ") -nonewline
	Write-Host (">") -nonewline

	return " "
}

$desktop = [Environment]::GetFolderPath('Desktop')
Set-Location $desktop

# 以上。
#	PowerShell用のシンタックスハイライトファイル：https://vim-jp.org/vimdoc-ja/ft_ps1.html
# vim: set ts=4 sts=4 sw=4 tw=0 ff=dos fenc=utf-8 ft=ps1 noexpandtab:
