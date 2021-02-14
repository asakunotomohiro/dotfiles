# Windows10 + PowerShell5.1
New-Item -Force -Value './_vimrc' -Path '~/.vimrc' -ItemType HardLink
New-Item -Force -Value './_gvimrc' -Path '~/.gvimrc' -ItemType HardLink


# 以下のプログラムでは管理者権限での実行が必要になる。
#	Start-Process powershell -Verb runAs
#	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
$document = [Environment]::GetFolderPath('MyDocuments')
$documentFile = "${document}\AutoHotkey.ahk"
New-Item -Force -Value './AutoHotkey.ahk' -Path "$documentFile" -ItemType SymbolicLink


(Get-Item ./AutoHotkey.ahk).LinkType
(Get-Item "$documentFile").LinkType
(Get-Item ./AutoHotkey.ahk).Target
(Get-Item "$documentFile").Target
