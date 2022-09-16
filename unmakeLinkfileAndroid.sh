#!/bin/bash

echo "ドットファイル削除開始"

# 以下、定数。
SSHCONFIGHOME=~/.ssh
GITGNORE=~/.config/git
SHELLDIR=~/.config/shell

#if ls -1 /Applications | grep -i vim > /dev/null 2>&1; then
#	GVIMApp=/Applications/MacVim.app/Contents/Resources/vim/runtime/ftplugin/

# ------------------------------------------

filedir=`pwd`
echo "$filedir"

#VIMDIR=~/.vim/pack/minpac/opt
#VIMBACDIR=~/.vim_backup
	#if [ -d $VIMBACDIR ]; then
	#echo "vim環境がある。"

	rm -f ~/.viminfo ~/.gitconfig.private-local ~/.bash_history ~/.lesshst

	unlink ~/.vimrc
	echo "実行結果(vimrc)"$?

	unlink ~/.gvimrc
	echo "実行結果(gvimrc)"$?

	unlink ~/.bashrc
	echo "実行結果(bashrc)"$?

	#unlink ~/.bashrc_sub
	unlink ${SHELLDIR}/bashrc_sub
	echo "実行結果(bashrc_sub)"$?

	#unlink ~/.profile_common_Alias
	unlink ${SHELLDIR}/profile_common_Alias
	echo "実行結果(profile_common_Alias)"$?

	#unlink ~/.profile_common_EnvironmentVariable
	unlink ${SHELLDIR}/profile_common_EnvironmentVariable
	echo "実行結果(profile_common_EnvironmentVariable)"$?

	unlink ~/.inputrc
	echo "実行結果(inputrc)"$?

	#unlink ~/.gitignore
	#echo "実行結果(gitignore)"$?

	#unlink ${GITGNORE}/ignore
	unlink ~/.config/git/ignore
	echo "実行結果(ignore)"$?

	#unlink ${GITGNORE}/.gitconfig
	unlink ~/.gitconfig
	#unlink ~/.config/git/.gitconfig
	echo "実行結果(gitconfig)"$?

	unlink ~/.ssh/Android_config_bk.symlink
	rm -f ~/.ssh/config

	# 消す順番大事。
	rm -rf ~/.vim
	rm -rf ~/.vim_backup
	rm -r ~/.config/git
	rm -r ~/.config
	rm -rf $SSHCONFIGHOME

#	fi
#fi

echo "ドットファイル削除終了"
# vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=sh noexpandtab:
