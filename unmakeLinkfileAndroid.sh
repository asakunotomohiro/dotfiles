#!/bin/bash

echo "ドットファイル削除開始"

#if ls -1 /Applications | grep -i vim > /dev/null 2>&1; then
#	GVIMApp=/Applications/MacVim.app/Contents/Resources/vim/runtime/ftplugin/

# ------------------------------------------

filedir=`pwd`
echo "$filedir"

#VIMDIR=~/.vim/pack/minpac/opt
#VIMBACDIR=~/.vim_backup
	#if [ -d $VIMBACDIR ]; then
	echo "vim環境がある。"

	# いずれ~/.config/git/ココのファイルの削除する。
	rm -f ~/.viminfo ~/.gitconfig.private-local ~/.bash_history 

	echo "(cd ~;unlink ".vimrc")"
	unlink ~/.vimrc
	echo "実行結果"$?

	unlink ~/.gvimrc
	echo "実行結果"$?

	unlink ~/.bashrc
	echo "実行結果"$?

	unlink ~/.inputrc
	echo "実行結果"$?

	unlink ~/.gitignore
	echo "実行結果"$?

	rm -rf ~/.vim
	rm -rf ~/.vim_backup

#	fi
#fi

echo "ドットファイル削除終了"
