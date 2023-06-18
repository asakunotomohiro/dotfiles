# Windows10 + PowerShell5.1
$vimdir = "~\.vim\pack\minpac\opt"
$vimdirAfter = "~\.vim\after\ftplugin"
$vimbackdir = "~\.vim_backup"
$vimsessiondir = "~\.vim_backup\sessions"
$vimundodir = "~\.vim_backup\undofile"
$gitIgnoredir = "%XDG_CONFIG_HOME%/git/"	# OS依存のGit用無視ファイル
#$gitconfig = "~/.config/git/ignore"	# OS依存のGit用無視ファイル
$gitconfig = "~/.config/git/"	# Git用設定ディレクトリ
$firsttarodir = "~\.vim_backup\Taro"
$teraTermdir = "~\.vim_backup\teraTerm"
$winmergedir = "~\.vim_backup\winmerge"

$vimdirColors = "~\.vim\colors"
$vimdirCompiler = "~\.vim\compiler"
$vimdirDoc = "~\.vim\doc"
$vimdirFtdetect = "~\.vim\ftdetect"
$vimdirFtplugin = "~\.vim\ftplugin"
$vimdirIndent = "~\.vim\indent"
$vimdirKeymap = "~\.vim\keymap"
$vimdirPlugin = "~\.vim\plugin"
$vimdirSyntax = "~\.vim\syntax"

# 管理者権限での実行。
#	Start-Process powershell -Verb runAs
#	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

#if (Test-Path $vimdir) {
#    echo $vimdir がある。
#} else {
#    echo $vimdir ない。
    New-Item -Path $vimdir -ItemType Directory
    New-Item -Path $vimbackdir -ItemType Directory
    New-Item -Path $vimsessiondir -ItemType Directory
    New-Item -Path $vimundodir -ItemType Directory
    New-Item -Path $vimdirAfter -ItemType Directory

    New-Item -Path $vimdirColors -ItemType Directory
    New-Item -Path $vimdirCompiler -ItemType Directory
    New-Item -Path $vimdirDoc -ItemType Directory
    New-Item -Path $vimdirFtdetect -ItemType Directory
    New-Item -Path $vimdirIndent -ItemType Directory
    New-Item -Path $vimdirKeymap -ItemType Directory
    New-Item -Path $vimdirPlugin -ItemType Directory
    New-Item -Path $vimdirSyntax -ItemType Directory

    New-Item -Path $gitconfig -ItemType Directory

    New-Item -Path $firsttarodir -ItemType Directory
    New-Item -Path $teraTermdir -ItemType Directory
    New-Item -Path $winmergedir -ItemType Directory
#}

$currentDir = pwd

# CapsLockをCtrlキーに変更するレジストリ追加作業。
#	https://forest.watch.impress.co.jp/docs/serial/nyanwin/1261604.html
#	https://docs.microsoft.com/en-us/sysinternals/downloads/ctrl2cap
$bin = @()
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x02
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x1d
$bin += [byte]0x00
$bin += [byte]0x3a
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00
$bin += [byte]0x00

$iam=HOSTNAME.EXE
$username=(Get-ChildItem Env:\USERNAME).Value
#takeown /r /s $iam /u "$username" /f "$vimdir"	これを付けなければ、権限の問題でエラーになるが、実行エラーで上手く権限変更できない。
cd $vimdir
git clone https://github.com/k-takata/minpac

cd $currentDir

New-Item -Force -Value './_vimrc' -Path '~/.vimrc' -ItemType SymbolicLink
New-Item -Force -Value './_gvimrc' -Path '~/.gvimrc' -ItemType SymbolicLink
New-Item -Force -Value './_gitconfig' -Path '~/.gitconfig' -ItemType SymbolicLink
New-Item -Force -Value './Android/_bashrc' -Path '~/.bashrc' -ItemType SymbolicLink
New-Item -Force -Value './Windows/_bashrc_sub' -Path '~/.config/shell/bashrc_sub' -ItemType SymbolicLink
New-Item -Force -Value './MacOS/_profile_common_Alias' -Path '~/.config/shell/profile_common_Alias' -ItemType SymbolicLink
New-Item -Force -Value './MacOS/_profile_common_EnvironmentVariable' -Path '~/.config/shell/profile_common_EnvironmentVariable' -ItemType SymbolicLink
New-Item -Force -Value './MacOS/_bash_profile' -Path '~/.bash_profile' -ItemType SymbolicLink
New-Item -Force -Value './Android/_inputrc' -Path '~/.inputrc' -ItemType SymbolicLink
# 以下は、Visual Studio 2019のプラグイン用vimrc(https://github.com/VsVim/VsVim)
New-Item -Force -Value './_vsvimrc' -Path '~/.vsvimrc' -ItemType SymbolicLink
#	以下は、普通のコピー
Copy-Item -Path './_gitconfig.private-local' -Destination '~/.config/git/gitconfig.private-local'
#New-Item -Force -Value './_gitconfig.private-local' -Path '~/.gitconfig.private-local' -ItemType SymbolicLink

$systemdir = $Env:PSModulePath -split (';')
foreach ( $shellpath in $systemdir ) {
	if( $shellpath -like "*system32*") {
		$systemdir = $shellpath
		break
	}
}
# 以下、PowerShellのプロンプト表記変更用ショートカットファイルの作成。
$shellpath = $shellpath.Replace("Modules", "profile.ps1")
New-Item -Force -Value '.\Windows\profile.ps1' -Path $shellpath -ItemType SymbolicLink

# PowerShell起動時の警告'PSReadLine の無効化'表記を抑止するための措置(Import-Module PSReadLineを打てば解決するようだが・・・)。
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\Blind Access' -Name 'On' -Value 0

# AutoHotkeyファイルのショートカットファイルの作成。
#	マイドキュメントディレクトリ取得
$document = [Environment]::GetFolderPath('MyDocuments')
#	AutoHotkeyファイルのショートカットファイルの作成。
$documentFile = "${document}\AutoHotkey.ahk"
New-Item -Force -Value '.\Windows\AutoHotkey.ahk' -Path "$documentFile" -ItemType SymbolicLink

$documentFile = "${document}\TERATERM.INI"
New-Item -Force -Value '.\configSettingFile(個々のソフトウェアから読み込み)\TERATERM.INI' -Path "$documentFile" -ItemType SymbolicLink

#	コマンドプロンプト上でのエイリアスファイルの作成。
#		※vimエディタの挙動に干渉するため、実施不可。
#$documentFile = "${document}\alias.bat"
#New-Item -Force -Value '.\Windows\alias.bat' -Path "$documentFile" -ItemType SymbolicLink

#	以下、全ユーザ向けのスタートアップ用ディレクトリ。
$userStartup = [Environment]::GetFolderPath('CommonStartup')
#		以下、個別ユーザ向けのスタートアップ用ディレクトリ。
#$userStartup = [Environment]::GetFolderPath('Startup')
$userStartupFile = "${userStartup}\AutoHotkey.ahk"
New-Item -Force -Value '.\Windows\AutoHotkey.ahk' -Path "$userStartupFile" -ItemType SymbolicLink

#	以下、Gitのコミット対象制限ファイルの配布。
#$documentFile = "${document}\gitignore_global.txt"
#$documentFile = "$HOME\.config\git\.gitignore_global"
$documentFile = "$HOME\.config\git\ignore"
New-Item -Force -Value '.\_gitignore_global' -Path "$documentFile" -ItemType SymbolicLink

#	TODO: 以下、次回作成できるように設定する(削除も行うこと)。
#$documentFile = "$HOME\.config\git\stCommitMsg"
#New-Item -Force -Value '.\_stCommitMsg' -Path "$documentFile" -ItemType SymbolicLink

#	コマンドプロンプト上でのエイリアス設定。
#New-ItemProperty -LiteralPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor' -Name 'AutoRun' -PropertyType 'String' -Value "`"${documentFile}`"" -Force
#	以下、CapsLockをCtrlキーに変更する。
#New-ItemProperty -LiteralPath 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout' -Name 'Scancode Map' -PropertyType 'Binary' -Value $bin -Force

# 英語キーボード用に変更。
#	AutoHotKeyで対応する(もしくは、Windows10以降「設定=>時刻と言語=>言語=>優先する言語の日本語のオプション=>レイアウトを変更する」で対応可能)。

#	AutoHotkeyでのWin+Ctrl+Alt+Shiftの組み合わせをOffice Online画面の起動を抑止するための措置。
#		https://www.atmarkit.co.jp/ait/articles/1005/19/news108_4.html
#			HKEY_CURRENT_USER に 「HKCU:」
#			HKEY_LOCAL_MACHINE に 「HKLM:」
#	https://superuser.com/questions/1457073/how-do-i-disable-specific-windows-10-office-keyboard-shortcut-ctrlshiftwinal
cmd /D /U /C 'REG ADD "HKEY_CURRENT_USER\Software\Classes\ms-officeapp\Shell\Open\Command" /t REG_SZ /d rundll32 /f'

# 以下、AutoHotkeyで定義しているPath用に合わせるショートカットファイルの作成。
# New-Item -Force -Value '[ここに個人がインストールしているexeファイルPathを指定する]' -Path 'C:\Program Files\Minecraft\MinecraftLauncher.exe' -ItemType SymbolicLink


# 以下の関数により、Vimの設定ファイルに追記する。

echo "mainからサブを呼び出す。"
.\subFunction\ftpplugVimFile.ps1 "subFunction"
echo "呼び出し終わり"

echo "gitconfigを定着させた後に、再度git cloneを実行する必要がある。"
echo "　　勝手に改行を変更する仕様のため、実際にお試し運用してから本番運用に移行すること。"

#	※今の時代は、ハードリンクを使う必要がない。
# 以上。
# vim: set ts=4 sts=4 sw=4 tw=0 ff=dos fenc=utf-8 ft=powershell noexpandtab:
