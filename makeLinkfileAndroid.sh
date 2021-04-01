#!/bin/bash
#	■droidVimの場合、以下のPathになる。
#	!/system/bin/sh
#		サブシェルにも手を加える。

# 本ファイルは、Android10OSに未対応。

#	★
#		■	droidVimで実行する場合は、ホームディレクトリ以外でgit cloneを実行すること。
#		□	アプリアップデートで消えるはずなので・・・。
#	☆

#	ssh用に秘密鍵をAndroidOSに配置しておく必要がある。
#		しかし、ssh-keygenコマンドは存在しない。

echo "ドットファイル作成開始"

filedir=`pwd`
echo "$filedir"

VIMDIR=~/.vim/pack/minpac/opt
VIMDIRAFTER=~/.vim/after/ftplugin
VIMBACDIR=~/.vim_backup
VIMUNDODIR=~/.vim_backup/undofile
VIMSESSIONDIR=~/.vim_backup/sessions

VIMDIAUTOLOAD=~/.vim/autoload
VIMDIRCOLORS=~/.vim/colors
VIMDIRDOC=~/.vim/doc
VIMDIRFTPLUGIN=~/.vim/ftplugin
VIMDIRPLUGIN=~/.vim/plugin
VIMDIRSYNTAX=~/.vim/syntax

VIMDIRCOMPILER=~/.vim/compiler
VIMDIRFTDETECT=~/.vim/ftdetect
VIMDIRINDENT=~/.vim/indent
VIMDIRKEYMAP=~/.vim/keymap

GITSSH=~/.ssh
GITGNORE=~/.config/git

#if [ -d $VIMDIR ]; then
	echo "vim環境を作成する。"
	mkdir -p $VIMDIR
	mkdir -p $VIMDIAUTOLOAD
	mkdir -p $VIMBACDIR
	mkdir -p $VIMUNDODIR
	mkdir -p $VIMSESSIONDIR
	mkdir -p $VIMDIRAFTER

	mkdir -p $VIMDIRCOLORS
	mkdir -p $VIMDIRCOMPILER
	mkdir -p $VIMDIRDOC
	mkdir -p $VIMDIRFTDETECT
	mkdir -p $VIMDIRINDENT
	mkdir -p $VIMDIRKEYMAP
	mkdir -p $VIMDIRPLUGIN
	mkdir -p $VIMDIRSYNTAX

	mkdir -p $GITSSH
	mkdir -p $GITGNORE

	touch $GITSSH/config
	chmod 600 $GITSSH/config
#fi

ANDROIDHOME=/storage/emulated/0/dotfiles
if [ -d ${ANDROIDHOME} ]; then
	echo ドットファイルリポジトリあり。
else
	echo なし。
	exit 999
fi

echo "(cd ${ANDROIDHOME};ln -f --symbolic  "${ANDROIDHOME}/_vimrcAndroid" ~/.vimrc)"
unlink ~/.vimrc 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_vimrc" ~/.vimrc`;echo "実行結果"$?)

echo "(cd ${ANDROIDHOME};ln -f --symbolic  "${ANDROIDHOME}/_gvimrc" ~/.gvimrc)"
unlink ~/.gvimrc 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gvimrc" ~/.gvimrc`;echo "実行結果"$?)

echo "(cd ${ANDROIDHOME};ln -f --symbolic  "${ANDROIDHOME}/Android/_bashrc" ~/.bashrc)"
unlink ~/.bashrc 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/Android/_bashrc" ~/.bashrc`;echo "実行結果"$?)

echo "(ln -f --symbolic  "${ANDROIDHOME}/_gitconfig" ~/.gitconfig)"
unlink ~/.gitconfig 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/_gitconfig" ./.gitconfig`;echo "実行結果"$?)

echo "(cp -p "${ANDROIDHOME}/_gitconfig.private-local" ~/.gitconfig.private-local)"
(cd ~/;`cp -p "${ANDROIDHOME}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)
#(cd ~/;`ln -s "${ANDROIDHOME}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${ANDROIDHOME}/MacOS/_profile_common_EnvironmentVariable" ./.profile_common_EnvironmentVariable)"
unlink ~/.profile_common_EnvironmentVariable 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/MacOS/_profile_common_EnvironmentVariable" ./.profile_common_EnvironmentVariable`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${ANDROIDHOME}/MacOS/_profile_common_Alias" ./.profile_common_Alias)"
unlink ~/.profile_common_Alias 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/MacOS/_profile_common_Alias" ./.profile_common_Alias`;echo "実行結果"$?)

echo "(cd ${ANDROIDHOME};cp -p "${ANDROIDHOME}/Android/_bashrc_sub" ~/.bashrc_sub)"
(cd ${ANDROIDHOME}/;`cp -p "${ANDROIDHOME}/Android/_bashrc_sub" ~/.bashrc_sub`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${ANDROIDHOME}/MacOS/_inputrc" ./.inputrc)"
unlink ~/.inputrc 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/MacOS/_inputrc" ./.inputrc`;echo "実行結果"$?)

echo "(cd ${ANDROIDHOME}/;ln -f --symbolic  "${ANDROIDHOME}/_gitignore" ~/.gitignore)"
unlink ~/.gitignore 2>/dev/null
unlink $GITGNORE/ignore 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gitignore_global" ${GITGNORE}/ignore`;echo "実行結果"$?)
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gitignore_global" ~/.gitignore`;echo "実行結果"$?)

echo "(cd ~/;ln -f --symbolic  "${ANDROIDHOME}/Android/Android_HOME_ssh_config" ~/.ssh/config)"
unlink ~/.gitignore 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/Android/Android_HOME_ssh_config" ~/.ssh/config`;echo "実行結果"$?)

if type "git" > /dev/null 2>&1; then
	echo "gitコマンドあり。環境構築開始"
	cd $VIMDIR
	git clone https://github.com/k-takata/minpac
else
	echo "gitコマンドなし。"
fi


echo "サブシェル実行開始"
${ANDROIDHOME}/subFunction/ftpplugVimFile.sh
echo "サブシェル実行終了"

echo "ドットファイル作成終了"
