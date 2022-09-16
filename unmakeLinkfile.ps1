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
Remove-Item '~/.lesshst' -Recurse -Force
Remove-Item '~/.minttyrc' -Recurse -Force
Remove-Item '~/.bashrc' -Recurse -Force
Remove-Item '~/.config/shell/bashrc_sub' -Recurse -Force
Remove-Item '~/.bash_history' -Recurse -Force
Remove-Item '~/.bash_profile' -Recurse -Force
Remove-Item '~/.config/shell/profile_common_Alias' -Recurse -Force
Remove-Item '~/.config/shell/profile_common_EnvironmentVariable' -Recurse -Force
Remove-Item '~/.vimrc' -Recurse -Force
Remove-Item '~/.gvimrc' -Recurse -Force
Remove-Item '~/.viminfo' -Recurse -Force
Remove-Item '~/_viminfo' -Recurse -Force
Remove-Item '~/.vsvimrc' -Recurse -Force
Remove-Item '~/.config/git/ignore' -Recurse -Force
Remove-Item '~/.config/git/gitk' -Recurse -Force
Remove-Item '~/.config/git/gitconfig.private-local' -Recurse -Force
Remove-Item '~/.gitconfig' -Recurse -Force

Remove-Item '~/NTUSER.DAT' -Recurse -Force
Remove-Item '~/.wslconfig' -Recurse -Force

# 以下、ディレクトリ配下の削除。

# 以下、ディレクトリごと削除。
Remove-Item -Path '~/.vim' -Recurse -Force
Remove-Item -Path '~/.vim_backup/sessions' -Recurse -Force
Remove-Item -Path '~/.vim_backup/undofile' -Recurse -Force
Get-ChildItem -Path '~/.vim_backup/winmerge/*' | ForEach-Object{if( -not $_.PSIsContainer ){ Remove-Item $_.FullName -Force }}
Get-ChildItem -Path '~/.vim_backup/teraTerm/*' | ForEach-Object{if( -not $_.PSIsContainer ){ Remove-Item $_.FullName -Force }}
Get-ChildItem -Path '~/.vim_backup/*' | ForEach-Object{if( -not $_.PSIsContainer ){ Remove-Item $_.FullName -Force }}

# 以下のプログラムでは管理者権限での実行が必要になる。
#	Start-Process powershell -Verb runAs
#	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
$document = [Environment]::GetFolderPath('MyDocuments')

$documentFile = "${document}\AutoHotkey.ahk"
Remove-Item $documentFile -Recurse -Force
$documentFile = "${document}\TERATERM.INI"
Remove-Item $documentFile -Recurse -Force

# 以下、配置していない。
#$documentFile = "${document}\gitignore_global.txt"
#Remove-Item $documentFile -Recurse -Force

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
#	※AutoHotKyeで対応するため、ここはコメントアウトしている。
#cmd /D /U /C 'REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f'
#	オプションを付けた場合、エラーになってしまい、空にできなかった。

# スタートアップ配下のAutoHotkeyファイル削除
$startup = [Environment]::GetFolderPath('CommonStartup')
$startupFile = "${startup}\AutoHotkey.ahk.lnk"

Remove-Item "${startupFile}" -Recurse -Force
echo $startupFile

# 以下、ディレクトリごと削除。
Remove-Item -Path '~/.android' -Recurse -Force
Remove-Item -Path '~/.AndroidStudio3.1' -Recurse -Force
Remove-Item -Path '~/.AndroidStudio3.2' -Recurse -Force
Remove-Item -Path '~/.cache' -Recurse -Force
Remove-Item -Path '~/.CocosCreator' -Recurse -Force
Remove-Item -Path '~/.cryengine' -Recurse -Force
Remove-Item -Path '~/.dlv' -Recurse -Force
Remove-Item -Path '~/.dotnet' -Recurse -Force
Remove-Item -Path '~/.eclipse' -Recurse -Force
Remove-Item -Path '~/.idlerc' -Recurse -Force
Remove-Item -Path '~/.omnisharp' -Recurse -Force
Remove-Item -Path '~/.Origin' -Recurse -Force
Remove-Item -Path '~/.perl6' -Recurse -Force
Remove-Item -Path '~/.prefs' -Recurse -Force
Remove-Item -Path '~/.QtWebEngineProcess' -Recurse -Force
Remove-Item -Path '~/.tooling' -Recurse -Force
Remove-Item -Path '~/.vscode' -Recurse -Force
Remove-Item -Path '~/go' -Recurse -Force
Remove-Item -Path '~/' -Recurse -Force
Remove-Item -Path '~/' -Recurse -Force
Remove-Item -Path '~/' -Recurse -Force

#	以上。
# vim: set ts=4 sts=4 sw=4 tw=0 ff=dos fenc=utf-8 ft=powershell noexpandtab:
