" vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=vim noexpandtab:

"	.vimrcなどの場所(macVim版)
"		https://vim-jp.org/vimdoc-ja/starting.html#initialization

" ・まっさらな状態でのLinuxへのインストール。
"	git clone https://github.com/vim/vim.git
"	cd vim/src
"	make
"	make test
"	make install
"	vim

let g:skip_defaults_vim = 1
"	そもそもファイルが存在しないので読み込まない。
"
"	.vimrcなどの場所(macVim版)
"		https://qiita.com/gam0022/items/87491e8a32a5926684d2
"		https://vim-jp.org/vimdoc-ja/starting.html#initialization

" vimScriptの変数スコープ
"	g:	グローバル
"	v:	グローバルとしてvimがあらかじめ定義済み。
"	l:	関数限定
"	b:	現在のバッファ限定
"	w:	現在のウィンドウ限定
"	t:	現在のタブページ限定
"	s:	sourceされたvimScript限定
"	a:	関数の引数として、関数内限定
"
" 変数展開は、exe(execute)関数を使う？

"	シンタックスハイライト有効化
syntax off
syntax clear
syntax reset
syntax on
"colorscheme elflord
colorscheme torte

"
"	リーダーキー
"	<Leader>	デフォルトではバックスラッシュ
"	現在はスペースキーに割り当てている。
let mapleader = "\<Space>"

" ステータスラインに文字コードを表示させる。
"	下記は、プラグインに全く関係のない処理。
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


"	ーーーパッケージ管理20190622ーーー
"	git clone https://github.com/k-takata/minpac ~/.vim/pack/develop/opt/minpac
"	※ディレクトリは、あらかじめ作成しておくこと。
"		~/.vim/pack/	←☆作成。
"		~/.vim/pack/develop	←☆作成。
"		~/.vim/pack/develop/opt	←☆作成。
"		~/.vim/pack/develop/start	←☆作成。
"		~/.vim/writing	←☆作成。
"		~/.vim/writing/opt	←☆作成。
"		~/.vim/writing/start	←☆作成。
"	更新コマンド：:call minpac#update()
"			削除：:call minpac#clean()
"			情報：:call minpac#status()

if ( has('win32') || has('win64') )
	"set packpath?
	"set runtimepath?
	set runtimepath^=~/.vim,~/.vim/pack,~/.vim/after
	set packpath^=~/.vim
endif

let minpackOPT = "$HOME/.vim/pack/minpac/opt/"
let minpackSTART = "$HOME/.vim/pack/minpac/start/"

" 以下、vimのバージョンが古い場合、エラーが出るようだ。
let g:isDroid = split(&runtimepath, ',')[0] =~? 'droidvim' ? v:true : v:false
let g:isTermux = split(&runtimepath, ',')[0] =~? 'termux' ? v:true : v:false
"	Last login: Wed Mar 31 06:53:13 on ttys000
"	softservicenoMacBook-Pro:~ softservice$ vi
"	Error detected while processing /Users/softservice/.vimrc:
"	line   83:
"	E121: Undefined variable: v:false
"	E15: Invalid expression: split(&runtimepath, ',')[0] =~? 'droidvim' ? v:true : v:false
"	line   84:
"	E121: Undefined variable: v:false
"	E15: Invalid expression: split(&runtimepath, ',')[0] =~? 'termux' ? v:true : v:false
"	line  837:
"	E121: Undefined variable: g:isDroid
"	E15: Invalid expression: g:isDroid || g:isTermux
"	line 1952:
"	E121: Undefined variable: g:isDroid
"	E15: Invalid expression: g:isDroid || g:isTermux
"	Press ENTER or type command to continue
"	softservicenoMacBook-Pro:~ softservice$

" スクリプトの読み込み確認コマンド
"	:scriptnames

if isdirectory(expand(minpackSTART . "minpac"))  || isdirectory(expand(minpackOPT . "minpac"))
packadd minpac
endif
if !exists('g:loaded_minpac')
  " minpacがロードされていない場合の処理。
else
  " minpac がロードされている場合
call minpac#init()

" minpacでminpacを更新する場合は以下を有効にする。
call minpac#add('k-takata/minpac', {'type': 'opt'})

" vimヘルプの日本語化。
call minpac#add('vim-jp/vimdoc-ja', {'type': 'opt'})
"	:help [調べたい単語]
"	※原文にあたりたい場合、調べたい単語の末尾に「@en」を付ける。
"	例）help f	←☆fについてのドキュメントが日本語版として出てくる。
"	例）help f@en	←☆fについてのドキュメントが原文が出てくる。

" プレビュー用
call minpac#add('previm/previm', {'type': 'opt'})
	" ブラウザを起動し、上記のprevimを表示させる。
call minpac#add('tyru/open-browser.vim', {'type': 'opt'})

" IDE用の設定プラグイン？
"call minpac#add('tpope/vim-vinegar')	" エクスプローラの補助的な枠割り？
	" I：メニュー表示・~：ホームディレクトリ移動
"let NERDTreeHijackNetrw = 0
call minpac#add('natebosch/vim-lsc')
"call minpac#add('prabirshrestha/async.vim')	@heavenshellさんから不要だという指摘を受けた令和5年4月5日(水)
" 以下、挙動不審？
call minpac#add('prabirshrestha/vim-lsp')
"call minpac#add('mattn/vim-lsp-settings', {'type': 'opt'})	" 遅延読み込みをした場合、機能しない20210124
" 以下のプラグインではJava言語との相性が悪いようだ(Nvim向けのプラグインならば問題用だが、そのエディタを使うつもりはない)。
call minpac#add('mattn/vim-lsp-settings')
"	個々のインストール先：%LOCALAPPDATA%\vim-lsp-settings\servers
"	以下のコマンドを打つことにより、プログラムファイルに応じたファイルがインストールされる。
"	LspInstallServer
"	・環境構築が整っていない場合に出るメッセージのようだ。
"		efm-langserver requires go
call minpac#add('mattn/vim-goimports', {'type': 'opt'})
"	事前準備：go install golang.org/x/tools/cmd/goimports
"		非同期のオートコンプリート
"			オートコンプリートポップアップメニュー表示(自動補完補助)
call minpac#add('prabirshrestha/asyncomplete.vim')
"	一時削除(ATOKとの競合確認)20220112
"			オートコンプリートソース(自動補完補助)
"			勘違いで、このプラグインでは無かった(それでも上のプラグインは何に使うのだろう)。
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')

"	シンタックスチェック
call minpac#add('vim-syntastic/syntastic')

" 以下がなければ補完しない。
call minpac#add('thomasfaingnaert/vim-lsp-snippets', {'type': 'opt'})
"call minpac#add('thomasfaingnaert/vim-lsp-neosnippet')
" 以下、依存3点
"call minpac#add('Shougo/neosnippet.vim')
"call minpac#add('Shougo/neosnippet-snippets')
"call minpac#add('prabirshrestha/vim-lsp')

" 以下、Pythonがなければ動かない。
"call minpac#add('SirVer/ultisnips')

" 以下は、vimScriptのみで動く。
"call minpac#add('hrsh7th/vim-vsnip')
"call minpac#add('hrsh7th/vim-vsnip-integ')
"	スニペット用ファイルさえ用意できれば使えそうな感じがする。

" 以下、Python設定が必要。
"call minpac#add('Shougo/deoppet.nvim')

"	スニペット用プラグイン。
if g:isDroid || g:isTermux
	" Androidでは最初から読み込まない。
else
call minpac#add('drmingdrmer/xptemplate', {'type': 'opt'})
endif

" 日本語入力の切り替え。
"call minpac#add('mitsuse/swim')
"	コンパイルが必要なため、利用中止。


" Go言語用プラグイン
"call minpac#add('https://github.com/fatih/vim-go')
"	複雑な設定が必要になるため、手に余る。
"	しかし、慣れれば使い勝手はよくなるはず。

"	vimスクリプト用のランゲージサーバ
"call minpac#add('iamcco/vim-language-server')	" 導入されないようだ。

" ソースコードコメント化プラグイン。
"	範囲選択後にgcコマンドにて有効(無効)化する。
call minpac#add('tpope/vim-commentary', {'type': 'opt'})
autocmd BufNewFile,BufRead *.sh setlocal commentstring=#\	%s
"autocmd BufNewFile,BufRead *.sh setlocal commentstring=#\ %s
autocmd BufNewFile,BufRead [._g]{,2}vimrc setlocal commentstring=\"\	%s
"autocmd BufNewFile,BufRead [._g]{,2}vimrc setlocal commentstring=\"\ %s

" 動かない。動いてはいるようだが、可視化してくれない。
"call minpac#add('nathanaelkane/vim-indent-guides')	" インデントの可視化
"call minpac#add('Yggdroot/indentLine')	" インデントの可視化
"	半角スペースでなければ意味ない。Tabにはできそうにない。

" ファイル検索？エクスプローラ？
"	Ctrl+P	←これで起動する。
call minpac#add('ctrlpvim/ctrlp.vim')
"		検索モードの切り替え：Ctrl+F
"		下方向のカーソル移動：Ctrl+J
"		上方向のカーソル移動：Ctrl+K
"		検索結果の選択(開く)：Enter
"		　　　々　(水平分割)：Ctrl+X
"		CtrlPの終了　　　　 ：Esc

" migemo：ローマ字のまま日本語をインクリメンタル検索
"call minpac#add('koron/cmigemo')

" Perl言語用の正規表現での検索用プラグイン。
"call minpac#add('othree/eregex.vim', {'type': 'opt'})
"	他のプラグインとの設定が干渉する可能性がある。
"	使いこなせないため、導入見送り。

" *記号と#記号による検索を現在の選択範囲に広げるプラグイン。
call minpac#add('nelstrom/vim-visual-star-search', {'type': 'opt'})

"	対になる開き記号と閉じ記号の移動プラグイン
"call minpac#add('andymass/vim-matchup', {'type': 'opt'})
"		動かない。

"	モーション拡張プラグイン
call minpac#add('easymotion/vim-easymotion', {'type': 'opt'})
"	リーダキー2回にモーションにて、動く。
"		\\w
"		→ワード単位で動く場合に加えて、どのワード単位に移動するかを選択できる。

" ファイル検索
"call minpac#add('junegunn/fzf')
"	外部バイナリからの実行補佐プラグイン？

" Explorer
"call minpac#add('weirongxu/coc-explorer')
"nmap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
"	制約が多く使えない。
"		https://github.com/neoclide/coc.nvim
"		を使用している前提が必要？

" エクスプローラ
"call minpac#add('lambdalisue/fern.vim', {'type': 'opt'})
if isdirectory(expand(minpackSTART . "fern.vim"))  || isdirectory(expand(minpackOPT . "fern.vim"))
	" このプラグイン使っていない。
noremap <Leader>er :Fern . -reveal=%<CR>
nnoremap <F13> :<c-u>Fern . -drawer -stay -keep -toggle -reveal=%<CR>
"	j	ツリーを下に移動
"	k	ツリーを上に移動
"	l	フォルダを開く
"	h	フォルダを閉じる
"	Enter	(フォルダ上で)子階層に移動
"	Ctrl + w → Ctrl + w	内部ウィンドウの移動
"	Ctrl + h	親階層に移動
"	Ctrl + m	フォルダを開く。
"	e	ファイルを開く
"	Shift + e	垂直分割してファイルを開く。
"	-	ファイルを選択

" 以下、数種類を無効化したいができない。
"	Shift + c	ファイルをコピー
noremap <Nop>clipboardCopy <Plug>(fern-action-clipboard-copy)
"	Shift + m	ファイルをカット
noremap <Nop>clipboardMove <Plug>(fern-action-clipboard-move)
"	Shitf + p	ファイルをペースト
noremap <Nop>clipboardPaste <Plug>(fern-action-clipboard-paste)
"	Shift + d	ファイルを削除
noremap <Nop>trash <Plug>(fern-action-trash)
"	Shift + r	ファイル名を変更
"	Shift + k	ディレクトリ作成
noremap <Nop>newDir <Plug>(fern-action-new-dir)
"	Shift + n	ファイル作成
noremap <Nop>newFile <Plug>(fern-action-new-file)
"	?	ヘルプ
endif

" エクスプローラ(上記より見やすい。)
call minpac#add('scrooloose/nerdtree', {'type': 'opt'})

" 以下、日本語用フォント
"call minpac#add('tsunesan3/awsome-jp-coding-fonts', {'type': 'opt'})
"	プラグイン導入ではなく、直接zip形式で取得し、好みのフォントを手動でインストールするのが吉(すべてを取得するのは容量が大きく、時間がかかる)。


" タグ登録済みの一覧表示
call minpac#add('preservim/tagbar', {'type': 'opt'})
"call minpac#add('majutsushi/tagbar', {'type': 'opt'})


" コンパイル実行
call minpac#add('thinca/vim-quickrun', {'type': 'opt'})

" Git
call minpac#add('airblade/vim-gitgutter')
"	※他のプラグインより優先度が高いようだ(lspの指摘を差し置いて、差分表示が優先された)。

call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb', {'type': 'opt'})	" vim-fugitiveとの連携で、ブラウザでの比較を行う。
	" :Gbrowse		github.com 上の該当のファイルをブラウザで開いてくれてプレビュー

" マーク表示
call minpac#add('jacquesbh/vim-showmarks', {'type': 'opt'})

" 囲み文字の編集	（括弧入力・削除により、閉じ括弧を自動補完する）。
"call minpac#add('jiangmiao/auto-pairs')
"call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
"call minpac#add('cohama/lexima.vim', {'type': 'opt'})
"	なぜか日本語入力時に挙動がおかしくなり、正常入力できなくなる。
"		しかし、Windows版では問題なく動く。
"	原因　⇒　set noimdisable
"		MacVim-KaoriYa版にしたことで、悪化した。

"call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
"	上記同様日本語入力時に挙動がおかしくなり、正常入力できなくなる。
"	⇒一応対策を取ったが、Escキー押下時に日本語入力をOFFにしてくれなくなった20210327
"	以下、プラグインの制御で、日本語入力ON/OFFを切り替えるのだが、Macの場合は外部ツールが必要になるため、このプラグインの導入も見送る20210327
"call minpac#add('fuenor/im_control.vim')

"call minpac#add('cohama/lexima.vim', {'type': 'opt'})
"	上記同様日本語入力時に挙動がおかしくなり、正常入力できなくなる。

call minpac#add('kana/vim-smartinput', {'type': 'opt'})
"	一時削除(ATOKとの競合確認)20220112
"		このプラグインがATOKと競合を起こす(Macのみ？)。

"call minpac#add('vim-denops/denops.vim')
"call minpac#add('higashi000/dps-kakkonan')
"	使い方が分からない。

"call minpac#add('rhysd/vim-operator-surround')
"	私の想像と違うプラグインだ。括弧を付けたら自動で閉じ括弧を付けるのではない。括弧に対してどうするのかを指示しなければならない。

" やり直し・取り消しを取り消す。
"call minpac#add('sjl/gundo.vim')
"	※Pythonで動けるコンパイル済みのvimエディタが必須。


" やり直し・取り消しを取り消す。
call minpac#add('mbbill/undotree', {'type': 'opt'})
"	Pythonなしでいける。
"	永続的な取り消しを有効にする場合、
":h persistent-undo

" セッション管理
call minpac#add('xolox/vim-session', {'type': 'opt'})
"	以下を導入しなければ、上記セッションプラグインが動かない。
call minpac#add('xolox/vim-misc', {'type': 'opt'})

" プロジェクト管理
"	https://zenn.dev/mattn/articles/965145fa78af93
call minpac#add('mattn/vim-findroot', {'type': 'opt'})
"	どのような挙動をするのが正しいのかわからないため、遅延読み込みさせられない20210316

" タブ補完
"call minpac#add('ervandew/supertab')
"	普通のTabキー入力が打てなくなる(Ctrl+TabでTab入力)。
"	⇒文字に続けてTabを打つ場合に補完が働くのか・・・やっぱり邪魔くさいな。

" カレンダ表示
call minpac#add('itchyny/calendar.vim')
"	これはさすがにやり過ぎ。と言うか、使い勝手は悪い。

"	文字コードの自動判定(以下、どちらもutf7やutf16は判定してくれない)
"call minpac#add('mbbill/fencview')
"call minpac#add('tyru/fencview.vim')

endif	" パッケージ管理の読み込みなど
"	ーーーーーーーーーーーーーーーーーー 遅延読み込みここまで ーーーーーーーーーーーーーーーーーー

" セッション管理
if isdirectory(expand(minpackSTART . "vim-session"))  || isdirectory(expand(minpackOPT . "vim-session"))
	"let s:local_session_directory = expand('~/.vim_backup/sessions')
	if ( has('win32') || has('win64') )
		let g:session_directory = expand($HOME) . "/.vim_backup/sessions"
	else
		let g:session_directory = expand('~/.vim_backup/sessions')
	endif
	" このやり方で合っているのか？	そもそもこの設定をしていなくてもロックファイルは作られるぞ？
	let g:session_lock_directory = g:session_directory
	" session保持ファイルの拡張子
	let g:session_extension = '.vimSession'
	" vim終了時に自動保存しない。
	let g:session_autosave = 'no'
	" 引数なしでvimを起動した時にセッションを復元しない
	let g:session_autoload = 'no'
	" 1分間に1回自動保存をしない
	let g:session_autosave_periodic = 0
	" オートセーブをする場合、無音で実施。
	let g:session_autosave_silent = 1
	" プロンプト表示無し。
	"let g:session_verbose_messages = 0
	" プラグイン無効化
	"let g:loaded_session = 1

	if has("gui_running")
	else
		"if g:isDroid || g:isTermux
		" メニューの無効化(CUIなので)。
		let g:session_menu = 0
		"endif
	endif

	" ■使い方
	"	:SaveSession		⇒	~/.vim_backup/sessions/default.vimSession
	"	:SaveSession hoge	⇒	~/.vim_backup/sessions/hoge.vimSession
	"	:OpenSession		⇒	~/.vim_backup/sessions/default.vimSession
	"	:OpenSession hoge	⇒	~/.vim_backup/sessions/hoge.vimSession
	"	:ViewSession		⇒	保存済みのセッションが一覧として表示される
	"							(表示される番号のセッションを開いた場合、セッションファイルそのものが開く)。
	"	:DeleteSession		⇒	保存済みのセッションが一覧として表示され、番号入力にて、それに紐付くセッションファイルが削除される。
	"	:CloseSession		⇒	現在開いているセッションが終了する(バッファにも残らない)。
	"	:OpenTabSession		⇒	現在のバッファを開きつつ指定のセッションを開く。
	"	:SaveTabSession
	"	:AppendTabSession
	"	:CloseTabSession
endif


" 以下、遅延読み込み用の対応(これをすることで遅延読み込みにしたのが無駄になる？)。
"	読み込む順番が大事なプラグインもあるため気をつけること。
"		例）vim-miscのあとに、vim-sessionを読み込む必要がある(今のところこれだけ)。
let packPluginlists = [
	\ 'vim-goimports',
	\ 'vim-lsp-snippets',
	\ 'vim-quickrun',
	\ 'tagbar',
	\ 'undotree',
	\ 'vim-misc',
	\ 'vim-session',
	\ 'vim-findroot',
	\ 'xptemplate',
	\ 'nerdtree',
	\ 'vim-showmarks',
	\ 'vim-visual-star-search',
	\ 'vim-easymotion',
	\ 'vim-rhubarb',
	\ 'vim-commentary',
	\ 'delimitMate',
	\ 'lexima.vim',
	\ 'vimdoc-ja',
	\ ]
	"\ 'vim-matchup',
	"\ 'vim-smartinput',
for pluginPack in packPluginlists
	if isdirectory(expand(minpackSTART . pluginPack))  || isdirectory(expand(minpackOPT . pluginPack))
		execute("packadd " . pluginPack)
	endif
endfor

" ここまでがIDE用の設定プラグイン

" すべてのプラグインを起動時に読み込むのであれば、以下を実行。
"	基本的に、vimrc読み込み後に、自動的に下記コマンドが実行される。
"packloadall

"if isdirectory(expand(minpackSTART . "vim-indent-guides"))  || isdirectory(expand(minpackOPT . "vim-indent-guides"))
"	" デフォルトマッピング：<Leader>ig.	トグル
"" 以下、常に有効化。
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar' ]
"" 以下、gVim用の色変更(逆に言えば、これを設定しなければ動かない？)。
""let g:indent_guides_auto_colors = 0
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"endif

"if isdirectory(expand(minpackSTART . "indentLine"))  || isdirectory(expand(minpackOPT . "indentLine"))
"let g:indentLine_color_term =239
"let g:indentLine_color_gui = '#708090'
"let g:indentLine_char = '¦'
""let g:indentLine_char = '' "use ¦, ┆ or │ 
""let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"endif

" ■マーク
if isdirectory(expand(minpackSTART . "vim-showmarks"))  || isdirectory(expand(minpackOPT . "vim-showmarks"))
":DoShowMarks!
" 起動時にマーク表示
aug show-marks-sync
	au!
	au BufReadPost * sil! DoShowMarks
aug END
endif

" 疑問点
"	vim-lsp
"	このプラグインを読み込むことで、Vim起動時に再描画が発生してしまう。
"	ーーーここまでがパッケージ管理ーーー



" ■IDEのように補完してくれる
"	https://mattn.kaoriya.net/software/vim/20191231213507.htm
if isdirectory(expand(minpackSTART . "vim-lsp"))  || isdirectory(expand(minpackOPT . "vim-lsp"))
" ファイルの変更に伴いリアルタイムにエラー表示する機能
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

" LSP の仕様である textEdit を有効にする設定
let g:lsp_text_edit_enabled = 0

let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}
endif


" クイックラン
if isdirectory(expand(minpackSTART . "vim-quickrun"))  || isdirectory(expand(minpackOPT . "vim-quickrun"))
	" Ver.0.9.0にて、デフォルトキーマッピングが削除されたため、ここで定義し直す。
	nnoremap <Leader>r :QuickRun<CR>
endif

" Goインポートプラグイン
if isdirectory(expand(minpackSTART . "vim-goimports"))  || isdirectory(expand(minpackOPT . "vim-goimports"))
"let g:goimports = 1
"let g:goimports_simplify = 1
"	使うのであれば、1を設定する。
"		https://github.com/mattn/vim-goimports#requirements
unlet! g:goimports_simplify
endif

"	https://github.com/Shougo/deoplete.nvim
"let g:deoplete#enable_at_startup = 1

"if isdirectory(expand(minpackSTART . "vim-smartinput"))  || isdirectory(expand(minpackOPT . "vim-smartinput"))
"	公式サイト：https://github.com/kana/vim-smartinput/blob/master/doc/smartinput.txt
"	let g:smartinput_no_default_key_mappings = 2
"endif

if isdirectory(expand(minpackSTART . "asyncomplete.vim"))  || isdirectory(expand(minpackOPT . "asyncomplete.vim"))
	" よく分からないがピリオド記号などが直前にあった場合候補が出てこない。そして、候補を出すこともできない(必ず候補を出したい直前は半角スペースが必須)。
	"	私の設定に問題があると思う。

let g:lsp_async_completion = 1

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_remove_duplicates = 1

" 自動で入力補完ポップアップを表示する設定
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
"let g:asyncomplete_auto_completeopt = 0
" ポップアップを表示するまでのディレイ
let g:asyncomplete_popup_delay = 200

" 補完表示時のEnterで決定)改行しない。
"inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

"	Tabで確定したい。
inoremap <expr><Tab> pumvisible() ? "<C-y>" : "\<Tab>"
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "\<CR>"
"	補完候補の選択を矢印キーで行う。
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
"
" 補完候補の再表示(Javaとは相性が悪い)。
"	For Vim 8 (<c-@> corresponds to <c-space>):
"	imap <c-@> <Plug>(asyncomplete_force_refresh)
"inoremap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <c-@> <Plug>(asyncomplete_force_refresh)
endif


" スニペッツ
"if isdirectory(expand(minpackSTART . "ultisnips"))  || isdirectory(expand(minpackOPT . "ultisnips"))
"	funcと入力してタブを押下するとスニペットが展開されるようだが、動かないぞ？
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
"let g:UltiSnipsEditSplit="vertical"

" 自作スニペット
"let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
"set runtimepath+=~/.vim/snippets
" そもそもスニペットって何？
"endif



" ■シンタックスチェック
if isdirectory(expand(minpackSTART . "syntastic"))  || isdirectory(expand(minpackOPT . "syntastic"))
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
endif

if isdirectory(expand(minpackSTART . "nerdtree"))  || isdirectory(expand(minpackOPT . "nerdtree"))
nnoremap <Leader>er :noswapfile NERDTreeToggle<CR>
nnoremap <silent><C-F13> :NERDTreeToggle<CR>
"	if g:isDroid || g:isTermux
"		nnoremap <Leader>e :noswapfile NERDTreeToggle<CR>
"	else
"		nnoremap <silent><C-F13> :noswapfile NERDTreeToggle<CR>
"	endif
	" ●ファイル操作系
"		o(enter)	ファイルを開く
"		go	ファイルを開き、カーソルはツリーに保持する
"		t	タブで開く
"		T	タブで開き、移動はしない
"		i	水平分割して開く
"		gi	水平分割して開き、移動はしない
"		s	垂直分割して開く
"		gs	垂直分割して開き、移動はしない
"
	" ●ディレクトリ操作系
"		o(enter)	フォルダを開く
"		O	再帰的にディレクトリをすべて開く
"		x	親ディレクトリを閉じる
"		X	再帰的にすべての子ディレクトリを閉じる
"		e	新しいツリーを生成する
"
	" ●ツリー操作系
"		P	ルートディレクトリへ移動
"		p	親ディレクトリへ移動
"		K	一番上へ移動
"		J	一番下へ移動
"		Ctrl+k	一つ上へ移動
"		Ctrl+j	一つ下へ移動
"
	" ●ファイルシステム系
"		C	ツリーのルートを選択したディレクトリに変更
"		u	ツリーのルートを上の階層にする
"		U	変更前のツリーの状態を保持して、ツリーのルートを上の階層にする
"		r	選択したディレクトリをリフレッシュする
"		R	ツリーのルートをリフレッシュする
"		m	メニューを表示する
"		cd	選択したディレクトリにcwdを変更する
"		CD	cwdをツリールートに変更する
"
	" ●その他
"		I	隠しファイルの表示、非表示
"		B	ブックマークの表示・非表示
"		F	ファイルの表示・非表示
endif

" ■Git
"	ステータスに、現在のバッファから変更・追加・削除の行数を表示する。
if isdirectory(expand(minpackSTART . "vim-gitgutter"))  || isdirectory(expand(minpackOPT . "vim-gitgutter"))
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction

" 探すGitディレクトリ
let git_name = '.git'

" ディレクトリを遡り、タグファイルを探し、パス取得
let gits_path = finddir(git_name, '.;')

" Gitディレクトリが見つからなかった場合
if gits_path ==# ''
	" ステータスへの表示なし。
else
	" ステータスバーにGitステータスを表示する。
set statusline+=%{'(Git:'.GitStatus().')'}
endif

" Gitディレクトリパスを取得
" `:p:h`の部分は、:h filename-modifiersで確認
"let gits_dirpath = fnamemodify(gits_path, ':p:h')

"	以下、記号列を常時表示。
"set signcolumn=yes
"	以下、起動時のハイライト有効設定
let g:gitgutter_highlight_lines = 1
"let g:gitgutter_highlight_linenrs = 1
"if ( has('win32') || has('win64') )
"		※以下を有効にすることで、GitGutterが無効化される？
"	let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
"endif

" 優先度を上げる。
let g:gitgutter_sign_allow_clobber = 0

let g:gitgutter_sign_removed_first_line = "^_"
let g:gitgutter_override_sign_column_highlight = 0

"	色の変更は、GUIでは反映されない？
"	以下、記号列の色がなくなる？(下記とかぶるため、順序に気をつけること)
"highlight! link SignColumn LineNr

"	以下、記号列の色をつける(上記とかぶるため、順序に気をつけること)。
highlight SignColumn guibg=NONE ctermbg=NONE
"		↑
"	これ(NONE)はこれで他の設定を上書きする(指定無しという指定をしているため)。

"	以下、記号列の記号色が変わる。
highlight GitGutterAdd ctermfg=blue ctermbg=NONE
highlight GitGutterChange ctermfg=yellow "ctermbg=NONE
highlight GitGutterDelete ctermfg=red "ctermbg=NONE
highlight GitGutterChangeDelete ctermfg=green "ctermbg=NONE

"	以下、文書上の線の色が変わる(予想に反した色になる)。
"	highlight GitGutterAddLine ctermfg=NONE ctermbg=blue	" 追加
"	highlight GitGutterChangeLine ctermfg=yellow ctermbg=NONE	" 変更
"	highlight GitGutterDeleteLine ctermfg=white ctermbg=red	" 削除
"	highlight GitGutterChangeDeleteLine ctermfg=green ctermbg=green	" 既存の部分を削除で反映？

" ■Git操作用プラグインの簡易操作
" vim-GitGutter
"	<Leader>hs：ハンク部分のステージング
"				以下の定義で、ステージング方法を追加。
noremap <leader>ha :GitGutterStageHunk<cr>

" GitGutterの行ハイライト切り替え(トグル)
"	以下のhは必要か？
"	CUI用のvimでは、無効化される。その代わり、文字の大小トグルとして働く20210207
nmap <Leader>h :GitGutterLineHighlightsToggle<CR>
nmap <F19>     :GitGutterLineHighlightsToggle<CR>
"	CUI用vimの場合、F16以降はMacに機能が奪われてしまい、一般的なファンクションキーとして動かない。
endif


" vim-fugitive
if isdirectory(expand(minpackSTART . "vim-fugitive"))  || isdirectory(expand(minpackOPT . "vim-fugitive"))
"	ステータス(git status)のこと。
nnoremap <leader>gs :tab sp<CR>:Gstatus<CR>:only<CR>
"	git add
nnoremap <leader>ga :Gwrite<CR>
"	git blame
nnoremap <leader>gb :Gblame<CR>
	" 行ごとに最終コミットされた時期・誰かを一覧にする。
"alias logall='log --graph --pretty=format:\'%Cred%h %Cgreen(%>(15,trunc)%cr, %ci) %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s\' --abbrev-commit --date=relative --all'
"	git commit(無効化したつもり)
"nnoremap <leader>gc :Gcommit<CR>
nnoremap <Nop>Gcommit <Plug>
"	git log
nnoremap <leader>gl :Git log<CR>
"	変更履歴(架空コマンドgit history)
nnoremap <leader>gh :tab sp<CR>:0Glog<CR>
" abbrev for `git history`: create new quickfix tab for history
"	git push(無効化したつもり)
"nnoremap <leader>gp :Gpush<CR>
nnoremap <Nop>Gpush <Plug>
"	git pull
nnoremap <Leader>gll :Gpull<CR>
"	git fetch
nnoremap <leader>gf :Gfetch<CR>
"	diff	<Leader>gsのdvと同じ
nnoremap <leader>gd :Gvdiff<CR>
"	git rebase -i
nnoremap <leader>gr :Grebase -i<CR>
"	gitgrep
nnoremap <leader>gg :Ggrep 
"	git merge
nnoremap <leader>gm :Gmerge 
"	ブラウザ表示
nnoremap <Leader>o :Gbrowse<CR>
endif


" タグ一覧表示の切り替え(トグル)
if isdirectory(expand(minpackSTART . "tagbar"))  || isdirectory(expand(minpackOPT . "tagbar"))
	" 以下のキーマップは、<記号キーに当てはまるようにしている。
nmap <F8> :TagbarToggle<CR>
	" タグと言うことで、Tキーに割り当てている。
nmap <F15> :TagbarToggle<CR>
endif

" アンドゥツリー切り替え(トグル)
"if isdirectory(expand(minpackSTART . "gundo.vim"))  || isdirectory(expand(minpackOPT . "gundo.vim"))
"	" Pythonを含むVim環境が必要なため、動かせないプラグインになる。
"nmap <Leader>u :GundoToggle<CR>
"	" 以下のキーマップは、uキーに当てはまるようにしている。
"nmap <F17> :GundoToggle<CR>
"endif

" アンドゥツリー切り替え(トグル)
if isdirectory(expand(minpackSTART . "undotree"))  || isdirectory(expand(minpackOPT . "undotree"))
	" 普段のやり直しプラグインはこっちを使っている。
nmap <Leader>u :UndotreeToggle<CR>
	" 以下のキーマップは、uキーに当てはまるようにしている。
nmap <F17> :UndotreeToggle<CR>
endif

" プロジェクト管理
if isdirectory(expand(minpackSTART . "vim-findroot"))  || isdirectory(expand(minpackOPT . "vim-findroot"))
"	以下、ルートディレクトリ設定
let g:findroot_patterns = [
\  'tags',
\  'README.md',
\  '.gitignore',
\  'Rakefile',
\  'pom.xml',
\  'project.clj',
\  '*.csproj',
\  '*.sln',
\  '.git/',
\  '.svn/',
\  '.hg/',
\  '.bzr/',
\]

" カレントディレクトリの変更不可。
"let g:findroot_not_for_subdir = 0
endif

"if isdirectory(expand(minpackSTART . "vim-visual-star-search"))  || isdirectory(expand(minpackOPT . "vim-visual-star-search"))
"	*と#による選択範囲検索。
"endif

if isdirectory(expand(minpackSTART . "vim-easymotion"))  || isdirectory(expand(minpackOPT . "vim-easymotion"))
	"	http://haya14busa.com/mastering-vim-easymotion/
	" 以下の設定は、移動選択肢が1つの場合に限り、移動選択肢をせずに、即座に移動する。
	"	f移動・t移動。	←☆それぞれリーダーキーとの組み合わせになる(要は、利用は1タップ増加する)。
	map <Leader>f <Plug>(easymotion-fl)
	"map <Leader>f <Plug>(easymotion-bd-f)
	"nmap <Leader>f <Plug>(easymotion-overwin-f)
	map <Leader>t <Plug>(easymotion-tl)
	"map <Leader>t <Plug>(easymotion-bd-t)
	map <Leader>F <Plug>(easymotion-Fl)
	"map <Leader>F <Plug>(easymotion-bd-F)
	map <Leader>T <Plug>(easymotion-Tl)
	"map <Leader>T <Plug>(easymotion-bd-T)

	"<Plug>(easymotion-next)
	"<Plug>(easymotion-prev)
	"<Plug>(easymotion-repeat)

	" 以下は、日本語文字も検索対象とする(ローマ字にした場合の先頭文字で移動する。
	"	例）検索を対象とする場合、kで移動対象にできる)。
	let g:EasyMotion_use_migemo = 1
endif


if isdirectory(expand(minpackSTART . "vim-fugitive"))  || isdirectory(expand(minpackOPT . "vim-fugitive"))
function! s:save_session(...)
	if a:0
		let session_name = a:1
	else
		" fugitive.vimの機能を使っているのはブランチ名を取得する部分のみ
		" substitute(system('git rev-parse --abbrev-ref HEAD'), '\n', '', 'g')などで代替可能
		let session_name = fugitive#head()
	end

	if strlen(session_name)
		execute 'SaveSession .'.session_name.'.session'
	else
			SaveSession
	endif
endfunction

function! s:load_session(...)
	if a:0
		let session_name = a:1
	else
		let session_name = fugitive#head()
	end

	if strlen(session_name)
		execute 'OpenSession .'.session_name.'.session'
	else
		execute 'OpenSession '.g:session_default_name
	endif
endfunction

command! -nargs=? BranchSave call s:save_session(<f-args>)
command! -nargs=? BranchLoad call s:load_session(<f-args>)
endif

if isdirectory(expand(minpackSTART . "ctrlp.vim"))  || isdirectory(expand(minpackOPT . "ctrlp.vim"))
	" .gitignoreに書き込まれたファイルを無視する20210403
	"	https://github.com/ctrlpvim/ctrlp.vim/blob/master/readme.md#basic-options
	"	以下、git管理以外でもスワップファイルやバックアップファイルなどを開きたくない対処をしたいが、失敗。
	"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
	"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard', 'git -C ~/.config/git/ignore']
	"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
	"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
	let g:ctrlp_user_command = ['.git', 'git -C "%s" ls-files']
endif

" 正規表現(検索)
if isdirectory(expand(minpackSTART . "eregex.vim"))  || isdirectory(expand(minpackOPT . "eregex.vim"))
	nnoremap <Leader>/ :M/
"
"	" 改行コードの設定？
"	let eregex_replacement=3

"	" 置換の場合
"	"	:[range]S/{eregex}/{string}/[&cegpriISCDMm]
"	"		など。
endif

" supertab
"let g:SuperTabDefaultCompletionType = "<c-n>"
"	補完の操作を逆にする。

"	ーーーここまでがパッケージ設定ーーー

if (has('win32') || has('win64') )
"	IEでは表示されない。
"	let g:previm_open_cmd = 'C:\\Program\ Files\\Internet\ Explorer\\iexplore.exe'
"	let g:previm_open_cmd = 'C:\\Program\ Files\ \(x86\)\\Google\\Chrome\\Application\\chrome.exe'
"	let g:previm_open_cmd = 'C:\\Program\ Files\ \(x86\)\\Microsoft\\Edge\\Application\\msedge.exe'
	let g:previm_open_cmd = 'C:\/\/Program\ Files\/Mozilla\ Firefox\/firefox.exe'
elseif (has('gui_macvim') || has('mac') )
"	let g:previm_open_cmd = 'open -a "Google Chrome"'
	let g:previm_open_cmd = 'open -a Firefox'
	" サファリブラウザで開けない(ブラウザそのものは開くが"Loading... "が表示されて固まる)。
"	let g:previm_open_cmd = 'open -a Safari'
elseif has('xfontset')
endif

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:vim_markdown_folding_disabled=1	" 自動折りたたみ無効化
" Ctrl-pでプレビュー(他のプラグインとダブってしまうため、\pにした)
"	CtrlPプラグインとかぶるため変更	nnoremap <silent> <C-p> :PrevimOpen<CR>
"	markdown.vimに待避	nnoremap <Leader>p :PrevimOpen<CR>
augroup filetype_markdown
	" マークダウンファイルのみ有効
	au!
	au FileType markdown packadd previm
	au FileType markdown nnoremap <Leader>p :PrevimOpen<CR>
"	setlocal expandtab
augroup END


command! PackUpdate source ~/.vimrc | call minpac#update()
command! PackClean  source ~/.vimrc | call minpac#clean()
command! PackStatus source ~/.vimrc | call minpac#status()
"	ーーーパッケージ管理下での設定ここまでーーー

"if g:isDroid || g:isTermux
"	echo "I'm Android"
"else
"	echo "I'm Not Android"
"	エディタ起動後に、デスクトップに移動する。
"	cd $HOME/Desktop

	" ファイルをカレントバッファにした場合、そのディレクトリに移動する。
"	set autochdir
"	これをコメントアウトする場合、上記のデスクトップ移動もコメントアウトする必要がある。
"endif

" バッファで開いているファイルのディレクトリでエクスクローラを開始する
"set browsedir=buffer

" Vimから使えるデバッガUI
augroup MyTermDebug
	" C言語ファイルのみ有効
	au!
	au FileType c packadd termdebug
augroup END

" 外部コマンド実行用ショートカットエイリアス
noremap! <C-r>e <C-r>=systemlist('')<Left><Left>
"	使用例）Ctrl+rからのeキー押下後、lsコマンドなどを入力することで、lsが（'')内に収まり、('ls')として外部コマンドが実行される。
"	その結果がvimに入力される。


" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
	set langmenu=japanese
endif


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

" コマンドラインの場合は、IM(インプットメソッド)がオンになる20190827
"	https://vim-jp.org/vimdoc-ja/options.html#'imcmdline'
"imcmdline
"	"command+v=貼り付け"をしたとき、IMEが勝手にオフにならないようにしたいのだが、この設定では無かったようだ20190827

"---------------------------------------------------------------------------
" フォント設定:
"
if (has('win32') || has('win64') )
	" Windows用
	"set guifont=MS_Gothic:h12:cSHIFTJIS
	"set guifont=MS_Mincho:h12:cSHIFTJIS
	" 行間隔の設定
	set linespace=1
elseif has('gui_macvim')
"	set guifont=Osaka-Mono:h16
elseif has('mac')
"	set guifont=Osaka－等幅:h14
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
"syntax reset
"syntax on


"---------------------------------------------------------------------------

" 上書き後に終了するコマンドを無効化する。
nnoremap ZZ <Nop>

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
"	インサートモードでバックスペース機能を有効にする。
	"BSで削除できるものを指定する
	" indent  : 行頭の空白
	" eol     : 改行
	" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" 大小文字を区別せずに検索する。
set ignorecase
"	一時的に区別しせずに検索する場合は、\cを付けることで、対応できる。
"		\C	大文字にした場合、区別して検索する(このオプションは、ignorecase・smartcaseより優先される)。

" 大文字を含む場合は、大小文字を区別して検索するが、すべて小文字の場合は大小文字を区別せずに検索する。
set smartcase

"	検索方法を自然な正規表現に変換(very Magic)
nnoremap / /\v
	"	\Vの場合は、一部の例外を除き、記号を無効化し、その記号のまま検索する。
	"	Perl系の検索が出来るようになるとのことだった。

"	マッチ箇所をハイライト
set hlsearch
"		ハイライト解除の場合はExコマンド上で"noh"を打てば消える(再度検索すればハイライトになる)。
nnoremap <C-l> :nohlsearch<CR><C-l>
"		Ctrl+l	の組み合わせでハイライト解除にした。

"	ファイル端に達した場合、一周して検索を続行する。
set wrapscan

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd FileType help,qf nnoremap <buffer> q <C-w>c

"	以下、vimgrep・grep・Ggrepの3種類のコマンドに対して、自動的にquickfix-windowを開く。
autocmd QuickFixCmdPost *grep* cwindow

"	対となるキーワード間の移動(検索)
if &compatible
	" 機械翻訳：`:set nocp`には多くの副作用があります。 したがって、これは「互換性」が設定されている場合にのみ実行する必要があります。
	set nocompatible
endif
filetype plugin on
"runtime macros/matchit.vim

" 対の記号移動。
"let g:matchit = 0
"source $VIMRUNTIME/macros/matchit.vim

" 括弧の対応関係を一瞬表示
"set showmatch
"set matchtime=1
"	%移動の拡張
source $VIMRUNTIME/macros/matchit.vim

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz
" メモ
"	g;：変更箇所にジャンプ
"	g,：変更箇所にジャンプした場所から戻る。

" fモーションのカスタマイズ	By.@monaqa
noremap fj f<C-k>j
noremap Fj F<C-k>j
noremap tj t<C-k>j
noremap Tj T<C-k>j
  " jへの移動は、以下jjで移動する。	←☆これを忘れる。
digraphs jj 106
" 以下、続く。

"	カッコ
digraphs j( 65288  " （
digraphs j) 65289  " ）
digraphs j[ 12300  " 「
digraphs j] 12301  " 」
digraphs j{ 12302  " 『
digraphs j} 12303  " 』
digraphs j< 12304  " 【
digraphs j> 12305  " 】

"	句読点
digraphs j! 65281  " ！
digraphs j? 65311  " ？
digraphs j: 65306  " ：
"digraphs j, 65292  " ，
digraphs j, 12289  " 、
"digraphs j. 65294  " ．
digraphs j. 12290  " 。

"	数字
digraphs j0 65296  " ０
digraphs j1 65297  " １
digraphs j2 65298  " ２
digraphs j3 65299  " ３
digraphs j4 65300  " ４
digraphs j5 65301  " ５
digraphs j6 65302  " ６
digraphs j7 65303  " ７
digraphs j8 65304  " ８
digraphs j9 65305  " ９

"	その他の記号
digraphs j~ 12316  " 〜
digraphs j/ 12539  " ・
digraphs js 12288  " 　	←☆これを忘れる。

" ctagsの検索場所を親ディレクトリから再帰的に探す。
"		https://github.com/universal-ctags/ctags
set tags=tags;$HOME;
"	Ctrl+]：定義場所に移動する。Push
"	Ctrl+t：タグスタックを遡る(カーソルが前いたファイルの位置に戻る)。Pop
"	:tn・:tp：同名タグを順に移動する。
"	ctags -R .	タグ作成(-Rオプション：現在のディレクトリから再帰的に解析する。-fオプション：タグ名を付けられる。)
"	以下、自動でタグ作成(ファイルを保存するたびに、そのディレクトリにタグファイルが生成される)
"augroup ctags
"	autocmd!
"	autocmd BufWritePost *.go,*.py,*.c,*.h silent! !ctags -R &
"augroup END
"	以下、タグファイルがなければ何もしない。
function! s:execute_ctags() abort
	" 探すタグファイル名
	let tag_name = 'tags'

	" ディレクトリを遡り、タグファイルを探し、パス取得
	let tags_path = findfile(tag_name, '.;')

	" タグファイルパスが見つからなかった場合
	if tags_path ==# ''
		return
	endif

	" タグファイルのディレクトリパスを取得
	" `:p:h`の部分は、:h filename-modifiersで確認
	let tags_dirpath = fnamemodify(tags_path, ':p:h')
	" 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
	execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction
autocmd BufWritePost * call s:execute_ctags()
command! TagsMake !ctags -R .

" 改行時に、前の行を構文解析後に、カレント行のインデント増減を決める。
set smartindent
inoremap # X<C-H>#

" <C-a>の増減を10進数で行う。
set nrformats=


" コマンドモードの補完(ステータスラインに自動補完の選択肢を出す)20210123
set wildmenu
"set wildmode=list:longest,full	"	←最長マッチまで補完してから自動補完メニューを開く(マスタリングVim_P71)20210117
"									fullのみが規定値(それ以外は個人付け足し)
set wildmode=longest,full
set history=800 " 保存するコマンド履歴の数



" 補完メニュー数(標準では最大数が設定されている)
set pumheight=10
"	インサート補完モード
"		Ctrl+x
"		このコマンドに続けて、以下の4種類のどれかを選ぶことで、補完が完了する。
"			Ctrl+l	行をまるごと補完
"			Ctrl+]	タグ補完
"			Ctrl+f	ファイル名補完
"			s		スペルチェック候補の補完(spell設定が有効の場合)
"		help ins-completion
"		help 'complete'
"
" 常時補完候補を表示する(初回の補完時に挿入しない)
"set completeopt=menuone,noinsert
"set completeopt=menuone,longest
"set completeopt=menuone,insert
"set completeopt=menuone
set completeopt=menuone,noinsert,noselect,preview


"	スペルチェックをするようだが、日本語未対応なのか、技術用語未対応なのか分からないが、使い物にならない。
"set spell

"	ファイル名の指定だけでPathを指定せずに開けるようにする。
"if ( has('win32') || has('win64') )
"	set path+="C:\asakunotomohiro\dotfiles\**"
"	フルPathは無理なようだ	→実践vim(ISBN978-4-04-891659-2)	P138	20180807
"endif


"		個人の辞書ファイルから補完候補を抜き出す。
"set complete+=k~/dotfiles/mydic.txt

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定
" autofmt: 日本語文章のフォーマット(折り返し)プラグイン。
set formatexpr=autofmt#japanese#formatexpr()


"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" ビープ音を鳴らさない
"	画面がチラチラするため、これを設定するわけにはいかない。
"set vb t_vb=
"	以下なら問題ない。
set belloff=all

" 他で書き換えられたら自動で読み直す
set autoread

" 行番号を表示 (nonumber:表示しない)
set number

"	下記は、行番号をカレント行から相対的に表示
"set relativenumber
"		状況によっては動作が遅くなる。
set norelativenumber

" ルーラーを表示 (noruler:非表示)
"	右下に表示される。
set ruler

" タブや改行を表示 (nolist:表示しない)
set list

" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,extends:<,trail:-,eol:<

" カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

" 常にステータス行を表示 (詳細は:he laststatus)
"	EXコマンドラインとの境目を付けるために必要だろう。
set laststatus=2
"	Androidの場合少ない幅にしたいが、1を設定した場合表示されなくなる。

" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
"	EXコマンドラインのため、2ぐらいが適当？（1との違いが不明）。
set cmdheight=2

" タイプ中のコマンドを表示
set showcmd


" カーソルの移動として画面幅いっぱいまで移動させる設定。

set scrolloff=0
"	:help L

" 見た目の行数で移動する.
"nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
"xnoremap <expr> j (v:count == 0 && mode() ==# 'v') ? 'gj' : 'j'
"nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
"xnoremap <expr> k (v:count == 0 && mode() ==# 'v') ? 'gk' : 'k'

"---------------------------------------------------------------------------
" 編集に関する設定:

" タブの画面上での幅
set tabstop=4

" 改行時に、前の行のインデントを継続する。
"set autoindent

" 自動改行不可(日本語には関係なく改行するようだ？)
set textwidth=0
set formatoptions=q
"set formatoptions=r
" シフト量の幅（"<<" または ">>"）
"	smartindentで増減する幅
set shiftwidth=4
set softtabstop=4
"set expandtab


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

if ( has('win32') || has('win64') )
	let s:backup_dir = expand($HOME) . "/.vim_backup"
	let s:undo_dir = expand($HOME) . "/.vim_backup/undofile"
	"	本来これらは%TEMP%ディレクトリが望ましいだろう(手動削除しなければ無限に増える)。
else
	" Windows以外のOS用処理。
	let s:backup_dir = expand('~/.vim_backup')
	let s:undo_dir = expand('~/.vim_backup/undofile')
endif
"if !isdirectory(s:backup_dir) || !isdirectory(s:undo_dir)
"if !isdirectory(s:backup_dir)	失敗
if !isdirectory(s:backup_dir)
	execute mkdir(s:backup_dir, '', 0700)
endif
if !isdirectory(s:undo_dir)
"	execute mkdir(s:backup_dir, '', 0700)	存在した場合、エラーになる。
	execute mkdir(s:undo_dir, '', 0700)
endif
let &backupdir = s:backup_dir
"let &directory = s:backup_dir	" スワップファイルの作成場所をカレントディレクトリにするため、コメントアウト。
" undofileが勝手に作られるが、無効化ではなく、作る場所を一カ所にまとめることにした。
	"	※これは、kaoriya版のVer.7.4.277からの仕様らしい。
	"		https://www.kaoriya.net/blog/2014/03/30/
	" アンドゥファイル
let &undodir=&backupdir . "/undofile"
"set noundofile " アンドゥファイルを生成しない。
"set noswapfile "スワップファイルを生成しない。
"	以下、Vim終了時に、アンドゥファイルを削除する。
augroup quitcmd
	autocmd!
	autocmd VimLeave * call s:CleanupStuff()
	" https://vim-jp.org/vimdoc-ja/autocmd.html#VimLeave
	" VimLeavePre	のほうがいい？
	" どのような終了方法を指す？
augroup END
function! s:CleanupStuff()
	let l:undoFileName=expand('%:p')
	if ( has('win32') || has('win64') )
		" 以下、'C:\Users\～'　⇒　'C:%Users%～'
		let l:undo_fileName = substitute(l:undoFileName, '\\', "%", "g")
		"       'C:%Users%～'　⇒　'C%%Users%～'
		let l:undo_fileName = substitute(l:undo_fileName, ':', "%", "g")
	else
		let l:undo_fileName = substitute(l:undoFileName, '\/', "%", "g")
	end
	let l:deleteUndoFile=&undodir . "/" . l:undo_fileName
	echo "call delete(" . l:deleteUndoFile . ")"
	call delete(l:deleteUndoFile)
"	全バッファの取得はできないようだ。
"		一応以下がある。
"		num = Vim::Buffer.count         # バッファ数を取得する
"		しかし、"Vim が +ruby 機能付きでコンパイルされている場合にのみ利用できる"
endfunction
"
"	以下、何？
set switchbuf=useopen
"		分割ウィンドウが開いている場合分割しない。

"	セッション管理用保存ディレクトリ。
let s:sessionDir_dir = expand('~/.vim_backup/sessions')
if !isdirectory(s:sessionDir_dir)
	exec mkdir(s:sessionDir_dir, '', 0700)
endif

" 最後のカーソル位置を復元する
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" |
	\ endif
endif

"---------------------------------------------------------------------------

"　日本語ヘルプが開くように設定する。
"	https://vim-jp.slack.com/archives/CJMV3MSLR/p1678083227076859
set helplang=ja,en
	" この設定だけで日本語が優先される(ただし、引数は勝手に追加しているため、挙動は不明)。

" .vimrcの編集中のみKキー押下することにより、Vimのマニュアルが開く。
augroup vimrc
	autocmd!
	autocmd FileType vim setlocal keywordprg=:help
augroup END


"---------------------------------------------------------------------------
" 文字コードの設定
"	ファイルの文字コードがlatin1の場合は、選別ミスする。
"	CUI版のvimでutf8ファイルを開く場合、下記では文字化けする。上記のUTF-8が前面に設定されている必要がある。
"set fileencodings=iso-2022-jp,iso-2022-jp-1,iso-2022-jp-2,iso-2022-jp-3,ISO-2022-JP-2004,cp932,sjis,utf-7,utf-8,euc-jp,ucs-bom,eucjp-ms,euc-jisx0213,utf-16,utf-16le
set fileencodings=utf-8,iso-2022-jp,iso-2022-jp-1,iso-2022-jp-2,iso-2022-jp-3,ISO-2022-JP-2004,cp932,sjis,utf-7,euc-jp,ucs-bom,eucjp-ms,euc-jisx0213,utf-16,utf-16le
"	iso-2022-jp：日本語Jisのこと(しかし、適用されずにcp932で開かれる)。
"	utf-7は適用されず、utf-8で開かれる。
"	JIS・UTF7は開けず、文字化けする。
"	以下、読み込み直す。
"		:setl fenc=euc-jp
"
"	FencView.vimプラグインは、自動で文字コード判断可能なようだ。

" 改行コードの自動認識
"	改行コードを指定して開き直す場合
"		:e ++ff=mac
"set fileformats={"unix","dos","mac"}	←☆この書き方は間違っているようだ(macを認識しない)。
set fileformats=unix,dos,mac


" 日本語対応のための設定(Gvim初期起動時の設定にも関与する)
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについてはREADME_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
"source $VIMRUNTIME/encode_japan.vim
"set fileencoding=japan
set encoding=UTF-8
	" ※この設定が無効になっている(UTF8以外の)場合、エラーになるプラグイン(例えばGitGutter)が存在する。
	"	しかし、これ以外にも要因があるため、全く理解できないエラーのままなのは確か。

" 日本語整形スクリプト
let format_allow_over_tw = 1 " ぶら下り可能幅

"---------------------------------------------------------------------------
" Python3に強制したいが、できなかった。
"			https://vim-jp.org/vimdoc-ja/if_pyth.html#has-pythonx
if has('python3')
	set pyx=3
elseif has('python')
	set pyx=2
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっている時の挙動)があるのでデフォルトでは設定しない。
" Windowsではmousehideが、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラするという問題を引き起す。
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
	" ↓通常:Seで水平分割上で開く。
nnoremap <Leader>S :Sexplore<CR>
	" ↓通常:Vexで水平分割上で開く。
nnoremap <Leader>V :Vexplore<CR>
"	新規タブページで開く場合は:Teを使う必要がある.

" 折りたたみ
set foldmethod=indent
"set foldmethod=manual
set foldcolumn=1	" 折りたたみの可視化
autocmd BufRead * normal zR
"	za：トグル
"	zo：折りたたみが開く
"	zc：折りたたむ
"	zR：すべての折りたたみを開く(上記の設定がこれにあたる)
"	zM：すべての折りたたみを閉じる。

"---------------------------------------------------------------------------
" MacVim-KaoriYa固有の設定

" migemo：ローマ字のまま日本語をインクリメンタル検索
"let $PATH = simplify($VIM . '/../../MacOS') . ':' . $PATH	←☆これ何だっけ？
"set migemodict=$VIMRUNTIME/dict/migemo-dict
"set migemo
"	インクリメンタルサーチをしない。
set noincsearch
"set incsearch


" 印刷に関する設定:
set printmbfont=r:HiraMinProN-W3,b:HiraMinProN-W6
set printencoding=utf-8
set printmbcharset=UniJIS

let $LUA_DLL = simplify($VIM . '/../../Frameworks/libluajit-5.1.2.dylib')


if has('multi_byte_ime') || has('xim')
	" IME ON時のカーソルの色を設定
	" 　guibg：日本語入力がONの時のカーソルの色を表す.
	" 　guifg：カーソルの下の字の色を表す.
	highlight CursorIM guibg=Red guifg=LightRed
		"カーソルを変更するのは、括弧などの自動補完プラグインと競合するのか、相性が悪いようで、ATOK変換の足を引っ張る。
		"そのため、無効化する20220111
		"この処理じゃなかったようだ。
	" 挿入モード・検索モードでのデフォルトのIME状態設定
"	set iminsert=0 imsearch=0
	" 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
"	inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" カーソルハイライト
set cursorline " カーソルラインをハイライト
"	ATOKと'prabirshrestha/asyncomplete-lsp.vim'プラグインが競合するため、コメントアウトした20220112

"		アンダーライン付き。
highlight CursorLine gui=underline guifg=NONE guibg=NONE
"	ATOKと'prabirshrestha/asyncomplete-lsp.vim'プラグインが競合するため、コメントアウトした20220112
"	この処理じゃ無かったようだ。
"	効果が無かったため、プラグインを削除した20220112

" 挿入モード時、ステータスラインの色を変更
" 参考URL：https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color#color-insertmode
"			https://qiita.com/jnchito/items/5141b3b01bced9f7f48f
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
	augroup InsertHook
	autocmd!
	autocmd InsertEnter * call s:StatusLine('Enter')
	autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction
function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

"---------------------------------------------------------------------------

" タブ操作
"nnoremap <C-Tab> gt
"nnoremap <S-C-Tab> gT
	" 上記2つはCUI画面では無効化されるようだ。
"nnoremap <command-Tab> :tabnew<CR>
"nnoremap <D-Tab> :tabnew<CR>	Mac用には不要。
"	Windows用はAutoHotKeyで対応することにした。
"nnoremap <Win-Tab> :tabnew<CR>
"	以下、新規タブページを右端に作成する。
nnoremap <Leader>tn :$tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
"	以下、現在のバッファを新規タブで開く(現在のバッファは既存のタブに残る)
nnoremap <Leader>tm :tab split<CR>
"	以下、カレントタブページ以外を閉じる。
nnoremap <Leader>to :tabonly<CR>

" メモ
"	tabs：タブページと含まれているウィンドウ一覧を表示。
"	tabmove [N]：タブページ移動。


"---------------------------------------------------------------------------
nnoremap <Leader>ev :e ~\.vimrc<CR>
nnoremap <Leader>eg :e ~\.gvimrc<CR>

if ( has('win32') || has('win64') )
	" コピペはできないが、ヤンクなどをWindowsのクリップボードに保存する処理。
"	set clipboard=unnamed,autoselect

	"	全選択
	nnoremap <Leader>a ggVG


	nnoremap <Leader>eh :e ++enc=utf-8 $HOME/Documents/AutoHotkey.ahk<CR>
	"		いずれは、編集後に読み込み直すような設定をしたい。
	" ※ディレクトリ名に日本語などが含まれている場合、文字化けする。
	"		その場合は、"set encoding=UTF-8"にする必要がある。
endif

"---------------------------------------------------------------------------

"	★メモ

" ■vimコマンド
"	バッファ削除
"		:bw[ipeout][!] N1 N2 ...
"			:bdeleteよりも強力で、マークやオプションも削除される。

" ■コマンドの再マッピング
"	:map：再帰的なマッピングに用いられる(他のカスタムマッピングと相互作用する)。
"			そのとき、@記号がついている定義が優先されるようだ。
"			:h :map-local
"			:h map-listing	←定義済みのマップを一覧化。
"	:noremap：非再帰的なマッピングに用いられる(デフォルトのマッピングのみに作用する)。
"			　マッピング済みを調べる方法：:help index	←キーバイド一覧
"			　:mapコマンドでプラグインやユーザ定義のマッピング閲覧
"			　:map gは、gから始まるすべてのマッピングを表示する。
"	※:map：プラグインの提供するカスタムマッピングに対して使うようだ。
"	※:noremap：組み込みのマッピングに対して使う。
"
"	削除方法は、:unmapでユーザ定義またはプラグイン定義のマッピングを消せる。
"				:mapclearを使う場合は、すべてのマッピングを削除できる。
"	使用例：noremap <c-u> :w<cr> " Ctrl+uで保存
"			<a-_>・<m-_>：Altキーとの組み合わせ(<m-b>はAlt+bになる)。
"			<s-_>：Shiftキーの組み合わせ。
"			※定義末は、<cr>で締めくくる必要がある(Enterキー押下で実行できるようにするため)。
"
"	特殊キー
"		<space>	Spaceキー
"		<esc>	Escキー
"		<cr>・<enter>	Enterキー
"		<tab>	Tabキー
"		<bs>	Backspaceキー
"		<up>・<down>・<left>・<right>	矢印キー
"		<pageup>・<pagedown>	PageUpキー・PageDownキー
"		<f1>～<f12>	ファンクションキー
"		<home>・<insert>・<del>・<end>	Homeキー・Insertキー・Deleteキー・Endキー
"		<nop>	キーバインドとして何も動かない。
"			例）map <up> <nop>	上矢印キー無効
"	モード特化の再マッピング
"		:nmap・:nnoremap	ノーマルモード
"		:vmap・:vnoremap	ビジュアルモードとセレクトモード
"		:xmap・:xnoremap	ビジュアルモード
"		:smap・:snoremap	セレクトモード
"		:omap・:onoremap	オペレータ待ちモード
"		:map!・:noremap!	インサートモードとコマンドラインモード
"		:imap・:inoremap	インサートモード
"		:cmap・:cnoremap	コマンドラインモード
"		例）inoremap ' ''<esc>i	" 対応閉じ引用符を自動入力(自動入力後に、引用符に囲まれる状態で入力状態になる)
"
"	以下、Go言語用ファイルのみ対になっている記号を自動入力する。
"augroup filetype_go
"	autocmd!
"	:autocmd FileType go inoremap ' ''<esc>i
"	:autocmd FileType go inoremap " ""<esc>i
"	:autocmd FileType go inoremap < <><esc>i
"	:autocmd FileType go inoremap ( ()<esc>i
"	:autocmd FileType go inoremap { {}<esc>i
"	:autocmd FileType go inoremap [ []<esc>i
"augroup end

"	■vim Script
" 変数定義で、レジスタaに文字列を持たせる場合、
"	let @a = 'hello world'
" 変数定義で、オプション(set変更)には&を付ける。
"	let &ignorecase = 0
" 文字列の連結
"	ドット演算子(.)を使う。
"	let g:hoge = g:bar . ' boo'
" 文字列は'で囲み、'記号を使う場合は、''にする。
"	注意：特定のコマンド直後にコメントとしてダブルクォーテーションを使えない場合がある(コメント行として認識してくれない)。
"
" ・条件文
"	if 条件
"		処理
"	elseif 条件
"		処理
"	endif
"	==	左右の文字列比較
"	==?	大小文字の区別せずに比較
"	==#	大小文字の区別して比較
"	=~	右辺の式にマッチしているかどうかを調べる(上記組み合わせ⇒=~?・=~#)。
"	!~	右辺の式にマッチしていないかどうかを調べる(上記組み合わせ⇒!~?・!~#)。
"	大小文字の区別は、ignorecaseの設定に依存する。
"
" ・リスト(Pythonに似ている。似ているだけで同じではない)
"	let animals = ['cat', 'dog', 'parrot']
"		0から数える。-1で最後の要素を取り出す。
"	スライス
"		let slice = animals[1:]	←['dog, 'parro']
"		追加
"			call add(animals, 'octopus')
"			let animals = add(animals, 'octopus')
"		2番目に要素を追加
"			call insert(animals, 'raven', 2)
"		2番目の要素を取り除く
"			unlet animals[2]
"			call remove(animals, 0)
"			let cat = remove(animals, 0)
"		連結
"			let birds = ['raven', 'parrot']
"			let hoge = animals + birds
"			call extend(animals, birds)
"		並び替え(昇順)
"			call sort(animals)
"		要素のインデックス
"			let i = index(animals, 'parrot')
"		空の確認
"			if empty(animals)
"				空
"			endif
"		長さ
"			len(animals)
"		要素数
"			count(animals, 'cat')
" ・辞書(Pythonに似ている。似ているだけで同じではない)
"	let animal_names = {
"		\ 'cat': 'Miss Cattington',
"		\ 'dog': 'Mr Dogson',
"		\ 'parrot': 'Polly'
"		\}
"	要素の取得
"		let cat_name = animal_names['cat']
"		let cat_name = animal_names.cat	←キーが数字・文字・アンダースコアから構成されている必要がある。
"	要素の追加
"		let animal_names['raven'] = 'Raven R. Raventon'
"	エントリの削除
"		unlet animal_names['raven']
"		let raven = remove(animal_names, 'raven')
"	マージ(重複した場合上書く)
"		call extend(animal_names, {'bobcat': 'Sir Meowtington'})
"	キーの確認
"		if has_key(animal_names, 'cat')
"			echo animal_names['cat']
"		endif
" ・ループ
"	リストと辞書の繰り返しは、for文を使う。
"		for animal in animals ←リストループ
"			echo animal
"		endfor
"		for animal in keys(animal_names) 辞書ループ
"			echo animal . animal_names[animal]
"		endfor
"		for [animal, name] in items(animal_names)
"			echo animal . name
"		endfor
"	途中制御
"		continue
"		break
"	while文
"		let animals = ['dog', 'cat', 'parrot']
"		while !empty(animals)
"			echo remove(animals, 0)
"		endwhile
" ・関数(先頭は大文字で始める)
"	複数回の読み込みはエラーになるため、感嘆符を付けることで回避できる。
"		function! AnimalGreeting(animal)
"			return a:animal
"		endfunction
"	関数の呼び出し
"		call AnimalGreeting('cat')
"	可変長引数の関数
"		function! AnimalGreeting(...)
"			echo a:1 . a:2
"		endfunction
"		call AnimalGreeting('cat', 'dog')
"		すべての引数リスト：a:000
"	組み合わせ
"		function! AnimalGreeting(animal, ...)
"			echo a:animal . a:1
"		endfunction
"	ローカルスコープ
"		function! s:AnimalGreeting(animal, ...)
"			echo a:animal . a:1
"		endfunction
"		s:を付けることを習慣にしたい(定義ファイル以外からの隠蔽)。
"		他の人の関数を上書きする可能性があることも考慮すること。
" ・クラス
"	サポートはないが、辞書にメソッドを持つことが出来るため、オブジェクト指向パラダイムが利用可能になる(どういう意味？)。
"		let animal_names = {
"			\ 'cat': 'Miss Cattington',
"			\ 'dog': 'Mr Dogson',
"			\ 'parrot': 'Polly'
"			\}
"		function animal_names.GetHighlight(animal)
"			return self[a:animal]	←selfで辞書のキーを参照する。
"		endfunction
"	別回答
"		let animals = {
"			animal_names = {
"				\ 'cat': 'Miss Cattington',
"				\ 'dog': 'Mr Dogson',
"				\ 'parrot': 'Polly'
"			\ }
"		\ }
"		function GetHighlight(animal) dict
"			return self.animal_names[a:animal]
"		endfunction
"		let animals['GetGreeting'] = function('GetGreeting')
"		呼び出し：
"			echo animals.GetGreeting('dog')
" ・ラムダ式(無名関数)
"	let AnimalGreeting = {animal -> animal }
"	echo AnimalGreeting('cat')
" ・マップとフィルタ(関数を操作する関数)
"	function! IsProperName(name)
"		if a:name =~? '\(Mr\|Miss|) .\+'
"			return 1
"		endif
"		return 0
"	endfunction
"
"	呼び出し
"		call filter(animal_names, 'IsProperName(v:val)')
"		echo animal_names
"

"	■Leaderキー
"		leader+wでファイル保存
"		noremap <leader>w :w<cr>

" ■diff
"	$ vimdiff hoge1.go hoge2.go
"		]c	：差分移動前方
"		[c	：差分移動後方
"		do	：アクティブウィンドウにPullする(:diffget)。
"		dp	：アクティブウィンドウからPushする(:diffput)。
"	文字単位での diff をとりたい場合は --word-diff-regex オプションをつける。

" ■vimgrep
"	*記号と#記号
"		*記号：カーソル下の単語だけで検索する。userで検索した場合user_nameには検索に掛からない。
"		g*記号：上記のuser_nameにヒットする。
"		#記号：*記号とは逆方向に検索する。
"		g#記号：g*とは逆方向に検索する。
"
"	https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
"	※grepの簡易版？
"	書　式：:vimgrep <パターン> <Path>
"	別書式：:vim[grep] {pattern} {file} ...
"		マッチ移動：cn・cp
"		Quickfixリスト：copen
"	{file} ...で指定したファイルの中から{pattern}で一致する箇所を検索する。
"
"	カレントバッファを対象としたvimgrep方法。
"		:vim {pattern} %
"	使用例
"		app/views以下で_で始まるerbファイルを対象にする
"			:vim {pattern} app/views/**/_*.erb
"		検索Pathの使い回し方法。
"			:ar path/to/search/dir/**
"			:vim foo ##
"			※:ar[gs]コマンドにPathを指定することで、そのPathを使い回すことが出来る。
"				##記号で、指定したPathを置き換える。
"				標準出力を受け取る(Pathとして使う)場合
"					:ar `find . -name \\*.rb`
"		開いているバッファすべてを対象に検索する。
"			:bufdo vimgrepa[dd] {pattern} %
"			開いているウィンドウすべてを対象にする場合のコマンド
"				:windo
"			次の検索時は、上記の検索が継続するため、それらをリセットする必要がある。
"				:cex ""

" ■Quickfixとの組み合わせ
"	上記のvimコマンド結果を一覧表示する場合の一括コマンド
"		:vim {pattern} {file} | cw

" ■変数ジャンプ
"	gd：変数の宣言場所にジャンプできる(ローカル変数)。
"	gD：変数の宣言場所にジャンプできる(グローバル変数)。

" ■コンパイル環境構築
"	以下、C言語用のコンパイル方法。
"		:compiler gcc
"		:make
"	:compiler	：異なるコンパイラプラグインを指定でき、コンパイラからの出力フォーマットも同時に指定できる。
"	:set errorformat	：認識されるエラーフォーマットを複数定義する。
"	:set makeprg	：:makeを実行したときに実行されるプログラムを設定する。

" ■レジスタ
"	"記号を使い分けることで数回前の内容を使い回せる
"		例えば、7回前の削除単語を貼り付ける場合、	"7p	でペーストできる(全部で10回分を保持している)。
"	"*p：パソコンからのクリップボードを貼り付けられる。
"	"*yw：vimからパソコンのクリップボードにヤンクできる。
"	レジスタ一覧
"		:reg
"		このレジスタには、マクロで記録した内容も含まれる。
"			マクロの記録を変更する場合、単純にエディタに貼り付ければいい。
"				例）レジスタ内に、"aがあった場合、"apで貼り付けられる。
"					編集後に、"apでレジスタ内に貼り付ける(ヤンク済みであること)。
"					そして、_"ay$でレジスタに戻す。
"				^[	ESC
"				^M	Enter


" ■置換(substitute)
"	頭文字のsを使い、exコマンド上で置換を行う。
"		:<検索対象範囲>s/<置換対象>/<置換される文字列>/<フラグ>
"		※スラッシュ以外の記号でもセパレータとして利用可能。
"			・検索対象範囲
"				数字	：行番号
"				$	：ファイルの最終行
"				%	：ファイル全体
"				/検索パターン/	：操作したい行を探す。
"				?後方検索パターン?	：後方に向かって操作したい行を探す。
"				例）12行目から最初にdogが見つかるまでの行を探し、その範囲内のanimalをcreatureに置き換える。
"					:12;/dog/s/animal/creature/g
"			・フラグ
"				g	：グローバル置換(アクティブ行内すべてを対象にする)。
"				c	：置換ごとにユーザ問い合わせが発生する。
"				e	：検索結果がない場合にエラーを出さない。
"				i	：ケースインセンシティブ(大小文字の区別無し)
"				I	：ケースセンシティブ(大小文字の区別あり)
"	引数リストを扱った複数ファイルへの操作
"		:arg	：引数リストを定義する。
"		:argdo	：引数リストにあるすべてのファイルに対してコマンドを実行する。
"		:args	：引数リストの内容を表示する。
"		例）すべてのPythonファイルすべてのanimalを再帰的に置換する場合、
"			:arg **/*.py
"			:argdo %s/\<animal\>/creature/ge | update	" ←argで渡されたパターンにマッチした全ファイルに対して、この行で指定しているパターンにマッチした条件の置換を行う。
"					上記updateは、バッファが変更されたときのみ、ファイルに保存する(編集中のファイルがある場合、バッファ切り替えを行わないため、必須コマンドになる)。
"			:args	" ←上記の引数リストの内容を確認できるようだ。
"		※:bufdoを使うことで、開いているすべてのバッファを対象にできるが、意図していないバッファまで対象にするため、使用は避けた方がいい。
"	マクロを複数ファイルにまたがって実行する。
"		:arg **/*.py
"		:argdo execute ":normal @a" | update

"	・正規表現用のマジック
"		3種類存在する。
"			マジックモード
"				デフォルトのモード
"				基本的に、特殊文字にエスケープが必要になる。
"			ノーマジックモード
"				基本的に、特殊文字にバックスラッシュでのエスケープが必要になる。
"			ベリーマジックモード	←私の設定で有効にしている。
"				文字・数字・アンダースコア以外の文字を特殊文字として扱う。
"				例）:s/\(cat\) hunting \(mine\)/\2 hunting \1
"							↓
"					:s/\v(cat) hunting (mice)/\2 hunting \1


" ■Git
" 〇	vim-GitGutter
"	<Leader>hs：ハンク部分のステージング
"				以下の定義で、ステージング方法を追加。
"	<Leader>hu：ハンク部分のステージングを取り消す。
"	<Leader>hp：ハンク部分のプレビュー(変更前の状態と比較)
"	]c：押下により、次のハンク(変更点のかたまり)
"	[c：押下により、前のハンクへ移動
"	ic：オペレータ待ちモードでの・・・。
"	ac：オペレータ待ちモードでの・・・。
"	ic：ビジュアルモードでの・・・。
"	ac：ビジュアルモードでの・・・。
"
" 〇	vim-fugitive
"		使うには、何かしらの権限が必要なようで、PullやPushができないままになっている。
"<leader>gs	:Gstatus
"	ステータス。
	" s：ステージ(add)する。
	" -：git ステージング切り替え
	" u：ステージした物を取り除く(undo)
	" =：ウィンドウ内に差分を表示(diffをその場で開く)
	" D：diffウィンドウを並べて出してくれる
	" dv：diffのvisual(下ペインで開く)
	" <Enter>：編集する
	" X：変更を取り消す
	" 以下、コミット操作
	" cc：コミット
	" ca：直前のコミットを変更する形でコミットする(git commit --amend)
	" ce：査前のコミットを変更する形でコミットするが、コミットメッセージを変更しない(git commit --amend --no-edit)
	" cw：査前のコミットのコミットメッセージのみを変更する。
	" cvc：verboseモードでコミットする(git commit -v)
	" cf：fixup!でコミットする(git commit --fixup=)これを実行して査後に<Tab><Enter>押下後HEADにfixupする。
" <leader>ga		git add
" <leader>gc		git commit	←☆無効化しているはず。
" <leader>gb		git blame	:Gblame	記録の遡り(行との変更確認や変更日時や変更者の確認)
	" 行ごとに最終コミットされた時期・誰かを一覧にする。
"alias logall='log --graph --pretty=format:\'%Cred%h %Cgreen(%>(15,trunc)%cr, %ci) %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s\' --abbrev-commit --date=relative --all'
" <leader>gl		git log
" <leader>gh		変更履歴(架空コマンドgit history)
"					abbrev for `git history`: create new quickfix tab for history
" <leader>gp		git push	←☆無効化しているはず。
" <leader>gll		git pull
" <leader>gf		git fetch
" <leader>gd	diff	<Leader>gsのdvと同じ
" <leader>gr		git rebase -i	※リベースとは？スカッシュとは？　過去コミットを統合すると思って良い？
" <leader>gg		gitgrep
" <leader>gm		git merge
" :Glog	ログ
" :Glog --oneline	ログ
" :Gdiff [コミット番号]	差分
" :Gbrowse	現在のファイルをブラウザ内のオプションの行選択で開くことが出来る。
"			Shift-Vで表示したい行を選択します。あとは :Gbrowseを入力し、開いたページのURLをGitHubのPull RequestやIssueに貼る。
" :Gread	今開いてるファイルを最新のcommitの状態に戻す

" ■Git一般利用
" status オプション
"	--porcelain
"			変更点の見やすさ重視。
"	--ignored
"			無視ファイルも表示する。
"
" .gitignoreファイル
"	通常、 ~/.gitignore に記載する？
"	リポジトリ固有の無視リストの配置場所。
"			$GIT_DIR/info/exclude ファイル($GIT_DIR==.git)
"
"	git clean -n -X
"			.gitignoreでの無視リスト上の記載ファイルなどの削除候補一覧出力。
"	git clean -f -X
"			上記の一覧内容をすべて削除実施。
"
"	git mv
"		https://www-he.scphys.kyoto-u.ac.jp/member/shotakaha/dokuwiki/doku.php?id=toolbox:git:mv:start
"		ファイル内容でファイル名を変更したかどうかを判断する。
"		そのため、コマンドでファイル名変更直後にファイル内容を変更した場合、ファイル名変更前のファイルを削除したと認識される。
"
" .gitディレクトリ配下
"	HEADファイル
"		現在のブランチを指すシンボリック参照を格納する。
"	configファイル
"		リポジトリ固有の設定ファイル
"	descriptionファイル
"		リポジトリ名が格納される。
"	hooksディレクトリ
"	excludeファイル
"		除外ファイルのパターンを記載できる。
"	objectsディレクトリ
"		リポジトリに関連付けられたオブジェクトを格納する格納領域のこと。
"	refsディレクトリ
"		ローカルブランチ・リモート追跡ブランチなどの各ブランチの参照とタグ(tag)オブジェクトを格納する。

" 色づけ
"	https://github.com/dandavison/delta
"	私は未導入。


" ■find
"	https://www.atmarkit.co.jp/ait/articles/1607/20/news024.html
"	書式：find [オプション] [検索パス] [検索式]
" ・ファイル名やファイルの種類
"	-name パターン	ファイル名がパターンと一致するファイル（「-name "*.txt"」のような指定が可能）
"	-iname パターン	-nameと同じだが、大文字小文字を区別しない
"	-lname パターン	シンボリックリンクのリンク先ファイル名がパターンと一致するファイル
"	-ilname パターン	-lnameと同じだが、大文字小文字を区別しない
"	-path パターン	パスがパターンと一致するファイル
"	-ipath パターン	-pathと同じだが、大文字小文字を区別しない
"	-regex パターン	ファイル名がパターンと一致するファイル、パターンに正規表現が指定可能
"	-iregex パターン	-regexと同じだが、大文字小文字を区別しない
"	-type タイプ	ファイルタイプ（通常ファイルだけを対象としたい場合は「f」、ディレクトリは「d」、シンボリックリンクは「l」）
"	-xtype タイプ	-typeと同じだが、「-H」や「-P」が指定されている場合はリンク先のファイルタイプで判定する
"	-executable	実行可能なファイルまたは検索可能なディレクトリ（-permと違いACLなども考慮する）
"	-readable	読み込み可能なファイルにマッチする（-permと違いACLなども考慮する）
"	-writable	書き込み可能なファイルにマッチする（-permと違いACLなども考慮する）
"	-fstype タイプ	ファイルが置かれているファイルシステムのタイプ（ufs、nfs、tmpなど）
" ・タイムスタンプ関係
"	-mmin 分数	指定した分数より前に更新されたファイル（「-mmin 3」で3分前、「-mmin +3」で3分以上前、「-mmin -3」で3分以内に更新、以下同）
"	-mtime 日数	指定した日数より前に更新されたファイル
"	-newer ファイル	指定したファイルの更新時刻以降に更新されたファイル
"	-amin 分数	指定した分数より前にアクセスされたファイル
"	-atime 日数	指定した日数より前にアクセスされたファイル
"	-anewer ファイル	指定したファイルのアクセス時刻以降にアクセスされたファイル
"	-cmin 分数	指定した分数より前にステータスが変更されたファイル
"	-ctime 日数	指定した日数より前にステータスが変更されたファイル
"	-cnewer ファイル	指定したファイルのステータス変更時刻にステータスが変更されたファイル
"	-daystart	-amin、-atime、-cmin、-ctime、-mmin、-mtimeで“今日”の始まりを今現在から24時間前ではなく、コマンド実行当日の0時にする
" ・その他の属性関係
"	-uid 数値	所有者のユーザーIDが指定した数値のファイル
"	-user 名前	所有者の名前が指定した名前のファイル
"	-gid 数値	所有グループID番号が指定した数値のファイル
"	-group 名前	所有グループ名が指定した名前のファイル
"	-nouser	ユーザーIDに対応するユーザーがいないファイル
"	-nogroup	ユーザーグループID番号に対応するグループがないファイル
"	-perm モード	パーミッションがモードと一致したファイル（「-モード」で指定したモードを全て許可しているファイル、「/モード」で指定したモードのいずれかを許可しているファイル）
"	-empty	空のファイルまたは空のディレクトリ
"	-size サイズ	ファイルサイズが指定したサイズに一致したファイル（「-size +3k」でサイズが3KBより大きなファイル）
"	-links リンク数	リンク数が指定したリンク数に一致したファイル
"	-inum 番号	iノード番号が番号に一致したファイル
"	-samefile ファイル	指定したファイルと同じiノード番号を参照しているファイル（「-L」オプションが有効な場合はシンボリックリンクも含まれる）
" ・アクション他
"	-print	見つけたファイルをフルパスで出力する（デフォルト）
"	-ls	見つけたファイルを「ls -dgils」形式で出力する
"	-print0	見つけたファイルのフルパスをNULL区切りで出力
"	-printf フォーマット	見つけたファイルをフォーマットに従った書式で出力する
"	-fprint ファイル	-printと同じ書式で指定したファイルに出力する
"	-fls ファイル	-lsと同じ書式で指定したファイルに出力する
"	-delete	見つけたファイルを消去する
"	-exec コマンド ;	見つけたファイルを引数にコマンドを実行する（オプションも指定可能。以下同）
"	-execdir コマンド ;	見つけたファイルのあるディレクトリでコマンドを実行する
"	-ok コマンド ;	見つけたファイルを引数に、確認メッセージを表示しながらコマンドを実行する（オプションも指定可能、以下同）
"	-okdir コマンド ;	見つけたファイルのあるディレクトリで、確認メッセージを表示しながらコマンドを実行する
"	-an、-a	条件をANDで結ぶ
"	-or、-o	条件をORで結ぶ
"	-not	条件を否定する
"	-true	常に真
"	-false	常に偽
"	-quit	直ちに終了する
"	-depth 深さ	検索するディレクトリの深さを指定
"	-maxdepth 深さ	検索するディレクトリの最大の深さ（「-maxdepth 0」でコマンドラインで指定したディレクトリのみ検索）
"	-mindepth 深さ	検索するディレクトリの最小の深さ（「-mindepth 1」でコマンドラインで指定したディレクトリより深いディレクトリを検索）
"	-prune	ディレクトリに降りない
"	-mount	他のファイルシステムにあるディレクトリを探索しない
"	-noleaf	「ディレクトリのハードリンク数から2を引いたものが、そのディレクトリに含まれるサブディレクトリの数である」という最適化を行わない
" ・指定フォーマット
"	\n	改行文字
"	\t	水平タブ
"	\\	バックスラッシュ文字そのもの
"	\8進数	ASCIIコードを指定
"	%p	ファイル名（フルパス）
"	%P	ファイル名（コマンドライン引数で指定した起点からの相対パス）
"	%f	ファイルのパス名を除いたファイル名
"	%h	ファイル名のディレクトリ部分
"	%H	ファイル名のディレクトリ部分（コマンドライン引数で指定した起点からの相対パス）
"	%l	シンボリックリンクの参照先
"	%m	ファイルの許可属性ビット（8進数表示、0入りで表示したい場合は「%#m」）
"	%M	ファイルの許可属性（「ls -l」と同じアルファベットによる表示）
"	%y	ファイルのタイプ（「ls -l」の表現とほぼ同じ）
"	%Y	ファイルのタイプ（%yと同じだがシンボリックリンクをたどる）
"	%n	ファイルのハードリンク数
"	%i	inode番号
"	%u	ファイルの所有者名
"	%U	ファイルのユーザーID番号
"	%g	グループ名
"	%G	グループID番号
"	%t	ファイルの更新日時（%TD、%TRのように、%Aと書式を示すアルファベットでも指定可能）
"	%a	ファイルの最終アクセス日時（%AD、%ARのように、%Aと書式を示すアルファベットでも指定可能）
"	%c	ファイルの最終ステータス変更日時（%CD、%CRのように、%Cと書式を示すアルファベットでも指定可能）
"	%s	ファイルサイズ（バイト数）
"	%b	ファイルが消費しているディスクスペースのブロック数（通常は1ブロック512KB）
"	%k	ファイルが消費しているディスクスペースのブロック数（1KBでのブロック数）
"	%d	ディレクトリツリー中の深さ（「0」＝コマンドライン引数の位置）
"	%D	ファイルがどのデバイス上にあるか（10進数表示）
"	%F	ファイルが置かれているファイルシステムのタイプ（「-fstype」で指定するものと同じ）
"
" ・例）
"	サイズがゼロ（-empty）のファイル（-type f）を、「属性（%M）」「日付（%D）」「パス付きのファイル名（%p）」で表示
"		find -type f -empty -printf "%M %TD %p\n"
"	空のファイルやディレクトリを確認しながら削除する
"		find ~ -type f -empty -ok rm -v {} \;
"		確認作業が必要な場合は、-okオプションを用いる。
"		任意のコマンド実行をしたいだけならば、-execオプションを使う。


"	□Android用。
if g:isDroid || g:isTermux
"	〇Gboard
"		DroidVimの「設定」→「ファンクションバーモード」→「"abc"ボタン」→「<C-^>」
"		⇒完全に日本語入力の切り替えが可能になる。しかし、物理キーボード制御は無理だった。
" `<C-^>`で英数/通常入力の切り替えと[Shift]+[Space]を自動実行
let g:imactivate_language_switch = 61

"
"	〇DroidVim
" Input mode : 50 (Default) 51-53 (Disable word prediction)
"let s:ImeNormal = 53
"let s:ImeInsert = 50
"augroup ATEModIME
"	au!
"	au InsertEnter * call IMCtrl('On')
"	au InsertLeave * call IMCtrl('Off')
"	au VimEnter    * call IMCtrl('VimEnter')
"augroup END
"function! IMCtrl(cmd)
"	let cmd = a:cmd
"	if cmd == 'On'
"		call s:ATEMod(s:ImeInsert)
"	elseif cmd == 'Off'
"		call s:ATEMod(s:ImeNormal)
"	elseif cmd == 'Toggle'
"		call s:ATEMod(55)
"	elseif cmd == 'VimEnter'
"		call s:ATEMod(s:ImeNormal)
"	endif
"	return ''
"endfunction
"function! s:ATEMod(cmd)
"	let cmd = printf('echo -n -e "\0033[%st"', a:cmd)
"	exe 'silent !'.cmd
"endfunction
endif


" 以上。
