# Windows10 + PowerShell5.1
New-Item -Force -Value './_vimrc' -Path '~/.vimrc' -ItemType SymbolicLink
New-Item -Force -Value './_gvimrc' -Path '~/.gvimrc' -ItemType SymbolicLink
#	※ハードリンクの場合、実態を削除した場合も削除先に手繰り寄せて紐付けてしまうため、操作には気をつけること。


# 以下のプログラムでは管理者権限での実行が必要になる。
#	Start-Process powershell -Verb runAs
#	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
$document = [Environment]::GetFolderPath('MyDocuments')
$documentFile = "${document}\AutoHotkey.ahk"
New-Item -Force -Value './AutoHotkey.ahk' -Path "$documentFile" -ItemType HardLink

