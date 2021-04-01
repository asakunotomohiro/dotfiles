#!/bin/bash

echo "ドットファイル作成開始"

if ls -1 /Applications | grep -i vim > /dev/null 2>&1; then
	echo "vimソフトウェアインストール済み"
	GVIMApp=/Applications/MacVim.app/Contents/Resources/vim/runtime/ftplugin/

else
	echo "vimソフトウェアなし。"
fi


#ln -f --symbolic ./_vimrc ~/.vimrc
filedir=`pwd`
echo "$filedir"

VIMDIR=~/.vim/pack/minpac/opt
VIMDIRAFTER=~/.vim/after/ftplugin
VIMBACDIR=~/.vim_backup
VIMUNDODIR=~/.vim_backup/undofile
VIMSESSIONDIR=~/.vim_backup/sessions

VIMDIRCOLORS=~/.vim/colors
VIMDIRCOMPILER=~/.vim/compiler
VIMDIRDOC=~/.vim/doc
VIMDIRFTDETECT=~/.vim/ftdetect
VIMDIRFTPLUGIN=~/.vim/ftplugin
VIMDIRINDENT=~/.vim/indent
VIMDIRKEYMAP=~/.vim/keymap
VIMDIRPLUGIN=~/.vim/plugin
VIMDIRSYNTAX=~/.vim/syntax

#	以下、端末固有用のGit無視リストの配置場所。
#GITXDGIGNORE=$XDG_CONFIG_HOME/git/ignore
#GITCONFIGHOME=~/.config/git/ignore

if [ -d $VIMDIR ]; then
	echo "vim環境がある。"
else
	echo "vim環境がないため、作成する。"
	mkdir -p $VIMDIR
	mkdir -p $VIMBACDIR
#	mkdir -p $VIMUNDODIR
#	mkdir -p $VIMSESSIONDIR
	mkdir -p $VIMDIRAFTER

	mkdir -p $VIMDIRCOLORS
	mkdir -p $VIMDIRCOMPILER
	mkdir -p $VIMDIRDOC
	mkdir -p $VIMDIRFTDETECT
	mkdir -p $VIMDIRINDENT
	mkdir -p $VIMDIRKEYMAP
	mkdir -p $VIMDIRPLUGIN
	mkdir -p $VIMDIRSYNTAX

#	mkdir -p $GITXDGIGNORE
#	mkdir -p $GITCONFIGHOME
fi

if type "git" > /dev/null 2>&1; then
	echo "gitコマンドあり。環境構築開始"
	cd $VIMDIR
	git clone https://github.com/k-takata/minpac
else
	echo "gitコマンドなし。"
fi

echo "(cd ~;ln -f --symbolic  "${filedir}/_vimrc" ./.vimrc)"
(cd ~/;`ln -sf "${filedir}/_vimrc" ./.vimrc`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/_gvimrc" ./.gvimrc)"
(cd ~/;`ln -sf "${filedir}/_gvimrc" ./.gvimrc`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_bash_login" ./.bash_login)"
(cd ~/;`ln -sf "${filedir}/MacOS/_bash_login" ./.bash_login`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_bash_profile" ./.bash_profile)"
(cd ~/;`ln -sf "${filedir}/MacOS/_bash_profile" ./.bash_profile`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_profile" ./.profile)"
(cd ~/;`ln -sf "${filedir}/MacOS/_profile" ./.profile`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_profile_common_Alias" ./.profile_common_Alias)"
(cd ~/;`ln -sf "${filedir}/MacOS/_profile_common_Alias" ./.profile_common_Alias`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_profile_common_EnvironmentVariable" ./.profile_common_EnvironmentVariable)"
(cd ~/;`ln -sf "${filedir}/MacOS/_profile_common_EnvironmentVariable" ./.profile_common_EnvironmentVariable`;echo "実行結果"$?)

echo "(cd ~ln -f --symbolic  "${filedir}/MacOS/_inputrc" ./.inputrc)"
(cd ~/;`ln -sf "${filedir}/MacOS/_inputrc" ./.inputrc`;echo "実行結果"$?)

echo "(cd /etc;ln -f --symbolic  "${filedir}/MacOS/etc_bashrc" ./bashrc)"
(cd /etc;`sudo ln -sf "${filedir}/MacOS/etc_bashrc" ./bashrc`;echo "実行結果"$?)

echo "(cd /etc;ln -f --symbolic  "${filedir}/MacOS/etc_profile" ./profile)"
(cd /etc;`sudo ln -sf "${filedir}/MacOS/etc_profile" ./profile`;echo "実行結果"$?)

echo "(ln -f --symbolic  "${filedir}/_gitconfig" ~/.gitconfig)"
(cd ~/;`ln -sf "${filedir}/_gitconfig" ./.gitconfig`;echo "実行結果"$?)
echo "(cp -p "${filedir}/_gitconfig.private-local" ~/.gitconfig.private-local)"
(cd ~/;`cp -p "${filedir}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)
#(cd ~/;`ln -sf "${filedir}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)
echo "(cd ~/;ln -f --symbolic  "${filedir}/_gitignore" ~/.gitignore)"
(cd ~/;`ln -sf "${filedir}/_gitignore_global" ./.gitignore_global`;echo "実行結果"$?)


echo "サブシェル実行開始"
${filedir}/subFunction/ftpplugVimFile.sh
echo "サブシェル実行終了"


echo "ドットファイル作成終了"

# 以上。
