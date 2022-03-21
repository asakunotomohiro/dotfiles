# Windows10 + PowerShell5.1
$vimdir = "~\.vim\pack\minpac\opt"
$vimdirAfter = "~\.vim\after\ftplugin"
$vimbackdir = "~\.vim_backup"
$vimsessiondir = "~\.vim_backup\sessions"
$vimundodir = "~\.vim_backup\undofile"
$gitIgnoredir = "%XDG_CONFIG_HOME%/git/ignore"	# OS依存のGit用無視ファイル
$gitconfig = "~/.config/git/ignore"	# OS依存のGit用無視ファイル
$gitconfig = "~/.config/git/"	# Git用設定ディレクトリ

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

if (Test-Path $vimdir) {
    echo $vimdir がある。
} else {
    echo $vimdir ない。
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
}

$currentDir = pwd

#	CapsLockをCtrlキーに変更する。
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

cd $vimdir
git clone https://github.com/k-takata/minpac

cd $currentDir

New-Item -Force -Value './_vimrc' -Path '~/.vimrc' -ItemType SymbolicLink
New-Item -Force -Value './_gvimrc' -Path '~/.gvimrc' -ItemType SymbolicLink
New-Item -Force -Value './_gitconfig' -Path '~/.gitconfig' -ItemType SymbolicLink
New-Item -Force -Value './Android/_bashrc' -Path '~/.bashrc' -ItemType SymbolicLink
New-Item -Force -Value './Windows/_bashrc_sub' -Path '~/.bashrc_sub' -ItemType SymbolicLink
New-Item -Force -Value './MacOS/_profile_common_Alias' -Path '~/.profile_common_Alias' -ItemType SymbolicLink
New-Item -Force -Value './MacOS/_inputrc' -Path '~/.inputrc' -ItemType SymbolicLink
# 以下は、Visual Studio 2019のプラグイン用vimrc(https://github.com/VsVim/VsVim)
New-Item -Force -Value './_vsvimrc' -Path '~/.vsvimrc' -ItemType SymbolicLink
#	以下は、普通のコピー
Copy-Item -Path './_gitconfig.private-local' -Destination '~/.gitconfig.private-local'
#New-Item -Force -Value './_gitconfig.private-local' -Path '~/.gitconfig.private-local' -ItemType SymbolicLink

$systemdir = $Env:PSModulePath -split (';')
foreach ( $shellpath in $systemdir ) {
	if( $shellpath -like "*system32*") {
		$systemdir = $shellpath
		break
	}
}
$shellpath = $shellpath.Replace("Modules", "profile.ps1")
New-Item -Force -Value '.\Windows\profile.ps1' -Path $shellpath -ItemType SymbolicLink

Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\Blind Access' -Name 'On' -Value 0

$document = [Environment]::GetFolderPath('MyDocuments')
$documentFile = "${document}\AutoHotkey.ahk"
New-Item -Force -Value '.\Windows\AutoHotkey.ahk' -Path "$documentFile" -ItemType SymbolicLink

# vimエディタの挙動に干渉するため、実施不可。
#$documentFile = "${document}\alias.bat"
#New-Item -Force -Value '.\Windows\alias.bat' -Path "$documentFile" -ItemType SymbolicLink

$userStartup = [Environment]::GetFolderPath('CommonStartup')
$userStartupFile = "${userStartup}\AutoHotkey.ahk"
New-Item -Force -Value '.\Windows\AutoHotkey.ahk' -Path "$userStartupFile" -ItemType SymbolicLink

#$documentFile = "${document}\gitignore_global.txt"
$documentFile = "$HOME\.config\git\.gitignore_global"
New-Item -Force -Value '.\_gitignore_global' -Path "$documentFile" -ItemType SymbolicLink

#	AutoHotKeyで対応する(もしくは、Windows10以降「設定=>時刻と言語=>言語=>優先する言語の日本語のオプション=>レイアウトを変更する」で対応可能)。
#New-ItemProperty -LiteralPath 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout' -Name 'Scancode Map' -PropertyType 'Binary' -Value $bin -Force
#New-ItemProperty -LiteralPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor' -Name 'AutoRun' -PropertyType 'String' -Value "`"${documentFile}`"" -Force


#	AutoHotkeyでのWin+Ctrl+Alt+Shiftの組み合わせをOffice Online画面の起動を抑止するための措置。
cmd /D /U /C 'REG ADD "HKEY_CURRENT_USER\Software\Classes\ms-officeapp\Shell\Open\Command" /t REG_SZ /d rundll32'

# 以下、AutoHotkeyで定義しているPath用に合わせるショートカットファイルの作成。
# New-Item -Force -Value '[ここに個人がインストールしているexeファイルPathを指定する]' -Path 'C:\Program Files\Minecraft\MinecraftLauncher.exe' -ItemType SymbolicLink


# 以下の関数により、Vimの設定ファイルに追記する。

echo "mainからサブを呼び出す。"
.\subFunction\ftpplugVimFile.ps1 "subFunction"
echo "呼び出し終わり"

#	※今の時代は、ハードリンクを使う必要がない。
# 以上。
