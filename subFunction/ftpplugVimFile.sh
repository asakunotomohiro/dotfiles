#!/usr/bin/env sh

# -------
#	!/bin/bash
#	■droidVimの場合、以下のPathになる。
#	!/system/bin/sh

echo "vimファイルのシンボリックファイル作成開始"

if [ "$1" == "" ]; then
	filedir=`pwd`
	echo "$filedir"
else
	filedir="$1"
fi

VIMDIR=~/.vim/pack/minpac/opt
VIMDIRAFTER=~/.vim/after/ftplugin
VIMBACDIR=~/.vim_backup
#if [ -d $VIMDIRAFTER ]; then
#	echo "vim環境がある。"
#else
#	echo "vim環境がないため、作成する。"
	mkdir -p $VIMDIR
	mkdir -p $VIMBACDIR
	mkdir -p $VIMDIRAFTER
#fi

if [ -d "${filedir}/subFunction" ]; then
	# ディレクトリが存在する。
	filedir=${filedir}/subFunction
fi

for textFile in `ls -1 $VIMDIRAFTER/*.vim 2>/dev/null`; do
	(cd $VIMDIRAFTER;rm -f ${textFile} 2>/dev/null)
done

#	以下、ファイルタイプ別の設定ファイルをシンボリックファイルで紐付ける。
currentVimFile=`ls -1 "${filedir}"/vimFtplugin/*.vim`
for textFile in "$currentVimFile"; do
	textFileName=`basename "$textFile"`
	echo "cd $VIMDIRAFTER;ln -sf "${textFile}" ./${textFileName}"
	(cd $VIMDIRAFTER;`ln -sf "${textFile}" ./${textFileName}` ;echo "実行結果"$?)
done

echo "vimファイルのシンボリックファイル作成終了"
# vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=bash noexpandtab:
