<!-- vim:set ts=4 sts=4 sw=4 tw=0: -->

# 概要。
各ソフトウェアに対する設定ファイルを保存する場所になる。  
設定ファイルが混在するため、見にくくなることだろう。  
それを本ファイルで説明することにより、少し緩和できたらと思う。  

当たり前だが、私のWindows10端末で動かすことを前提にしている。  
要は、他のOSバージョンでは動作できない可能性が高い。  
例えば、同じPathを設定しているからという理由で起動する保証は無いと言うこと。  

## 事前準備物
以下の資材が導入済みであること。  

### Git
バージョン管理システムのこと。  
vimエディタで必要なプラグインを取得するのに必要。  

[https://gitforwindows.org/](https://gitforwindows.org/)  
[https://git-scm.com/book/ja/v2](https://git-scm.com/book/ja/v2)  

Windowsでは、取得(Clone)時に改行が勝手に切り替えられる。  
そのため、抑止コマンドでの制御が必要になる。  
`git config --global core.autocrlf false`  

#### \_gitconfig
そもそもこのファイルを一般公開して良いのかどうか・・・。  
OS用ごとにファイル内容を分けて記載しているのもどうかと思うな・・・GUI側で設定を変更した場合、元のファイルが書き換えられてしまう。
何のためにファイルを分けたのか分からない。  

2021/02/11：新規登録。  

### vim
Windows・Macなどなどで使うためのエディタ。  

[https://www.kaoriya.net/software/vim/](https://www.kaoriya.net/software/vim/)  
[https://github.com/koron](https://github.com/koron)  
[https://www.vim.org/download.php#pc](https://www.vim.org/download.php#pc)  
[https://github.com/koron/vim-kaoriya](https://github.com/koron/vim-kaoriya)  

必須  
できるならば、Python導入済みのvimエディタであるこが望ましい。  


### firefox
vimエディタからマークダウンファイルをプレビューで見るために必要。  

[https://www.mozilla.org/ja/firefox/new/](https://www.mozilla.org/ja/firefox/new/)  

### Ctags
あればよし。無くても問題ない。  

[https://github.com/universal-ctags/ctags](https://github.com/universal-ctags/ctags)  

#### Golang
あればよし。無くても問題ない。  

[https://golang.org/](https://golang.org/)  

### 秀丸エディタ
あればよし。無くても問題ない。  

[https://hide.maruo.co.jp/software/hidemaru.html](https://hide.maruo.co.jp/software/hidemaru.html)  

### サクラエディタ
これぐらいは用意できるだろう？  

[https://sakura-editor.github.io/](https://sakura-editor.github.io/)  

### Visual Studio Code
Microsoft社製品のエディタ利用を拒否する輩はいますまい。  

[https://code.visualstudio.com/](https://code.visualstudio.com/)  
~~[https://azure.microsoft.com/ja-jp/products/visual-studio-code/](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)~~  

### テラパッドエディタ
普段は使わない。  

### ノートパッド++
普段は使わない。  

[https://github.com/notepad-plus-plus/notepad-plus-plus](https://github.com/notepad-plus-plus/notepad-plus-plus/commit/06657c82b3b9a1871c483982282f046b1ac7b3be)  
[https://notepad-plus-plus.org/](https://notepad-plus-plus.org/)  

## makeLinkfile
下記のAutoHotKey(Windowsのみ)・[g]vimrcファイルのシンボリックファイルを各所に配置する。  

* AutoHotKey：ドキュメントディレクトリ・スタートアップに配置する。  
* alias.bat：ドキュメントディレクトリに配置する。  
* [g]vimrc：HOMEディレクトリに配置する。  
* \_gitignore\_global(以下、シンボリックファイルとして利用する)  
  * gitignore\_global.txt：ドキュメントディレクトリに配置する(Sourcetree専用？)。  
  * hgignore\_global.txt：ドキュメントディレクトリに配置する(Sourcetree専用？)。  
  * ignore：~/.config/git/ignore(すべてのgitアカウント用)。  

※Windowsのコマンドプロンプトからbashを起動した場合読み込まず、`Bash on Ubuntu on Windows`でも、読み込まない。
唯一`Ubuntu(Windowsの話)`で読み込んだ(配布方法を忘れた)。  
ディレクトリに移動して、シェルを叩けば配置される？  

2021/02/13：新規登録(Windows用)。  
2021/04/01：新規登録(Mac用・Android用)。  



## hidemaru.hmereg
秀丸エディタの設定ファイル  

※ **エディタからの読み込み方法があるため、それを用いること。**  
他の方法で読み込む場合、設定が壊れる可能性があるため気をつけること。  

※上記のmakeLinkfileを実行したときに、vimbackupディレクトリをホームディレクトリ配下に作成する。
そこに、秀丸エディタで編集したファイルのバックアップファイルを作るようにしている。  

2021/02/11：新規登録。  

### キー割り当て.KEY
`F4`	：画面分割(上下)  
`Shift+F4`	：画面分割(左右)  

2021/02/23：新規登録。  

画面分割は、vimエディタを超えることは出来ないようだ(標準でショートカットも割り当てられていないため、サクラエディタより劣ることになっている)。  

## sakura.ini
サクラエディタの設定ファイル。  

2021/02/23：新規登録。  

## VSCodeディレクトリ
Visual Studio Codeのバックアップファイル(Windows用？)。  

C:\Users\asakunotomohiro\AppData\Roaming\Code\User\settings.json  
C:\Users\asakunotomohiro\.vscode\extensions  
他に、ワークスペースの`settings.json`と`workspace.code-workspace`の2種類のファイルなどが必要になるが、これはそのプロジェクトにあるため、ここで個別バックアップはしない。  

~~他に、`Japanese Language Pack for Visual Studio Code`などの日本語化作業が必要~~  

extensionsディレクトリは、20MB近くある。  

2021/07/01：新規登録。  


## TERATERM.INI
テラタームの設定ファイル。  

2021/04/01：新規登録。  


## TeraPad.ini
テラパッドエディタの設定ファイル。  

2021/02/23：新規登録。  



## AutoHotkey
通称AHKと言われるWindows専用のキーボードショートカットツール。  
しかし、任意のソフトウェアを起動する場合、フルPathをべた書きする必要があり、他環境では変更を要求される。  
また、Windows98/Meは動作保証外。  

2021/02/12：新規登録。  
  exe：v1.1.33.2 Unicode 64-bi  

* 今後の予定：
  * WindowsStoreでのインストールソフトは、起動させることが出来ない。  
    それを起動できるようにさせたい。現在、デスクトップにショートカットファイルがあれば、起動させることはできる。  
  * AutoHotKeyを無視するウィンドウ(ソフトウェア)が存在するため、それを回避してAutoHotKeyを優先させたい(具体的には、WindowsOSが用意しているソフトウェア一部)。  
    タスクマネージャがアクティブになっているときも有効にしたかったが、こればかりはできそうにないようだ(勝手に外部のソフトウェアが動かせたら問題あるかららしい)。  

### 朝来野智博.exe
現在公開している`AutoHotkey.ahk`から生成したのではなく、キー起動方法を変えた実行ファイルになる。  
具体的には、Excelなどを起動する場合、AppsKeyとの組み合わせで起動させる方法をとっていたが、キーボードによってはそのキーが存在しないため設定が無駄になる。  
それをPAUSE(and F1)キーに変更したのが本ファイルになる。  

その起動方法の組み合わせは、`メモYYYYMMDD.xlsx`の`初期設定(ターミナル・Bash・キーボード)`シートに記載した。  
それとは別に、`F23 & [ej]`にて、英語キーボードから日本語キーボードへの変更(もしくはその逆)を実施する(要管理者権限：**括弧内の数字が`11`になっていること**)処理も埋め込んでいる。  
※今回の作成以後、更新することのないexeファイルになる(悔いがあるため、あと1回は更新する？)。

無理矢理起動させる仕組みを付けているため、ショートカットファイルをデスクトップに置いておけば、起動できるソフトウェアもあるだろう。  
当然、起動時間はかかる・・・(時間が掛かる作業前に、確認ダイアログメッセージで問い合わせる)。  

### 以下、ホットキー(ソフトウェア起動用)
ソフト起動時の通常Path(例外あり)  

- C:\Program Files\～～～  
- C:\Program Files (x86)\～～～  

※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。  

### ホットキー(ソフトウェア内での挙動)
こちらも通常のショートカットキーを潰している可能性がある。  

* Ctrl+h	：バックスペースキー  
* Ctrl+w	：ウィンドウ終了(タブ・子ウィンドウ)  
* Win+q	：ウィンドウ終了(親ウィンドウまるごと)  
* 基本的には、ソフトウェア起動を主に設定している。  

#### Gvim
個別対応  

* Win+t	：新規タブ作成  
* Win+w	：タブClose  
* Win+m	：現在のバッファを新規タブに移動  
* Alt+Space	：アクティブウィンドウの最小化。  
* Win+Alt+d	：現在のバッファを完全終了  

#### 秀丸エディタ
個別対応  

* Ctrl+g	：Grep検索ウィンドウ表示  
* Ctrl+j	：指定行移動  
* Win+Alt+f	：全画面表示(割り当てキーをいずれ変更する？)。  

#### Eclipse
個別対応  

* Ctrl+g	：Grep検索ウィンドウ表示  
* Ctrl+j	：指定行移動  


## bash用環境ファイル
HOMEディレクトリ直下に配置するのが基本になる。  
/etcディレクトリ配下に置くのもある(廃止予定)。  

2021/04/01：Mac用・Android用新規登録。  

※ **シェル** ：zshとの共通ファイルを読み込む。  

## zsh用環境ファイル
HOMEディレクトリ直下に配置するのが基本になる。  

2021/04/01：Mac用新規登録。  

※ **シェル** ：bashとの共通ファイルを読み込む。  

## vimrc・gvimrc
Vimエディタの設定ファイル。  
HOMEディレクトリ直下に配置するのが基本になる。  

2021/02/12：vimrc新規登録。  
2021/02/13：gvimrc新規登録。  

### 内容
バックアップファイルは、OS問わず、ホームディレクトリ直下の.vim\_backupディレクトリを使うようにしている。  
ただし、スワップファイルの作成は、カレントディレクトリに作る。  

難点は、セッション管理用のプラグイン導入にて、vimを起動するたびにデフォルト名でディレクトリを作るようになっている(Windows限定？)。  
対処方法不明。  

<details><summary>vim設定</summary>

#### プラグイン無関係設定
日本語や多バイト言語の設定をしている。  

折りたたみ設定を有効化しているが、ファイルを開いた時点では、折りたたみを開いた状態にしている。  

* za	：トグル  
* zo	：折りたたみが開く  
* zc	：折りたたむ  
* zR	：すべての折りたたみを開く  
* zM	：すべての折りたたみを閉じる。  

秀丸エディタやサクラエディタのように、タブバーも使いやすいように設定している。  

* \<Leader\>tn	：新規タブを開く。  
* \<Leader\>tc	：タブを閉じる。  
* \<Leader\>tm	：カレントバッファを新規タブに移動する。  
* \<Leader\>to	：カレントタブ以外閉じる。  
* gvimrc
  * \<C-Tab\> gt	：Ctrl+Tabで、タブ移動(左から右)。  
  * \<S-C-Tab\> gT	：Ctrl+Tabで、タブ移動(右から左)。  

vimエディタの設定ファイルを開ける。  

* \<Leader\>ev	：vimrcを開く。  
* \<Leader\>eg	：gvimrcを開く。  
* Windows限定  
  * \<Leader\>eh	：AutoHotKeyを開く(ドキュメントディレクトリ配下配置が前提)。  

gvimrc限定の設定としては、ウィンドウサイズを固定したままエディタ起動するとか、日本語や多バイト文字への対処などなど。  
などなどの設定説明は、ざっくりではあるが、コメントを付けているため、混乱することはないはず。  

##### 困りごと(vimrc)。
任意の文字コードを解釈できずに、異なる文字コードで開くことがあり、困っている。  

##### 困りごと(gvimrc)。
一番の困りごとは、日本語入力時の文節区切りが判別できないこと(こればかりは最悪だ)。  
ATOKを使っているからか？  

`vim-gitgutter`での色設定が反映されない。  


#### プラグイン用設定
キーマップ(備忘録用)。  

* [minpac](https://github.com/k-takata/minpac)  
* [nerdtree](https://github.com/preservim/nerdtree)  
  私の環境固有バグあり。  
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)  
* [vim-fugitive](https://github.com/tpope/vim-fugitive)・[vim-rhubarb](https://github.com/tpope/vim-rhubarb)  
* [tagbar](https://github.com/preservim/tagbar)  
* [undotree](https://github.com/mbbill/undotree)  
* [open-browser.vim](https://github.com/tyru/open-browser.vim)  
* [vim-session](https://github.com/xolox/vim-session)・[vim-misc](https://github.com/xolox/vim-misc)  
* [vim-findroot](https://github.com/mattn/vim-findroot)  
* [vim-smartinput](https://github.com/kana/vim-smartinput)  

</details>


### vimファイル
拡張子がvimの場合は、ファイル形式別の設定ファイル。  
その前提を崩したくないため、セッションファイルは別名にしている。  

配置場所は、 `~/.vim/after/ftplugin` 配下に置く。  

2021/02/21：新規登録。  



## 一太郎
バックアップファイルを作成するように設定してあるが、 ~~ゴミ~~ バックアップファイルがカレントディレクトリに生成される。  
気持ち悪いので、無効化しているが、指定した場所に保存しない。  

※バックアップファイルの作成場所は、makeLinkfileを実行したときに作成される、vimのバックアップファイルと同じディレクトリ(そこの専用ディレクトリ配下に作成していく)。  
`~/.vim\_backup/Taro/`  

2021/04/01：新規登録。  


### AutoHotKey
一太郎を起動するようにしているが、絶対に使わない設定だろう。  

## ATOK
Windows版は設定をバックアップできるが、Mac版はできない。  

2021/04/01：新規登録(Windows用)。  



## gitignoreファイル
git設定(無視ファイルの設定)  

2021/02/11：新規登録。  
2021/04/01：hgignore\_global新規登録。  



## メモ\_YYYYMMDD(テキストファイル)
メモをとるためのひな形  

2021/02/14：新規登録。  

## メモ\_YYYYMMDD(Excelファイル)
WindowsOSでの作業準備ファイル。  
作業を残すためのひな形でもある。  

2021/04/01：新規登録。  

## マウス設定(M-DUX70BK).xml
ゲーム用にボタン設定をしている。  
しかし、無茶苦茶でかいマウスなため、お蔵入り。  

2021/02/15：新規登録。  








































## 今後
今は、簡易的なメモ取りとしてMarkdownを使っているが、将来的には、sphinxでメモを取れるようになりたい。  

## ライセンス
GPL-ver2  

改造を含む利用可能なソースコードと同一条件でのライセンス  
そもそも隠す物ではないはず。  

以上。  
