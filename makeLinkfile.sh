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
GITCONFIGHOME=~/.config/git
SHELLDIR=~/.config/shell
SSHCONFIGHOME=~/.ssh

#if [ -d $VIMDIR ]; then
#	echo "vim環境がある。"
#else
#	echo "vim環境がないため、作成する。"
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

	#mkdir -p $GITXDGIGNORE
	mkdir -p $GITCONFIGHOME
	mkdir -p $SHELLDIR
	mkdir -p $SSHCONFIGHOME
#fi

if type "git" > /dev/null 2>&1; then
	echo "gitコマンドあり。環境構築開始"
	# 以下、新規(追跡されていない)ディレクトリに含まれているファイルを表示する。
	#	https://qiita.com/m-yamazaki/items/45ea4a71ebb769995043
	#	https://git-scm.com/docs/git-status
#	git config status.showUntrackedFiles all	←☆すでに設定済み(gitconfig)。

	cd $VIMDIR
	git clone https://github.com/k-takata/minpac
else
	echo "gitコマンドなし。"
fi

echo "(cd ~;ln -f --symbolic  "${filedir}/_vimrc" ./.vimrc)"
(cd ~/;`ln -sf "${filedir}/_vimrc" ./.vimrc`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/_gvimrc" ./.gvimrc)"
(cd ~/;`ln -sf "${filedir}/_gvimrc" ./.gvimrc`;echo "実行結果"$?)

#	不要か？
#echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_bash_login" ./.bash_login)"
#(cd ~/;`ln -sf "${filedir}/MacOS/_bash_login" ./.bash_login`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_bash_profile" ./.bash_profile)"
(cd ~/;`ln -sf "${filedir}/MacOS/_bash_profile" ./.bash_profile`;echo "実行結果"$?)

#	不要か？
#echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_profile" ./.profile)"
#(cd ~/;`ln -sf "${filedir}/MacOS/_profile" ./.profile`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_profile_common_Alias" ./.config/shell/profile_common_Alias)"
(cd ~/;`ln -sf "${filedir}/MacOS/_profile_common_Alias" ./.config/shell/profile_common_Alias`;echo "実行結果"$?)

echo "(cd ~;ln -f --symbolic  "${filedir}/MacOS/_profile_common_EnvironmentVariable" ./.config/shell/profile_common_EnvironmentVariable)"
(cd ~/;`ln -sf "${filedir}/MacOS/_profile_common_EnvironmentVariable" ./.config/shell/profile_common_EnvironmentVariable`;echo "実行結果"$?)

echo "(cd ~ln -f --symbolic  "${filedir}/MacOS/_inputrc" ./.inputrc)"
(cd ~/;`ln -sf "${filedir}/MacOS/_inputrc" ./.inputrc`;echo "実行結果"$?)

#	以下の3種類のファイルは、直接編集しないこと。
#		/etc/profile
#		/etc/bashrc
#		/etc/bashrc_Apple_Terminal
#echo "(cd /etc;ln -f --symbolic  "${filedir}/MacOS/etc_bashrc" ./bashrc)(スーパユーザ利用)"
#(cd /etc;`sudo ln -sf "${filedir}/MacOS/etc_bashrc" ./bashrc`;echo "実行結果"$?)
#echo "(cd /etc;ln -f --symbolic  "${filedir}/MacOS/etc_profile" ./profile)(スーパユーザ利用)"
#(cd /etc;`sudo ln -sf "${filedir}/MacOS/etc_profile" ./profile`;echo "実行結果"$?)

echo "(ln "ローカルgit/_bashrc" ~/.bashrc)"
(cd ~/;`ln -sf "${filedir}/MacOS/_bashrc" ~/.bashrc`;echo "実行結果"$?)
#	いずれ、以下のファイルにPS1を書き込もうと思う。
#echo "(ln "ローカルgit/_bashrc_sub" ~/.config/shell/bashrc_sub)"
#(cd ~/;`ln -sf "${filedir}/_bashrc_sub" ~/.config/shell/bashrc_sub`;echo "実行結果"$?)

#	DVDプレーヤーが通常では表せられておらず、通常利用に不便なため、移動させる。
echo "(DVDプレイヤーをアプリケーションディレクトリおよびホームディレクトリに配置)"
dvdPlayer="/Applications/DVD Player.app"	# macOS High Sierraで有効。
dvdPlayer="/System/Library/CoreServices/Applications/DVD Player.app"	# macOS Mojaveで有効。
(cd ~/;`ln -sf "$dvdPlayer" /Applications`;echo "実行結果"$?)
(cd ~/;`ln -sf "$dvdPlayer" ~/DVDPlayer`;echo "実行結果"$?)

echo "(ln "ローカルssh/Android_HOME_ssh_config" ~/.ssh/configAndroid用)"
(cd ~/;`ln -sf "${filedir}/Android/Android_HOME_ssh_config" ~/.ssh/Android_config_bk.symlink`;echo "実行結果"$?)
(cd ~/;`cp -np "${filedir}/MacOS/_ssh_config" ~/.ssh/config`;echo "実行結果"$?)

echo "(ln "ローカルgit/_gitconfig" ~/.gitconfig)"
(cd ~/;`ln -sf "${filedir}/_gitconfig" ~/.gitconfig`;echo "実行結果"$?)
echo "(cp -p "ローカルgit/_gitconfig.private-local" ~/gitconfig.private-local)(普通のコピー)"
(cd ~/;`cp -p "${filedir}/_gitconfig.private-local" ./.config/git/gitconfig.private-local`;echo "実行結果"$?)
#(cd ~/;`ln -sf "${filedir}/_gitconfig.private-local" ./.gitconfig.private-local`;echo "実行結果"$?)
echo "(ln "ローカルgit/_gitignore" ~/.config/git/ignore)"
(cd ~/;`ln -sf "${filedir}/_gitignore_global" ./.config/git/ignore`;echo "実行結果"$?)

#	TODO: 以下、作成できるように設定する(削除も行うこと)。
#echo "(ln "ローカルgit/_stCommitMsg" ~/.config/git/stCommitMsg)"
#(cd ~/;`ln -sf "${filedir}/_stCommitMsg" ./.config/git/stCommitMsg`;echo "実行結果"$?)

echo "サブシェル実行開始"
bash ${filedir}/subFunction/ftpplugVimFile.sh ${filedir}
echo "サブシェル実行終了"


echo "ドットファイル作成終了"

echo "gitconfigを定着させた後に、再度git cloneを実行する必要がある。"
echo "　　勝手に改行を変更するとは思えないが、実際にお試し運用してから本番運用に移行すること。"

# 以上。
# vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=sh noexpandtab:
