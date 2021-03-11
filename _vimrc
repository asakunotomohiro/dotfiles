" vim:set ts=4 sts=4 sw=4 tw=0:
let g:skip_defaults_vim = 1
"	ーーーパッケージ管理20190622ーーー
if ( has('win32') || has('win64') )
	set packpath^=~/.vim
endif

packadd minpac
"if exists('*minpac#init')
  " minpac がロードされている場合
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('previm/previm')	" プレビュー用
call minpac#add('tyru/open-browser.vim')	" ブラウザを起動し、上記のprevimを表示させる。

" IDE用の設定プラグイン？
call minpac#add('prabirshrestha/vim-lsp')	" 挙動不審？
call minpac#add('mattn/vim-lsp-settings')
"call minpac#add('mattn/vim-goimports')	" Go言語用？

"	オートコンプリートポップアップメニュー表示
call minpac#add('prabirshrestha/asyncomplete.vim')
"		オートコンプリートソース
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')

" Go言語用プラグイン
"call minpac#add('https://github.com/fatih/vim-go')

" コンパイル
call minpac#add('thinca/vim-quickrun')
" Git
"let g:gitgutter_sign_removed_first_line = "^_"
"call minpac#add('airblade/vim-gitgutter')
"		define_signs[8]
"			<SNR>24_define_sign_text
"		⇒ハイライトと思われるエラーになる。
"			そのため、その部分のコメントアウトが必要。
call minpac#add('tpope/vim-fugitive')

" マーク表示
call minpac#add('jacquesbh/vim-showmarks')
" タブ補完
"call minpac#add('ervandew/supertab')
"	普通のTabキー入力が打てなくなる(Ctrl+TabでTab入力)。

"	以下のコマンドを打つことにより、プログラムファイルに応じたファイルがインストールされる。
"	LspInstallServer

" すべてのプラグインを起動時に読み込むのであれば、以下を実行。
packloadall

" 疑問点
"	vim-lsp
"	このプラグインを読み込むことで、Vim起動時に再描画が発生してしまう。
"	ーーーここまでがパッケージ管理ーーー

" Vimから使えるデバッガUI
augroup MyTermDebug
	" C言語ファイルのみ有効
	au!
	au FileType c packadd termdebug
augroup END

" ■IDEのように補完してくれる
" ファイルの変更に伴いリアルタイムにエラー表示する機能 
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" 自動で入力補完ポップアップを表示する設定
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
" ポップアップを表示するまでのディレイ
let g:asyncomplete_popup_delay = 200
" LSP の仕様である textEdit を有効にする設定
let g:lsp_text_edit_enabled = 0

let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_remove_duplicates = 1

"	ーーーここまでがパッケージ管理ーーー
if (has('win32') || has('win64') )
	let g:previm_open_cmd = 'C:\/Program\ Files\/Mozilla\ Firefox\/firefox.exe'	" open-browser.vim
elseif has('xfontset')
endif

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:vim_markdown_folding_disabled=1
nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー


"endif
"	ーーーパッケージ管理下での設定ここまでーーー


" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('mac')) && has('multi_lang')
	if !exists('$LANG') || $LANG.'X' ==# 'X'
		if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
			language ctype ja_JP.eucJP
		endif
		if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
			language messages ja_JP.eucJP
		endif
	endif
endif

"---------------------------------------------------------------------------
" フォント設定:
"
if (has('win32') || has('win64') )
	" Windows用
	" 行間隔の設定
	set linespace=1
elseif has('gui_macvim')
	set guifont=Osaka-Mono:h16
elseif has('mac')
	set guifont=Osaka－等幅:h14
elseif has('xfontset')
	" UNIX用 (xfontsetを使用)
	set guifontset=a14,r14,k14
endif

" □や○の文字があってもカーソル位置がずれないよう。
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	" 一部のUCS文字の幅を自動計測して決める
	set ambiwidth=double
endif

"	シンタックスハイライト有効化
syntax on

"---------------------------------------------------------------------------
" 上書き後に終了するコマンドを無効化する。
nnoremap ZZ <Nop>

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim') || has('gui_macvim')
	" IME ON時のカーソルの色を設定
	highlight CursorIM guibg=Purple guifg=LightRed
	" 挿入モード・検索モードでのデフォルトのIME状態設定
	set iminsert=0 imsearch=0
endif

"	インサートモードでバックスペース機能を有効にする。
	"BSで削除できるものを指定する
	" indent  : 行頭の空白
	" eol     : 改行
	" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"	インクリメンタルサーチをしない。
set noincsearch

"	マッチ箇所をハイライト
set hlsearch
"		ハイライト解除の場合はExコマンド上で"noh"を打てば消える(再度検索すればハイライトになる)。
nnoremap <C-l> :nohlsearch<CR><C-l>
"		Ctrl+l	の組み合わせでハイライト解除にした。

"	ファイル端に達した場合、一周して検索を続行する。
set wrapscan

"	対となるキーワード間の移動(検索)
if &compatible
	set nocompatible
endif
filetype plugin on
runtime macros/matchit.vim

" コマンド補完
"set wildmode=list:full	"	←Tabキーで候補が出るものの気持ち悪い出方をする。
set wildmode=full	"	←規定値
set history=800 " 保存するコマンド履歴の数

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定
" autofmt: 日本語文章のフォーマット(折り返し)プラグイン。
set formatexpr=autofmt#japanese#formatexpr()

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" 行番号を表示 (nonumber:表示しない)
set number

"	下記は、行番号をカレント行から相対的に表示
"set relativenumber
set norelativenumber
"		状況によっては動作が遅くなる。

" ルーラーを表示 (noruler:非表示)
"	右下に表示される。
set ruler

" タブや改行を表示 (nolist:表示しない)
set list

" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,eol:<

" 常にステータス行を表示 (詳細は:he laststatus)
"	EXコマンドラインとの境目を付けるために必要だろう。
set laststatus=2

" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
"	EXコマンドラインのため、2ぐらいが適当？（1との違いが不明）。
set cmdheight=2

" タイプ中のコマンドを表示
set showcmd

" カーソルハイライト
set cursorline
"		アンダーライン付き。
hi CursorLine cterm=underline guifg=NONE guibg=NONE

" カーソルの移動として画面幅いっぱいまで移動させる設定。
set scrolloff=0

" 編集に関する設定:

" タブの画面上での幅
set tabstop=4

" シフト量の幅（"<<" または ">>"）
set shiftwidth=4

" 挿入モードの時にプットする場合、自動インデント機能を無効にする。
set pastetoggle=<F2>
inoremap <C-g><C-v> <F2><C-r>"<F2>
"		Ctrl+g→Ctrl+v	→　いわゆるコピペのGvim版
"		挿入モードの時に、<C-r>"<Esc>で改行付きの複数行が貼り付けられる。
"		F2キー押下で設定を有効・無効に切り替える必要がある。

"---------------------------------------------------------------------------
" バックアップファイル・スワップファイル
set backup
set undofile

"set noundofile
if ( has('win32') || has('win64') )
	let s:backup_dir = 'C:/vim_backup'
	"	本来は%TEMP%ディレクトリが望ましいだろう。
	"
	" undofileが勝手に作られるが、無効化ではなく、作る場所を一カ所にまとめることにした。
	set undodir=backup_dir
	"	※これは、kaoriya版のVer.7.4.277からの仕様らしい。
else
	let s:backup_dir = expand('~/.vim_backup')
	set undodir=backup_dir
endif
if !isdirectory(s:backup_dir)
	exec mkdir(s:backup_dir, '', 0700)
endif
let &backupdir = s:backup_dir
let &directory = s:backup_dir

"---------------------------------------------------------------------------
"　日本語ヘルプが開くように設定する。
set helplang=ja,en

" .vimrcの編集中のみKキー押下することにより、Vimのマニュアルが開く。
augroup vimrc
	autocmd!
	autocmd FileType vim setlocal keywordprg=:help
augroup END

"---------------------------------------------------------------------------
" 文字コードの設定
"	ファイルの文字コードがlatin1の場合は、選別ミスのようだ。
set fileencodings=iso-2022-jp,iso-2022-jp-1,iso-2022-jp-2,iso-2022-jp-3,ISO-2022-JP-2004,cp932,sjis,utf-7,utf-8,euc-jp,ucs-bom,eucjp-ms,euc-jisx0213,utf-16,utf-16le
"	iso-2022-jp：日本語Jisのこと(しかし、適用されずにcp932で開かれる)。
"	utf-7は適用されず、utf-8で開かれる。
"	JIS・UTF7は開けず、文字化けする。


" 改行コードの自動認識
"	改行コードを指定して開き直す場合　:e ++ff=mac
set fileformats=unix,dos,mac

" ステータスラインに文字コードを表示させる。
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" 日本語対応のための設定(Gvim初期起動時の設定にも関与する)
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについてはREADME_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
"source $VIMRUNTIME/encode_japan.vim
set encoding=UTF-8
"set fileencoding=japan

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

" ターミナルでマウスを使用。
set ttymouse=xterm2

"---------------------------------------------------------------------------
"	エクスプローラー
nnoremap <Leader>E :Explore<CR>
nnoremap <Leader>S :Sexplore<CR>	" ←通常:Seで水平分割上で開く.\Sで開くようになる.
nnoremap <Leader>V :Vexplore<CR>	" ←通常:Vexで水平分割上で開く.\Vで開くようになる.
"	新規タブページで開く場合は:Teを使う必要がある.

" 折りたたみ
set foldmethod=indent
set foldcolumn=1	" 折りたたみの可視化
autocmd BufRead * normal zR	" 折りたたみの開き
"	za：トグル
"	zo：折りたたみが開く
"	zc：折りたたむ
"	zR：すべての折りたたみを開く
"	zM：すべての折りたたみを閉じる。

"---------------------------------------------------------------------------
" MacVim-KaoriYa固有の設定

if ( has('win32') || has('win64') )
else
	" migemo:
	let $PATH = simplify($VIM . '/../../MacOS') . ':' . $PATH
	"set migemodict=$VIMRUNTIME/dict/migemo-dict
	"set migemo

	" 印刷に関する設定:
	set printmbfont=r:HiraMinProN-W3,b:HiraMinProN-W6
	set printencoding=utf-8
	set printmbcharset=UniJIS

	let $LUA_DLL = simplify($VIM . '/../../Frameworks/libluajit-5.1.2.dylib')
endif

"---------------------------------------------------------------------------
nnoremap <Leader>ev :e ~\.vimrc<CR>
nnoremap <Leader>eg :e ~\.gvimrc<CR>

if ( has('win32') || has('win64') )
	nnoremap <Leader>eh :e ++enc=sjis $HOME/Documents/AutoHotkey.ahk<CR>
	"		いずれは、編集後に読み込み直すような設定をしたい。
	" ※ディレクトリ名に日本語などが含まれている場合、文字化けする。
	"		その場合は、"set encoding=UTF-8"にする必要がある。
endif


" 以上。
