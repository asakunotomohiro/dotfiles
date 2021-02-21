# Windows10 + PowerShell5.1
$vimdir = "~\.vim\pack\minpac\opt"
$vimdirAfter = "~\.vim\after\ftplugin"
$vimbackdir = "~\.vim_backup"
$gitIgnoredir = "%XDG_CONFIG_HOME%/git/ignore"	# OS依存のGit用無視ファイル
$gitconfig = "~/.config/git/ignore"	# OS依存のGit用無視ファイル
if (Test-Path $vimdir) {
    echo $vimdir がある。
} else {
    echo $vimdir ない。
    New-Item -Path $vimdir -ItemType Directory
    New-Item -Path $vimbackdir -ItemType Directory
    New-Item -Path $vimdirAfter -ItemType Directory
}

$currentDir = pwd
cd $vimdir
git clone https://github.com/k-takata/minpac
cd $currentDir

New-Item -Force -Value './_vimrc' -Path '~/.vimrc' -ItemType SymbolicLink
New-Item -Force -Value './_gvimrc' -Path '~/.gvimrc' -ItemType SymbolicLink
#New-Item -Force -Value './_gitignore' -Path '~/.gitignore' -ItemType SymbolicLink
#	※ハードリンクの場合、実態を削除した場合も削除先に手繰り寄せて紐付けてしまうため、操作には気をつけること。


# 以下のプログラムでは管理者権限での実行が必要になる。
#	Start-Process powershell -Verb runAs
#	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
$document = [Environment]::GetFolderPath('MyDocuments')
$documentFile = "${document}\AutoHotkey.ahk"
New-Item -Force -Value './AutoHotkey.ahk' -Path "$documentFile" -ItemType SymbolicLink

# 以下、Sourcetree専用の設定。
$documentFile = "${document}\_gitignore_global.txt"
New-Item -Force -Value './_gitignore' -Path "$documentFile" -ItemType SymbolicLink
$documentFile = "${document}\_hgignore_global.txt"
New-Item -Force -Value './_gitignore' -Path "$documentFile" -ItemType SymbolicLink


# 以下の関数により、Vimの設定ファイルに追記する。

echo "mainからサブを呼び出す。"
.\subFunction\ftpplugVimFile.ps1
echo "呼び出し終わり"

#	※今の時代は、ハードリンクを使う必要がないはず。
