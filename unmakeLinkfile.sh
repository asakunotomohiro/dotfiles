#!/bin/bash

echo "ドットファイル削除開始"

if ls -1 /Applications | grep -i vim > /dev/null 2>&1; then
	GVIMApp=/Applications/MacVim.app/Contents/Resources/vim/runtime/ftplugin/

# ------------------------------------------

filedir=`pwd`
echo "$filedir"

VIMDIR=~/.vim/pack/minpac/opt
VIMBACDIR=~/.vim_backup
if [ -d $VIMBACDIR ]; then
	echo "vim環境がある。"

	echo "sudo unlink /etc/bashrc"
	sudo unlink /etc/bashrc
	ret=$?
	echo "実行結果"$ret
	if [ "$ret" == 0 ]; then
		echo etc配下シンボリックファイル削除成功
	else
		# パスワード入力に失敗した場合終了する。
		echo 処理失敗
		exit
	fi
	echo "sudo mv /etc/bashrc_bk /etc/bashrc"
	sudo mv /etc/bashrc_bk /etc/bashrc

	echo "sudo unlink /etc/profile"
	sudo unlink /etc/profile
	echo "sudo mv /etc/profile_bk /etc/profile"
	sudo mv /etc/profile_bk /etc/profile
	echo "実行結果"$?

	rm -f ~/.viminfo ~/.gitconfig.private-local ~/.bash_history 
	echo "実行結果"$?


	echo "(cd ~;unlink ".vimrc")"
	unlink ~/.vimrc
	echo "実行結果"$?

	unlink ~/.gvimrc
	echo "実行結果"$?

	unlink ~/.inputrc
	echo "実行結果"$?

	#	echo "(cd ~;unlink "${filedir}/MacOS/_bash_login" ./.bash_login)"
	#	(cd ~/;`unlink "${filedir}/MacOS/_bash_login" ./.bash_login`;echo "実行結果"$?)
	unlink ~/.bash_login
	echo "実行結果"$?

	#	echo "(cd ~;unlink "${filedir}/MacOS/_bash_profile" ./.bash_profile)"
	#	(cd ~/;`unlink "${filedir}/MacOS/_bash_profile" ./.bash_profile`;echo "実行結果"$?)
	unlink ~/.bash_profile
	echo "実行結果"$?

	#	echo "(cd ~;unlink "${filedir}/MacOS/_profile" ./.profile)"
	#	(cd ~/;`unlink "${filedir}/MacOS/_profile" ./.profile`;echo "実行結果"$?)
	unlink ~/.profile
	echo "実行結果"$?

	unlink ~/.gitconfig
	echo "実行結果"$?

	#	echo "(cd /etc;unlink "${filedir}/MacOS/etc_bashrc" ./bashrc)"
	#	(cd /etc;`sudo unlink "${filedir}/MacOS/etc_bashrc" ./bashrc`;echo "実行結果"$?)

	#	echo "(cd /etc;unlink "${filedir}/MacOS/etc_profile" ./profile)"
	#	(cd /etc;`sudo lln -f --symbolic  n -sf "${filedir}/MacOS/etc_profile" ./profile`;echo "実行結果"$?)

	rm -rf ~/.vim
	rm -rf ~/.vim_backup

	fi
fi

echo "ドットファイル削除終了"
