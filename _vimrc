" vim:set ts=4 sts=4 sw=4 tw=0:
let g:skip_defaults_vim = 1
"	そもそもファイルが存在しないので読み込まない。
"
"	.vimrcなどの場所(macVim版)
"		https://qiita.com/gam0022/items/87491e8a32a5926684d2
"		https://vim-jp.org/vimdoc-ja/starting.html#initialization

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
"let mapleader = "\<Space>"

" ステータスラインに文字コードを表示させる。
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P


"	ーーーパッケージ管理20190622ーーー
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

call minpac#add('previm/previm', {'type': 'opt'})	" プレビュー用
call minpac#add('tyru/open-browser.vim', {'type': 'opt'})	" ブラウザを起動し、上記のprevimを表示させる。

"let s:lazy_plugs = [
"	\ ['previm/previm', {'type': 'opt'}],
"	\ ['tyru/open-browser.vim', {'type': 'opt'}],

"	\ ['mattn/vim-lsp-settings', {'type': 'opt'}],
"	\ ['mattn/vim-goimports', {'type': 'opt'}],
"	\ ['thomasfaingnaert/vim-lsp-snippets', {'type': 'opt'}],

"	\ ['itchyny/calendar.vim', {'type': 'opt'}],
"	\ ]

" IDE用の設定プラグイン？
"call minpac#add('tpope/vim-vinegar')	" エクスプローラの補助的な枠割り？
	" I：メニュー表示・~：ホームディレクトリ移動
"let NERDTreeHijackNetrw = 0
call minpac#add('prabirshrestha/async.vim')
call minpac#add('prabirshrestha/asyncomplete.vim')	" 自動補完補助
call minpac#add('prabirshrestha/vim-lsp')	" 挙動不審？
call minpac#add('mattn/vim-lsp-settings')
"	個々のインストール先：%LOCALAPPDATA%\vim-lsp-settings\servers
"	以下のコマンドを打つことにより、プログラムファイルに応じたファイルがインストールされる。
"	LspInstallServer
"	・環境構築が整っていない場合に出るメッセージのようだ。
"		efm-langserver requires go
call minpac#add('mattn/vim-goimports', {'type': 'opt'})	" インポート用：GoImport
"	go get golang.org/x/tools/cmd/goimports		←このコマンドがインストールされていなければ、プラグインによるインポートが行われない。


"	スニペット用プラグイン。
call minpac#add('drmingdrmer/xptemplate', {'type': 'opt'})

"	シンタックスチェック
call minpac#add('vim-syntastic/syntastic')

"	オートコンプリートポップアップメニュー表示
call minpac#add('prabirshrestha/asyncomplete.vim')
"		オートコンプリートソース
call minpac#add('prabirshrestha/asyncomplete-lsp.vim')	" 自動補完補助

" Go言語用プラグイン
"call minpac#add('https://github.com/fatih/vim-go')
"	複雑な設定が必要になるため、手に余る。
"	しかし、慣れれば使い勝手はよくなるはず。

"	vimスクリプト用のランゲージサーバ
"call minpac#add('iamcco/vim-language-server')	" 導入されないようだ。

call minpac#add('tpope/vim-commentary', {'type': 'opt'})	" コメント化
autocmd BufNewFile,BufRead *.sh setlocal commentstring=#\	%s
autocmd BufNewFile,BufRead [._g]{,2}vimrc setlocal commentstring=\"\	%s

" 動かない。動いてはいるようだが、可視化してくれない。
"call minpac#add('nathanaelkane/vim-indent-guides')	" インデントの可視化
"call minpac#add('Yggdroot/indentLine')	" インデントの可視化


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


" Explorer
"call minpac#add('weirongxu/coc-explorer')
"nmap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
"	制約が多く使えない。
"		https://github.com/neoclide/coc.nvim
"		を使用している前提が必要？

" エクスプローラ
"call minpac#add('lambdalisue/fern.vim')
if isdirectory(expand(minpackSTART . "fern.vim"))  || isdirectory(expand(minpackOPT . "fern.vim"))
noremap <Leader>er :Fern . -reveal=%<CR>
nnoremap <F13> :<c-u>Fern . -drawer -stay -keep -toggle -reveal=%<CR>

" 以下、無効化したいができない。
noremap <Nop>clipboardCopy <Plug>(fern-action-clipboard-copy)
noremap <Nop>clipboardMove <Plug>(fern-action-clipboard-move)
noremap <Nop>clipboardPaste <Plug>(fern-action-clipboard-paste)
noremap <Nop>trash <Plug>(fern-action-trash)
noremap <Nop>newDir <Plug>(fern-action-new-dir)
noremap <Nop>newFile <Plug>(fern-action-new-file)
endif

" エクスプローラ(上記より見やすい。)
call minpac#add('scrooloose/nerdtree', {'type': 'opt'})


" タグ登録済みの一覧表示
call minpac#add('preservim/tagbar', {'type': 'opt'})
"call minpac#add('majutsushi/tagbar', {'type': 'opt'})


" コンパイル実行
call minpac#add('thinca/vim-quickrun', {'type': 'opt'})

" Git
call minpac#add('airblade/vim-gitgutter')
"	※他のプラグインより優先度が高いようだ(lspの指摘を差し置いて、差分表示が優先された)。
"		define_signs[XX]
"			<SNR>XX_define_sign_text
"		⇒ハイライトと思われる箇所がエラーになる。
"		⇒Mac版Vimでは一切のエラーが発生せず、普通に起動する。
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb', {'type': 'opt'})	" vim-fugitiveとの連携で、ブラウザでの比較を行う。
	" :Gbrowse		github.com 上の該当のファイルをブラウザで開いてくれてプレビュー

" マーク表示
call minpac#add('jacquesbh/vim-showmarks', {'type': 'opt'})

" 囲み文字の編集
"call minpac#add('jiangmiao/auto-pairs')
"call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
"call minpac#add('cohama/lexima.vim', {'type': 'opt'})

call minpac#add('kana/vim-smartinput', {'type': 'opt'})

" やり直し・取り消しを取り消す。
call minpac#add('sjl/gundo.vim')
"	※Pythonで動けるコンパイル済みのvimエディタが必須。


" やり直し・取り消しを取り消す。
"call minpac#add('mbbill/undotree', {'type': 'opt'})

" セッション管理
call minpac#add('xolox/vim-session', {'type': 'opt'})
call minpac#add('xolox/vim-misc', {'type': 'opt'})

" プロジェクト管理
call minpac#add('mattn/vim-findroot', {'type': 'opt'})

" タブ補完
"call minpac#add('ervandew/supertab')
"	普通のTabキー入力が打てなくなる(Ctrl+TabでTab入力)。
"	⇒なるほど・・・文字に続けてTabを打つ場合に補完が働くのか・・・やっぱり邪魔くさいな。

" カレンダ表示
call minpac#add('itchyny/calendar.vim')
"	これはさすがにやり過ぎ。と言うか、使い勝手は悪い。

"	文字コードの自動判定(以下、どちらもutf7やutf16は判定してくれない)
"call minpac#add('mbbill/fencview')
"call minpac#add('tyru/fencview.vim')

endif	" パッケージ管理の読み込みなど
"	ーーーーーーーーーーーーーーーーーー 遅延読み込みここまで ーーーーーーーーーーーーーーーーーー

let g:session_menu = 0
"packadd previm

"if isdirectory(expand(minpackSTART . "tsunesan3/awsome-jp-coding-fonts"))  || isdirectory(expand(minpackOPT . "tsunesan3/awsome-jp-coding-fonts"))
"	packadd tsunesan3/awsome-jp-coding-fonts
"	set guifont=Sarasa:h14
	"	例えば、CicaV3をVimで使いたいのであれば、
	"	CicaV3ディレクトリ配下にあるCica.ttcを右クリックし、インストールを選ぶ。
"endif
"packadd syntastic
"	packadd minpac

"	起動直後に必要がないものは遅延ロードさせる。
"
"以下エラーになり、理解できないままだったため、普通に使うことにした。
"call <SID>minpac_add(s:lazy_plugs)
"let s:idx = 0
"function! PackAddHandler(timer)
"	let plug = s:lazy_plugs[s:idx]
"	let name = split(plug[0], '/')[1]
"	let cond = len(plug) > 2 ? plug[2] : 1
"	if cond
"		exe 'packadd ' . name
"	endif
"	let s:idx += 1
"	au! lazy_load_bundle
"endfunction
"aug lazy_load_bundle
"	au MyAutoCmd VimEnter * call timer_start(1, 'PackAddHandler', {'repeat': len(s:lazy_plugs)})
"aug END
" ※当然だが、プラグインを導入前に読み込むのであれば、エラーになるため、気をつけること。

"	以下のコマンドを打つことにより、プログラムファイルに応じたファイルがインストールされる。
"	LspInstallServer。

" 以下、遅延読み込み用の対応(これをすることで遅延読み込みにしたのが無駄になる？)。
"	読み込む順番が大事なプラグインもあるため気をつけること。
"		例）vim-miscのあとに、vim-sessionを読み込む必要がある(今のところこれだけ)。
let packPluginlists = [
	\ 'vim-goimports',
	\ 'vim-quickrun',
	\ 'tagbar',
	\ 'gundo.vim',
	\ 'undotree',
	\ 'vim-misc',
	\ 'vim-session',
	\ 'vim-findroot',
	\ 'xptemplate',
	\ 'nerdtree',
	\ 'vim-showmarks',
	\ 'vim-rhubarb',
	\ 'vim-commentary',
	\ 'delimitMate',
	\ 'lexima.vim',
	\ 'vim-smartinput',
	\ ]
for pluginPack in packPluginlists
	if isdirectory(expand(minpackSTART . pluginPack))  || isdirectory(expand(minpackOPT . pluginPack))
		execute("packadd " . pluginPack)
	endif
endfor

" ここまでがIDE用の設定プラグイン

" すべてのプラグインを起動時に読み込むのであれば、以下を実行。
"	基本的に、vimrc読み込み後に、自動的に下記コマンドが実行される。
"packloadall

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
if isdirectory(expand(minpackSTART . "vim-lsp"))  || isdirectory(expand(minpackOPT . "vim-lsp"))
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


" Goインポートプラグイン
if isdirectory(expand(minpackSTART . "vim-goimports"))  || isdirectory(expand(minpackOPT . "vim-goimports"))
"let g:goimports = 1
"let g:goimports_simplify = 1
unlet! g:goimports_simplify
endif


" これは何？
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_remove_duplicates = 1


" For snippets
if isdirectory(expand(minpackSTART . "ultisnips"))  || isdirectory(expand(minpackOPT . "ultisnips"))
"	funcと入力してタブを押下するとスニペットが展開されるようだが、動かないぞ？
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
let g:UltiSnipsEditSplit="vertical"
" そもそもスニペットって何？
endif



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
nnoremap <silent><F13> :NERDTreeToggle<CR>
endif

" ■Git
"	ステータスに、現在のバッファから変更・追加・削除の行数を表示する。
if isdirectory(expand(minpackSTART . "vim-gitgutter"))  || isdirectory(expand(minpackOPT . "vim-gitgutter"))
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{'(Git:'.GitStatus().')'}

"	以下、記号列を常時表示。
set signcolumn=yes
"	以下、起動時のハイライト有効設定
let g:gitgutter_highlight_lines = 1
let g:gitgutter_sign_allow_clobber = 0	" 優先度を上げる。
let g:gitgutter_sign_removed_first_line = "^_"
let g:gitgutter_override_sign_column_highlight = 0

"	色の変更は、GUIでは反映されない？
"	以下、記号列の色がなくなる？(下記とかぶるため、順序に気をつけること)
"highlight! link SignColumn LineNr

"	以下、記号列の色をつける(上記とかぶるため、順序に気をつけること)。
highlight SignColumn guibg=NONE ctermbg=NONE

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
"	<Leader>hu：ハンク部分のステージングを取り消す。
"	<Leader>hp：ハンク部分のプレビュー(変更前の状態と比較)
"	]c：押下により、次のハンク(変更点のかたまり)
"	[c：押下により、前のハンクへ移動
"	ic：オペレータ待ちモードでの・・・。
"	ac：オペレータ待ちモードでの・・・。
"	ic：ビジュアルモードでの・・・。
"	ac：ビジュアルモードでの・・・。

" GitGutterの行ハイライト切り替え(トグル)
nmap <F19> :GitGutterLineHighlightsToggle<CR>
"	CUI用vimの場合、F16以降はMacに機能が奪われてしまい、一般的なファンクションキーとして動かない。
endif


" vim-fugitive
if isdirectory(expand(minpackSTART . "vim-fugitive"))  || isdirectory(expand(minpackOPT . "vim-fugitive"))
nnoremap <leader>gs :tab sp<CR>:Gstatus<CR>:only<CR>
"	ステータスのこと。
	" s：ステージ(add)する。
	" u：ステージした物を取り除く(undo)
	" =：diffをその場で開く
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
nnoremap <leader>ga :Gwrite<CR>
"	git add
nnoremap <leader>gb :Gblame<CR>
"	git blame
	" 行ごとに最終コミットされた時期・誰かを一覧にする。
"alias logall='log --graph --pretty=format:\'%Cred%h %Cgreen(%>(15,trunc)%cr, %ci) %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s\' --abbrev-commit --date=relative --all'
nnoremap <leader>gc :Gcommit<CR>
"	git commit
nnoremap <leader>gl :Git log<CR>
"	git log
nnoremap <leader>gh :tab sp<CR>:0Glog<CR>
"	変更履歴(架空コマンドgit history)
" abbrev for `git history`: create new quickfix tab for history
nnoremap <leader>gp :Gpush<CR>
"	git push
nnoremap <Leader>gll :Gpull<CR>
"	git pull
nnoremap <leader>gf :Gfetch<CR>
"	git fetch
nnoremap <leader>gd :Gvdiff<CR>
"	diff	<Leader>gsのdvと同じ
nnoremap <leader>gr :Grebase -i<CR>
"	git rebase -i
nnoremap <leader>gg :Ggrep 
"	gitgrep
nnoremap <leader>gm :Gmerge 
"	git merge
nnoremap <Leader>o :Gbrowse<CR>
endif


" タグ一覧表示の切り替え(トグル)
if isdirectory(expand(minpackSTART . "tagbar"))  || isdirectory(expand(minpackOPT . "tagbar"))
nmap <F8> :TagbarToggle<CR>
endif

" アンドゥツリー切り替え(トグル)
if isdirectory(expand(minpackSTART . "gundo.vim"))  || isdirectory(expand(minpackOPT . "gundo.vim"))
nmap <F17> :GundoToggle<CR>
endif

" アンドゥツリー切り替え(トグル)
if isdirectory(expand(minpackSTART . "undotree"))  || isdirectory(expand(minpackOPT . "undotree"))
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


" セッション管理
if isdirectory(expand(minpackSTART . "vim-session"))  || isdirectory(expand(minpackOPT . "vim-session"))
if ( has('win32') || has('win64') )
	let g:session_directory = expand($HOME) . "/.vim_backup/sessions"
else
	let g:session_directory = expand('~/.vim_backup/sessions')
endif
let g:session_lock_directory = g:session_directory
let g:session_extension = '.vimSession'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_autosave_periodic = 0
let g:session_autosave_silent = 1
" let g:session_verbose_messages = 0
let g:loaded_session = 0
endif


if isdirectory(expand(minpackSTART . "vim-fugitive"))  || isdirectory(expand(minpackOPT . "vim-fugitive"))
function! s:save_session(...)
	if a:0
		let session_name = a:1
	else
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

if isdirectory(expand(minpackSTART . "eregex.vim"))  || isdirectory(expand(minpackOPT . "eregex.vim"))
	nnoremap <Leader>/ :M/
"
"	" 改行コードの設定？
"	let eregex_replacement=3
endif

" supertab
"let g:SuperTabDefaultCompletionType = "<c-n>"
"	補完の操作を逆にする。

"	ーーーここまでがパッケージ設定ーーー

if (has('win32') || has('win64') )
	let g:previm_open_cmd = 'C:\/\/Program\ Files\/Mozilla\ Firefox\/firefox.exe'	" open-browser.vim
elseif (has('gui_macvim') || has('mac') )
	"let g:previm_open_cmd = 'open -a Safari'	" open-browser.vim
	let g:previm_open_cmd = 'open -a Firefox'	" Safari動かなかったため。
elseif has('xfontset')
endif

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:vim_markdown_folding_disabled=1	" 自動折りたたみ無効化
" Ctrl-pでプレビュー(他のプラグインとダブってしまうため、\pにした)
augroup filetype_markdown
	" マークダウンファイルのみ有効
	au!
	au FileType markdown packadd previm
	au FileType markdown nnoremap <Leader>p :PrevimOpen<CR>
augroup END


command! PackUpdate source ~/.vimrc | call minpac#update()
command! PackClean  source ~/.vimrc | call minpac#clean()
command! PackStatus source ~/.vimrc | call minpac#status()
"	ーーーパッケージ管理下での設定ここまでーーー

"	エディタ起動後に、デスクトップに移動する。
if ( has('win32') || has('win64') )
cd $HOME/Desktop
set autochdir
"	これをコメントアウトする場合、上記のデスクトップ移動もコメントアウトする必要がある。

" バッファで開いているファイルのディレクトリでエクスクローラを開始する
"set browsedir=buffer
endif

" Vimから使えるデバッガUI
augroup MyTermDebug
	" C言語ファイルのみ有効
	au!
	au FileType c packadd termdebug
augroup END


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

" 大文字を含む場合は、大小文字を区別して検索するが、すべて小文字の場合は大小文字を区別せずに検索する。
set smartcase

"	検索方法を自然な正規表現に変換(very Magic)
nnoremap / /\v

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
	set nocompatible
endif
filetype plugin on
"runtime macros/matchit.vim

" 対の記号移動。
"let g:matchit = 0
"source $VIMRUNTIME/macros/matchit.vim

" 括弧の対応関係を一瞬表示
"set showmatch
"	%移動の拡張
source $VIMRUNTIME/macros/matchit.vim

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" ctagsの検索場所を親ディレクトリから再帰的に探す。
"		https://qiita.com/aratana_tamutomo/items/59fb4c377863a385e032
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

" <C-a>の増減を10進数で行う。
set nrformats=


" コマンド補完
set wildmenu
"set wildmode=list:longest,full	"	←fullのみが規定値(それ以外は個人付け足し)
set wildmode=longest,full
set history=800 " 保存するコマンド履歴の数

" 補完表示時のEnterで決定)
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

"	Tabで確定したい。
inoremap <expr><Tab> pumvisible() ? "<C-y>" : "\<Tab>"
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "\<CR>"
"	補完候補の選択を矢印キーで行う。
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
" 常時補完候補を表示する(初回の補完時に挿入しない)
"set completeopt=menuone,noinsert
set completeopt=menuone







"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定
" autofmt: 日本語文章のフォーマット(折り返し)プラグイン。
set formatexpr=autofmt#japanese#formatexpr()


"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" ビープ音を鳴らさない
"set vb t_vb=
set belloff=all

" 他で書き換えられたら自動で読み直す
set autoread

" 行番号を表示 (nonumber:表示しない)
set number

"	下記は、行番号をカレント行から相対的に表示
set relativenumber
"set norelativenumber
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


" カーソルの移動として画面幅いっぱいまで移動させる設定。

set scrolloff=0
"	:help L

" 見た目の行数で移動する.
":nnoremap j gj
":nnoremap k gk

"---------------------------------------------------------------------------
" 編集に関する設定:

" タブの画面上での幅
set tabstop=4

" 改行時に、前の行のインデントを継続する。
"set autoindent

" 自動改行不可
set textwidth=0
"set formatoptions=q
set formatoptions=r
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
	"	本来これらは%TEMP%ディレクトリが望ましいだろう。
else
	let s:backup_dir = expand('~/.vim_backup')
	let s:undo_dir = expand('~/.vim_backup/undofile')
endif
if !isdirectory(s:backup_dir) || !isdirectory(s:undo_dir)
	exec mkdir(s:backup_dir, '', 0700)
	exec mkdir(s:undo_dir, '', 0700)
endif
let &backupdir = s:backup_dir
"let &directory = s:backup_dir	" スワップファイルの作成場所をカレントディレクトリにするため、コメントアウト。
let &undodir=&backupdir . "/undofile"	" アンドゥファイル
"set noundofile " アンドゥファイルを生成しない。
"set noswapfile "スワップファイルを生成しない。
"	以下、何？
set switchbuf=usetab


" 最後のカーソル位置を復元する
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" |
	\ endif
endif

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
"set fileencodings=utf-8,iso-2022-jp,iso-2022-jp-1,iso-2022-jp-2,iso-2022-jp-3,ISO-2022-JP-2004,cp932,sjis,utf-7,euc-jp,ucs-bom,eucjp-ms,euc-jisx0213,utf-16,utf-16le
"	CUI版のvimでutf8ファイルを開く場合、下記では文字化けする。上記のUTF-8が前面に設定されている必要がある。
set fileencodings=iso-2022-jp,iso-2022-jp-1,iso-2022-jp-2,iso-2022-jp-3,ISO-2022-JP-2004,cp932,sjis,utf-7,utf-8,euc-jp,ucs-bom,eucjp-ms,euc-jisx0213,utf-16,utf-16le
"	iso-2022-jp：日本語Jisのこと(しかし、適用されずにcp932で開かれる)。
"	utf-7は適用されず、utf-8で開かれる。
"	JIS・UTF7は開けず、文字化けする。

"	FencView.vimプラグインは、自動で文字コード判断可能なようだ。

" 改行コードの自動認識
"	改行コードを指定して開き直す場合　:e ++ff=mac
set fileformats=unix,dos,mac


" 日本語対応のための設定(Gvim初期起動時の設定にも関与する)
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについてはREADME_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
"source $VIMRUNTIME/encode_japan.vim
"set fileencoding=japan
set encoding=UTF-8

" 日本語整形スクリプト
let format_allow_over_tw = 1 " ぶら下り可能幅

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
nnoremap <Leader>S :Sexplore<CR>	" ←通常:Seで水平分割上で開く.\Sで開くようになる.
nnoremap <Leader>V :Vexplore<CR>	" ←通常:Vexで水平分割上で開く.\Vで開くようになる.
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
let $PATH = simplify($VIM . '/../../MacOS') . ':' . $PATH
"set migemodict=$VIMRUNTIME/dict/migemo-dict
"set migemo
"	インクリメンタルサーチをしない.
set noincsearch
"set incsearch


" 印刷に関する設定:
set printmbfont=r:HiraMinProN-W3,b:HiraMinProN-W6
set printencoding=utf-8
set printmbcharset=UniJIS

let $LUA_DLL = simplify($VIM . '/../../Frameworks/libluajit-5.1.2.dylib')


if has('multi_byte_ime') || has('xim')
	" IME ON時のカーソルの色を設定
	highlight CursorIM guibg=Red guifg=LightRed
	" 挿入モード・検索モードでのデフォルトのIME状態設定
"	set iminsert=0 imsearch=0
endif

" カーソルハイライト
set cursorline " カーソルラインをハイライト

"		アンダーライン付き。
highlight CursorLine gui=underline guifg=NONE guibg=NONE

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
"	以下、新規タブページを右端に作成する。
nnoremap <Leader>tn :$tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
"	以下、現在のバッファを新規タブで開く(現在のバッファは既存のタブに残る)
nnoremap <Leader>tm :tab split<CR>
"	以下、カレントタブページ以外を閉じる。
nnoremap <Leader>to :tabonly<CR>



"---------------------------------------------------------------------------
nnoremap <Leader>ev :e ~\.vimrc<CR>
nnoremap <Leader>eg :e ~\.gvimrc<CR>

if ( has('win32') || has('win64') )
	" コピペはできないが、ヤンクなどをWindowsのクリップボードに保存する処理。
"	set clipboard=unnamed,autoselect

	"	全選択
	nnoremap <Leader>a ggVG


	nnoremap <Leader>eh :e ++enc=sjis $HOME/Documents/AutoHotkey.ahk<CR>
	"		いずれは、編集後に読み込み直すような設定をしたい。
	" ※ディレクトリ名に日本語などが含まれている場合、文字化けする。
	"		その場合は、"set encoding=UTF-8"にする必要がある。
endif

"augroup filetype_go
"	autocmd!
"	:autocmd FileType go inoremap ' ''<esc>i
"	:autocmd FileType go inoremap " ""<esc>i
"	:autocmd FileType go inoremap < <><esc>i
"	:autocmd FileType go inoremap ( ()<esc>i
"	:autocmd FileType go inoremap { {}<esc>i
"	:autocmd FileType go inoremap [ []<esc>i
"augroup end

" 以上。
