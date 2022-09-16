#!/bin/bash
# 本ファイルは、Android10OS以降に対応。
#	git clone https://github.com/asakunotomohiro/dotfiles.git
#
#	★
#		■	droidVimで実行する場合は、ホームディレクトリ以外でgit cloneを実行すること。
#		□	アプリアップデートで消えるはず。
#		※	DroidVimのbashは冒頭のPathではない。
#	☆

#	ssh用に秘密鍵をAndroidOSに配置しておく必要がある。
#		しかし、ssh-keygenコマンドは存在しない。

echo "ドットファイル作成開始"
#	別途Termuxでインストールするソフトウェア
#		pkg install tsu	# sudo用だが、使用不可(違うから？)。
#		pkg install man	# マニュアル(Help)表示用コマンド
#		pkg install python	# プログラミング言語
#		pkg install perl	# プログラミング言語
#		pkg install golang	# プログラミング言語
#		pkg install c-script	# プログラミング言語	C言語っぽい動きをしてくれる。
#		pkg install zip	# 圧縮・展開用ソフトウェア
#		pkg install openssh	# 通信用ソフトウェア
#		pkg install zsh	# シェルソフトウェア(Macへのbash導入にbrewは使わず)

filedir=`pwd`
echo "$filedir"

DROIDVIM=~
VIMDIR=${DROIDVIM}/.vim/pack/minpac/opt
VIMDIRAFTER=${DROIDVIM}/.vim/after/ftplugin
VIMBACDIR=${DROIDVIM}/.vim_backup
VIMUNDODIR=${DROIDVIM}/.vim_backup/undofile
VIMSESSIONDIR=${DROIDVIM}/.vim_backup/sessions

VIMDIAUTOLOAD=${DROIDVIM}/.vim/autoload
VIMDIRCOLORS=${DROIDVIM}/.vim/colors
VIMDIRDOC=${DROIDVIM}/.vim/doc
VIMDIRFTPLUGIN=${DROIDVIM}/.vim/ftplugin
VIMDIRPLUGIN=${DROIDVIM}/.vim/plugin
VIMDIRSYNTAX=${DROIDVIM}/.vim/syntax

VIMDIRCOMPILER=${DROIDVIM}/.vim/compiler
VIMDIRFTDETECT=${DROIDVIM}/.vim/ftdetect
VIMDIRINDENT=${DROIDVIM}/.vim/indent
VIMDIRKEYMAP=${DROIDVIM}/.vim/keymap

GITSSH=~/.ssh
GITGNORE=~/.config/git
SHELLDIR=~/.config/shell
TERMUXDIR=~/.termux

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
	mkdir -p $SHELLDIR
	mkdir -p $TERMUXDIR

	#touch $GITSSH/config
	#chmod 600 $GITSSH/config
#fi

#ANDROIDHOME=/storage/emulated/0/dotfiles
#	droidVimで環境構築する場合は、以下のPathを使う。
#		しかし、冒頭での説明通り、アプリアップデートで削除される可能性がある。
ANDROIDHOME=/data/user/0/com.droidvim/dotfiles
ANDROIDHOME=/data/user/0/com.droidvim/files/home/dotfiles
#	termuxで環境構築する場合は、以下のPathを使う。
ANDROIDHOME=/data/data/com.termux/files/home/storage/shared/Documents/dotfiles

# todo: ディレクトリ移動など重複しているため、整理する。
if [ -d ${ANDROIDHOME} ]; then
	echo ドットファイルリポジトリあり。
	SCRIPT_DIR=$(cd $(dirname $0); pwd)	# カレントディレクトリ名の絶対Path取得。
	if [ "${ANDROIDHOME}" == "$SCRIPT_DIR" ]; then
		echo;	# 何もしない。
	else
		echo "別の場所でシェルを実行するため、本来あるべきディレクトリを削除する。"
		rm -rf "${ANDROIDHOME}"
		BASEDIR_NAME=`echo "$SCRIPT_DIR" | sed -e 's/.*\/\([^\/]*\)$/\1/'`	# カレントディレクトリ名のみ取得。
		BASEDIRSTRINGCOUNT=${#BASEDIR_NAME}
		documents=${ANDROIDHOME:0:-$BASEDIRSTRINGCOUNT}	# 末尾のディレクトリ名を削除する。
		mkdir -p ${documents}
		RETMKDIR=$?
#		if [ "${RETMKDIR}" -eq 0 && -d "${documents}" ]; then
			# TODO DroidVimでの実行では、以下のコピー方法を柔軟に対応する(現時点では権限が無くて動かない)。
#			# ディレクトリ作成に成功かつ、そのディレクトリが存在する場合、dotfilesディレクトリを移動する。
			(cd ..; cp -rp ${SCRIPT_DIR} ${documents};)
			(cd ${ANDROIDHOME}; pwd; bash ./makeLinkfileAndroid.sh; echo "配置完了。")
			#cd ..	# なぜか、このコマンドだけでは1つ上のディレクトリに移動しない。
			cd
			rm -rf $SCRIPT_DIR;
			echo "削除終了。";
			exit 0;
#		fi
	fi
else
	echo ドットファイルリポジトリなし。
#	echo なし。
#	exit 999
	SCRIPT_DIR=$(cd $(dirname $0); pwd)	# カレントディレクトリ名の絶対Path取得。
	BASEDIR_NAME=`echo "$SCRIPT_DIR" | sed -e 's/.*\/\([^\/]*\)$/\1/'`	# カレントディレクトリ名のみ取得。
	BASEDIRSTRINGCOUNT=${#BASEDIR_NAME}
	#documents=${ANDROIDHOME:0:${ANDROIDHOME}-$BASEDIRSTRINGCOUNT}	# 末尾のディレクトリ名を削除する。
	documents=${ANDROIDHOME:0:-$BASEDIRSTRINGCOUNT}	# 末尾のディレクトリ名を削除する。
	mkdir -p ${documents}
	#echo "スクリプトDIR：${SCRIPT_DIR}"
	#echo "ドキュメントDIR：${documents}"
	(cd ..; cp -rp ${SCRIPT_DIR} ${documents}; )
	(cd ${ANDROIDHOME}; pwd; bash ./makeLinkfileAndroid.sh; echo "配置完了。")
	#cd ..	# なぜか、このコマンドだけでは1つ上のディレクトリに移動しない。
	#			関数化させるか、sourceコマンドで実行すればいけるようだ。
	cd
	rm -rf $SCRIPT_DIR;
	echo "削除終了。";
	exit 0;
fi

#echo "(cd ${ANDROIDHOME};ln -f --symbolic  "${ANDROIDHOME}/_vimrcAndroid" ~/.vimrc)"
echo "(ln 作成先：~/.vimrc)"
unlink ~/.vimrc 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_vimrc" ~/.vimrc`;echo "実行結果"$?)

echo "(ln 作成先：~/.gvimrc)"
unlink ~/.gvimrc 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gvimrc" ~/.gvimrc`;echo "実行結果"$?)

echo "(ln 作成先：~/.bashrc)"
unlink ~/.bashrc 2>/dev/null
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/Android/_bashrc" ~/.bashrc`;echo "実行結果"$?)

#echo "([ローカルgit]/_gitconfig ${GITGNORE}/.gitconfig)"
#echo "([ローカルgit]/_gitconfig ${XDG_CONFIG_HOME}/.config/git/.gitconfig)"
#echo "([ローカルgit]/_gitconfig ~/.config/git/.ignore)"
echo "(ln 作成先：~/.gitconfig)"
unlink ~/.gitconfig 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/_gitconfig" ~/.gitconfig`;echo "実行結果"$?)

#echo "([ローカルgit]/_gitconfig.private-local ~/.gitconfig.private-local)"
echo "(cp 作成先：~/.config/git/gitconfig.private-local)上書きしない。"
#(cd ~/;`cp -p "${ANDROIDHOME}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)
#(cd ~/;`ln -s "${ANDROIDHOME}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)
(cd ~/;`cp -np "${ANDROIDHOME}/_gitconfig.private-local" ./.config/git/gitconfig.private-local`;echo "実行結果"$?)

#	todo: 以下、無視リストファイルの配置場所を正しい位置に変更する(~/.config/git/ここ)。
#echo "([ローカルgit]/_gitignore ~/.gitignore)"
echo "(ln 作成先：~/.config/git/ignore)"
unlink ~/.gitignore 2>/dev/null
#unlink $GITGNORE/ignore 2>/dev/null
#unlink ~/.ignore 2>/dev/null
unlink ~/.config/git/.ignore 2>/dev/null
#(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gitignore_global" ${GITGNORE}/ignore`;echo "実行結果"$?)
(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gitignore_global" ~/.config/git/ignore`;echo "実行結果"$?)
#(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_gitignore_global" ~/.gitignore`;echo "実行結果"$?)

#	TODO 以下、次回作成できるように設定する(削除も行うこと)。
#echo "(ln 作成先：~/.config/git/stCommitMsg)"
#(cd ${ANDROIDHOME}/;`ln -sf "${ANDROIDHOME}/_stCommitMsg" ~/.config/git/stCommitMsg`;echo "実行結果"$?)

echo "(cp 作成先：~/.ssh/config)"
#unlink ~/.ssh/config 2>/dev/null
(cd ~/;`cp -np "${ANDROIDHOME}/MacOS/_ssh_config" ~/.ssh/config`;echo "実行結果"$?)
(cd ~/;`ln -sf "${ANDROIDHOME}/Android/Android_HOME_ssh_config" ~/.ssh/Android_config_bk.symlink`;echo "実行結果"$?)

echo "(ln 作成先：~/.config/shell/profile_common_EnvironmentVariable)"
unlink ~/.config/shell/profile_common_EnvironmentVariable 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/MacOS/_profile_common_EnvironmentVariable" ./.config/shell/profile_common_EnvironmentVariable`;echo "実行結果"$?)

echo "(ln 作成先：~/.config/shell/profile_common_Alias)"
unlink ~/.profile_common_Alias 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/MacOS/_profile_common_Alias" ./.config/shell/profile_common_Alias`;echo "実行結果"$?)

echo "(cp 作成先：~/.bashrc_sub)上書きしない。"
(cd ${ANDROIDHOME}/;`cp -np "${ANDROIDHOME}/Android/_bashrc_sub" ~/.config/shell/bashrc_sub`;echo "実行結果"$?)

echo "(ln 作成先：~/.inputrc)"
unlink ~/.inputrc 2>/dev/null
#(cd ~/;`ln -sf "${ANDROIDHOME}/MacOS/_inputrc" ./.inputrc`;echo "実行結果"$?)
(cd ~/;`ln -sf "${ANDROIDHOME}/Android/_inputrc" ./.inputrc`;echo "実行結果"$?)

echo "(ln 作成先：~/.termux/termux.properties)"
unlink ~/.termux/termux.properties 2>/dev/null
(cd ~/;`ln -sf "${ANDROIDHOME}/Android/_termux.properties" ./.termux/termux.properties`;echo "実行結果"$?)

echo "(mv 作成先：ダウンロード/com.droidvim.xml・DroidVimソフトウェアから読み込む。)"
(cd ~/;`mv -f "${ANDROIDHOME}/configSettingFile(個々のソフトウェアから読み込み)/android/com.droidvim.xml" ./storage/downloads/com.droidvim.xml`;echo "実行結果"$?)
echo "(mv 作成先：ダウンロード/atok_settings.atcf・ATOKソフトウェアから読み込む。)"
(cd ~/;`mv -f "${ANDROIDHOME}/configSettingFile(個々のソフトウェアから読み込み)/android/atok_settings.atcf" ./storage/downloads/atok_settings.atcf`;echo "実行結果"$?)
echo "(mv 作成先：ダウンロード/jotaplus_preferences.export・Jota+ソフトウェアから読み込む。)"
(cd ~/;`mv -f "${ANDROIDHOME}/configSettingFile(個々のソフトウェアから読み込み)/android/jotaplus_preferences.export" ./storage/downloads/jotaplus_preferences.export`;echo "実行結果"$?)
echo "(mv 作成先：ダウンロード/export_temp_AquaMozc辞書.txt・AquaMozcソフトウェアから読み込む。)"
(cd ~/;`mv -f "${ANDROIDHOME}/configSettingFile(個々のソフトウェアから読み込み)/android/export_temp_AquaMozc辞書.txt" ./storage/downloads/export_temp_AquaMozc辞書.txt`;echo "実行結果"$?)
echo "(mv 作成先：ダウンロード/pk_backup.pkb2)"
(cd ~/;`mv -f "${ANDROIDHOME}/configSettingFile(個々のソフトウェアから読み込み)/android/pk_backup.pkb2" ./storage/downloads/pk_backup.pkb2`;echo "実行結果"$?)


if type "git" > /dev/null 2>&1; then
	echo "gitコマンドあり。環境構築開始"
	cd $VIMDIR
	git clone https://github.com/k-takata/minpac
else
	echo "gitコマンドなし。"
fi


#echo "サブシェル実行開始"
#	携帯電話では対応不可(現時点で対応後回し)。
#bash ${ANDROIDHOME}/subFunction/ftpplugVimFile.sh
#echo "サブシェル実行終了"

#echo "以後、droidVim用のvimディレクトリ作成。"
#		権限がなく、エラーになる。
#		→解決策のひとつは、シェルでの配布では無く、手動でvimrcとminpacを実行すること(BusyBoxだからという理由では無いはず)。
#			なぜシェルが動いてくれないのか分からない(一部分は動くのに、、、)。
#			シェルの場所が異なるから？
#DROIDVIM=/data/user/0/com.droidvim/files/home/
#	# 以下、冒頭宣言と重複しているが、仕方ない。
#	VIMDIR=${DROIDVIM}/.vim/pack/minpac/opt
#	VIMDIRAFTER=${DROIDVIM}/.vim/after/ftplugin
#	VIMBACDIR=${DROIDVIM}/.vim_backup
#	VIMUNDODIR=${DROIDVIM}/.vim_backup/undofile
#	VIMSESSIONDIR=${DROIDVIM}/.vim_backup/sessions
#
#	VIMDIAUTOLOAD=${DROIDVIM}/.vim/autoload
#	VIMDIRCOLORS=${DROIDVIM}/.vim/colors
#	VIMDIRDOC=${DROIDVIM}/.vim/doc
#	VIMDIRFTPLUGIN=${DROIDVIM}/.vim/ftplugin
#	VIMDIRPLUGIN=${DROIDVIM}/.vim/plugin
#	VIMDIRSYNTAX=${DROIDVIM}/.vim/syntax
#
#	VIMDIRCOMPILER=${DROIDVIM}/.vim/compiler
#	VIMDIRFTDETECT=${DROIDVIM}/.vim/ftdetect
#	VIMDIRINDENT=${DROIDVIM}/.vim/indent
#	VIMDIRKEYMAP=${DROIDVIM}/.vim/keymap
#	mkdir -p $VIMDIR
#	mkdir -p $VIMDIAUTOLOAD
#	mkdir -p $VIMBACDIR
#	mkdir -p $VIMUNDODIR
#	mkdir -p $VIMSESSIONDIR
#	mkdir -p $VIMDIRAFTER
#
#	mkdir -p $VIMDIRCOLORS
#	mkdir -p $VIMDIRCOMPILER
#	mkdir -p $VIMDIRDOC
#	mkdir -p $VIMDIRFTDETECT
#	mkdir -p $VIMDIRINDENT
#	mkdir -p $VIMDIRKEYMAP
#	mkdir -p $VIMDIRPLUGIN
#	mkdir -p $VIMDIRSYNTAX
#	cd $VIMDIR
#	git clone https://github.com/k-takata/minpac

echo "gitconfigを定着させた後に、再度git cloneを実行する必要がある。"
echo "　　勝手に改行を変更するとは思えないが、実際にお試し運用してから本番運用に移行すること。"

echo "ドットファイル作成終了"
# vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=sh noexpandtab:
