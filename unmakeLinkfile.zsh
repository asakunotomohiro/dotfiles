#!/usr/bin/env zsh

echo "ドットファイル削除開始"

filedir=`pwd`
echo "$filedir"

VIMDIRAFTER=~/.vim/after/ftplugin

echo "unlink ~/.vimrc"
(unlink ~/.vimrc;echo $?)
(rm ~/.viminfo;echo $?)
(rm -rf ~/.vim;echo $?)
(rm -rf ~/.vim_backup/sessions;echo $?)
(rm -rf ~/.vim_backup/undofile;echo $?)
(rm -f ~/.vim_backup/*;echo $?)
echo "unlink ~/.gvimrc"
(unlink ~/.gvimrc;echo $?)
echo "unlink ~/.zshrc"
(unlink ~/.zshrc;echo $?)
(unlink ~/.bashrc;echo $?)
(unlink ~/.bash_profile;echo $?)
(rm ~/.zcompdump;echo $?)	# 普段から消して構わない。
(rm -rf ~/.zsh_sessions;echo $?)
echo "unlink ~/.gitconfig"
(unlink ~/.gitconfig;echo $?)
echo "rm -f ~/.config/git/gitconfig.private-local"
(rm -f ~/.config/git/gitconfig.private-local;echo $?)
echo "unlink ~/.config/git/ignore"
(unlink ~/.config/git/ignore;echo $?)
echo "unlink ~/.config/shell/profile_common_EnvironmentVariable"
(unlink ~/.config/shell/profile_common_EnvironmentVariable;echo $?)
echo "unlink ~/.config/shell/profile_common_Alias"
(unlink ~/.config/shell/profile_common_Alias;echo $?)
echo "unlink ~/.inputrc"
(unlink ~/.inputrc;echo $?)
echo "unlink ~/.ssh/Android_config_bk.symlink"
(unlink ~/.ssh/Android_config_bk.symlink;echo $?)
echo "unlink ~/.ssh/config"
(rm -rf ~/.ssh/config;echo $?)
echo "unlink DVD_Player.app.symlink"
(unlink "/Applications/DVD Player.app";echo $?)
(unlink "~/DVDPlayer";echo $?)
echo "※手動にて、'${VIMDIRAFTER}'のディレクトリ配下のファイルを削除すること。"
(rm -rf ~/.config/git;echo $?)
(rm -rf ~/.config/shell;echo $?)

echo "以降、自動で作成された(と思われる)ファイル削除。"
(rm -rf ~/.vscode;)
(rm -rf ~/.rbenv;)
(rm -rf ~/.pyenv;)
(rm ~/.python_history;)
(rm ~/.python-version;)
(rm -rf ~/.perlbrew;)
(rm -rf ~/.goenv;)
(rm ~/.lesshst;)
(rm -f ~/.CFUserTextEncoding;)

echo "ドットファイル削除終了(手動で'.zsh_history'を削除すること)。"
(rm ~/.zsh_history;)
echo "また、不要ならば、'.vim_backup'・'.config'のディレクトリも削除すること。"


echo "以上。"
# vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=sh noexpandtab:
