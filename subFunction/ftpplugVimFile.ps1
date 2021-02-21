# 実行前の注意(前準備)
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
#	呼び出し関数と同じコマンドを打てば良い。

$data = cmd /C where vim
$data | ForEach-Object {"Item: [$PSItem]"}

foreach ( $node in $data )
{
	$filename = [System.IO.Path]::GetFileName($node)
	if ("vim.exe" -eq $filename) {
		$PATH = Split-Path -Parent $node
		echo "Path表示：" $PATH
		break
	}
}

echo "--------------------------------"


# 手順
#　　1。*.vimファイル名を並べる。
#　　2。上記1のファイルに書き込みたい文字列を設定する。
#　　3。上記2の文字列配列を1つの配列に格納する。

#	■ここから都度の書き換えが発生。
#　1。かき込みたいファイル名(*.vim)を並べる。
#	いずれ外部ファイルに移行したい。
$writeFile = @(
	'markdown.vim'
	'text.vim'
)

# 改行コード：`r`n　←CRLF
#　2。ヒアドキュメント
#　　改行を含む文字列を作成する。
#　　1つのファイルにつき1つのヒアドキュメントとする。追記するのだが、ファイル末尾に空行がない場合、その行の末尾から書き始めることになるため、ここのヒアドキュメントで空行をあらかじめ設定しておくのが吉。
#	いずれ外部ファイルに移行したい。
$writeVal1 = @"


"■	ーーー 手動で追加 ーーー	■
nnoremap <Leader>p :PrevimOpen<CR>


"@	# 終了

$writeVal2 = @"


"■	ーーー 手動で追加 ーーー	■
"	自動インデントを無効
setlocal noautoindent
setlocal nosmartindent
setlocal nocindent


"@	# 終了

#　3。上記のヒアドキュメントをここで設定し、ここの配列を下記の処理に渡し、書き込みを行う。
#	いずれ外部ファイルに移行したい。
$writeData = @(
	$writeVal1
	$writeVal2
)

#　かき込みたいディレクトリをまずは探す。
#　　〜〜\vim81-kaoriya-win64\vim[バージョン番号]\ftplugin
$ChildVimdir = Get-ChildItem $PATH | Where-Object { $_.PSIsContainer }
foreach ( $node in $ChildVimdir )
{
	if ($node -MATCH "vim[0]*") {
		$FULLPATH = $PATH + "\" + $node + "\ftplugin"
		if ( Test-Path $FULLPATH ) {
			echo $FULLPATH"　⇒　書き込みを開始する。"
			break
		}
	}
}

#	■ここまで書き換えが必要。

#　実際の書き込み。
$ii = 0
foreach ( $node in $writeFile )
{
	$WRITEFULLPATH = $FULLPATH + "\" + $node

	# 改行をLFに置換。
	$writeData[$ii] = $writeData[$ii] -replace "`r`n","`n"
	echo $node
	Write-Output $writeData[$ii] | Add-Content -NoNewline $WRITEFULLPATH -Encoding UTF8
	$ii++
}

echo "書き込み終了。"

# ここまで。
