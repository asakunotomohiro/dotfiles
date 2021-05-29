# Windows10 + PowerShell5.1
#	リンクファイルの削除シェル

$vimdir = "~\.vim"
$vimdir = "~\vimfiles"
$vimbackdir = "~\.vim_backup"
if (Test-Path $vimdir) {
	Remove-Item $vimdir -Recurse -Force
	Remove-Item $vimbackdir -Recurse -Force
} else {
    echo $vimdir ない。
}


Remove-Item '~/.inputrc' -Recurse -Force
Remove-Item '~/.bashrc' -Recurse -Force
Remove-Item '~/.bashrc_sub' -Recurse -Force
Remove-Item '~/.bash_history' -Recurse -Force
Remove-Item '~/.profile_common_Alias' -Recurse -Force
Remove-Item '~/.vimrc' -Recurse -Force
Remove-Item '~/.gvimrc' -Recurse -Force
Remove-Item '~/.viminfo' -Recurse -Force
Remove-Item '~/_viminfo' -Recurse -Force
Remove-Item '~/.gitconfig' -Recurse -Force
Remove-Item '~/.gitconfig.private-local' -Recurse -Force

# 以下のプログラムでは管理者権限での実行が必要になる。
#	Start-Process powershell -Verb runAs
#	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
$document = [Environment]::GetFolderPath('MyDocuments')

$documentFile = "${document}\AutoHotkey.ahk"
Remove-Item $documentFile -Recurse -Force

# コマンドプロンプトのエイリアス設定削除。
$documentFile = "${document}\alias.bat"
Remove-Item $documentFile -Recurse -Force
Remove-ItemProperty -LiteralPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor' -Name 'AutoRun'
#Remove-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor' -Name 'AutoRun'

# PowerShell対象の変更を戻す。
#	以下、プロンプト表記のファイルを削除する。
Remove-Item 'C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1' -Recurse -Force
#	以下は、もともと0だった場合も1に変更することになる。
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\Blind Access' -Name 'On' -Value 1

#	Commandキーそのものが消える。(既定)だけを削除したかったが、できず。
#		作成時は、Shellを含むその配下のキーがまるごと無かった。
#		しかし、今回削除するときに、Commandキーに他の値が設定されていた場合の削除を考えなければ、他で影響が出そうだ。
Remove-Item -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Classes\ms-officeapp\Shell\Open\Command' 
#		作成の時のように、コマンドプロンプトで削除すればいいのかもしれない。

# Caps LockキーをCtrlキーに置き換えたレジストリを削除する。
cmd /D /U /C 'REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f'
#	オプションを付けた場合、エラーになってしまい、空にできなかった。

# スタートアップ配下のAutoHotkeyファイル削除
$startup = [Environment]::GetFolderPath('CommonStartup')
$startupFile = "${startup}\AutoHotkey.ahk.lnk"

Remove-Item "${startupFile}" -Recurse -Force
echo $startupFile


#	以上。
