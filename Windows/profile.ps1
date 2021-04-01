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

# 以上。
