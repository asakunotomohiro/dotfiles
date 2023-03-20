<!-- vim: set ts=4 sts=4 sw=4 tw=0 ff=unix fenc=utf-8 ft=markdown expandtab: -->
# 概要。
各ソフトウェアに対する設定ファイルを保存する場所になる。  
設定ファイルが混在するため、見にくくなることだろう。  
それを本ファイルで説明することにより、少し緩和できたらと思う。  

当たり前だが、私のWindows10端末で動かすことを前提にしている。  
他のOSバージョンでは動作しない可能性が高い。  


## 事前準備物
以下の資材が導入済みであること。  

<a name="tableOfContents"></a>
* 目次  
  * エディタ  
    * [vim](#vimperation)  
    * [秀丸エディタ](#hidemaruperation)  
    * [サクラエディタ](#sakuraperation)  
    * [ATOM](#atomperation)  
    * [Visual Studio Code](#vscodeperation)  
    * [テラパッドエディタ](#terapadperation)  
    * [ノートパッド++](#notepadperation)  
  * [AutoHotKey](#autohotkeyperation)  
  * [開発環境構築](#production)  
    * [Git](#gitperation)  
    * [Ctags](#ctagsperation)  
    * [Golang](#golangperation)  
    * [Python環境構築](#productionpython)  
    * [C環境構築](#productionclang)  
    * [Java環境構築](#productionjava)  
    * [Ruby環境構築](#productionruby)  
    * [Perl環境構築](#productionperl)  
  * ブラウザ  
    * [firefox](#firefoxperation)  
  * その他  
    * [bash用環境ファイル](#configfilebash)  
    * [zsh用環境ファイル](#configfilezsh)  
    * [AndroidOS向け作業](#androidosoperation)  
  * 主にWindows向け  
    * [一太郎](#onetaroperation)  
    * [ATOK](#atokperation)  
    * [メモ(テキストファイル)](#memotextperation)  
    * [メモ(Excelファイル)](#memoexcelperation)  
    * [マウス設定(M-DUX70BK)](#mouseperation)  
  * [今後の課題](#fromnowonperation)  
  * [ライセンス](#licenseperation)  


<a name="gitperation"></a>
### Git
バージョン管理として用いる(できる限り最新版を使うように心がけている)。  
vimエディタで必要なプラグインを取得するのに必要。  
また、[AndroidOS](#androidosoperation)のDroidVimソフトウェアは、OSのバージョンが古い場合、Git導入が出来ない。  

[https://gitforwindows.org/](https://gitforwindows.org/)  
[https://git-scm.com/book/ja/v2](https://git-scm.com/book/ja/v2)  

Windowsでは、取得(Clone)時に改行が勝手に切り替えられる。  
そのため、抑止コマンドでの制御が必要になる。  
`git config --global core.autocrlf false`  

* ファイル  
  * \_gitconfig  
    OS用ごとにファイル内容を分けたが、GUI側で設定を変更した場合、元のファイルが書き換えられてしまう。  
    2021/02/11：新規登録。  
    本来のファイル名：**.gitconfig**
    本来の配置場所：**~/**
  * gitignore  
    git設定(無視ファイルの設定)  
    2021/02/11：新規登録。  
    2021/04/01：hgignore\_global新規登録。  
    本来のファイル名：**ignore**
    本来の配置場所：**~/.config/git/**

[目次に戻る](#tableOfContents)  


<a name="vimperation"></a>
### vim
Windows・Macなどなどで使うためのエディタ。  

ver8以上を必須とする。  
ver7では、Android部分の判定でエラーが発生する。  

* Windows  
  [https://www.kaoriya.net/software/vim/](https://www.kaoriya.net/software/vim/)  
  [https://github.com/koron](https://github.com/koron/vim-kaoriya)  
  [https://www.vim.org/download.php#pc](https://www.vim.org/download.php#pc)  

* Mac  
  [https://github.com/macvim-dev/macvim](https://github.com/macvim-dev/macvim)  
  ~~リンク削除：`brew unlink vim`~~  
  ~~`brew install macvim`~~  
  ~~事前に、既存のvimをbrew管理から削除する必要がある：`brew unlink vim`~~  
  ~~インストール後のリンク付け：`ln -s $(brew --prefix macvim)/MacVim.app /Applications`~~  

[あんちょこ](https://gihyo.jp/assets/files/magazine/SD/2015/201510/download/Furoku_CheatSheet_Vim.pdf)  

<details><summary>インストール方法について。</summary>

[目次に戻る](#tableOfContents)  

#### Vim環境構築
※Mac端末への構築。  

Macvimのほうがいい？  
古いので止めた方が良いようだ。  
しかし、今見返したら"Vim 9.0.0065"とのこと・・・新しい(古くもあるけど・・・)。  
そして、香り屋さんのvimより新しいという・・・どういう風の吹き回しか。  

`brew install vim`  
導入前：**VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Dec 17 2021 18:32:29)**  
導入後：**VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Dec 17 2021 18:32:29)**  
アップデートしただけだったようだが、何も変わらず。  
**Running `brew update --auto-update`...**  

</details>

<details><summary>備考。</summary>

#### vimファイル(vimFtpluginディレクトリ配下)

拡張子がvimの場合は、ファイル形式別の設定ファイル。  
その前提を崩したくないため、セッションファイルは別名にしている。  

配置場所は、 `~/.vim/after/ftplugin` 配下に置く。  

2021/02/21：新規登録。  

</details>

<details><summary>設定ファイル。</summary>

#### vimrc・gvimrc
Vimエディタの設定ファイル。  
HOMEディレクトリ直下に配置するのが基本になる。  

2021/02/12：vimrc新規登録。  
2021/02/13：gvimrc新規登録。  


##### 内容
バックアップファイルは、OS問わず、ホームディレクトリ直下の.vim\_backupディレクトリを使うようにしている。  
ただし、スワップファイルの作成は、カレントディレクトリに作る。  


<details><summary>vim設定</summary>

##### プラグイン無関係設定
日本語や多バイト言語の設定をしている。  

折りたたみ設定を有効化しているが、ファイルを開いた時点では、折りたたみを開いた状態にしている。  

* za	：トグル  
* zo	：折りたたみが開く  
* zc	：折りたたむ  
* zR	：すべての折りたたみを開く  
* zM	：すべての折りたたみを閉じる。  

タブバーも使いやすいように設定している。  

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


##### プラグイン用設定
キーマップ(備忘録用)。  

* 利用プラグイン(全てではない)  
  * [minpac](https://github.com/k-takata/minpac)  
  * [nerdtree](https://github.com/preservim/nerdtree)  
  * [vim-gitgutter](https://github.com/airblade/vim-gitgutter)  
  * [vim-fugitive](https://github.com/tpope/vim-fugitive)・[vim-rhubarb](https://github.com/tpope/vim-rhubarb)  
  * [tagbar](https://github.com/preservim/tagbar)  
  * [undotree](https://github.com/mbbill/undotree)  
  * [previm](https://github.com/previm/previm)  
  * [open-browser.vim](https://github.com/tyru/open-browser.vim)  
  * [vim-session](https://github.com/xolox/vim-session)・[vim-misc](https://github.com/xolox/vim-misc)  
  * [vim-findroot](https://github.com/mattn/vim-findroot)  
  * ~~[vim-smartinput](https://github.com/kana/vim-smartinput)~~  
  * [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)  
  * [vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search)  
  * [vim-quickrun](https://github.com/thinca/vim-quickrun)  

</details>

</details>

<details><summary>AutoHotKeyでのショートカット設定内容。</summary>

#### AutoHotKey-Gvim個別対応

* Win+t	：新規タブ作成  
* Win+w	：タブClose  
* Win+m	：現在のバッファを新規タブに移動  
* Alt+Space	：アクティブウィンドウの最小化。  
* Win+Alt+d	：現在のバッファを完全終了  

</details>

必須エディタ  
できるならば、Python3導入済みのvimエディタであるこが望ましい。  
そして、brewコマンドからのvimインストールでは、有効化された状態でインストールされる。  


<a name="firefoxperation"></a>
### firefox
vimエディタからマークダウンファイルをプレビューで見るために必要。  

[https://www.mozilla.org/ja/firefox/new/](https://www.mozilla.org/ja/firefox/new/)  

[目次に戻る](#tableOfContents)  


<a name="ctagsperation"></a>
### Ctags
あればよし。無くても問題ない。  

[https://github.com/universal-ctags/ctags](https://github.com/universal-ctags/ctags)  

[目次に戻る](#tableOfContents)  


<a name="golangperation"></a>
### Golang
あればよし。無くても問題ない。  

<details><summary>インストール方法について。</summary>

環境管理ソフトウェアの導入：`brew install --HEAD goenv`  

* 以下、上記のgoenvを前提に構築する。  
  * Homebrew更新。  
    `brew update`  
    `brew upgrade goenv`  

  * Go環境のインストール可能一覧コマンド  
    `goenv install -l`  

  * Go環境のインストールコマンド例  
    `goenv install 1.18.4`  

  * 今回インストールしたバージョンのGo環境をローカル上で使用する場合のコマンド  
    `goenv local 1.18.4`  
    ※カレントディレクトリのみ有効。  

  * 今回インストールしたバージョンのGo環境をグローバル上で使用する場合のコマンド  
    `goenv global 1.18.4`  

  * goenvそのもののバージョン確認コマンド  
    `goenv -v`  

  * goenvでインストールしたgo言語環境のバージョン一覧コマンド  
    `goenv versions`  

</details>

[https://golang.org/](https://golang.org/)  

[目次に戻る](#tableOfContents)  


<a name="hidemaruperation"></a>
### 秀丸エディタ
あればよし。無くても問題ない。  

<details><summary>設定ファイル。</summary>

[目次に戻る](#tableOfContents)  

#### hidemaru.hmereg
秀丸エディタの設定ファイル  

※ **エディタからの読み込み方法があるため、それを用いること。**  
他の方法で読み込む場合、設定が壊れる可能性があるため気をつけること。  

ファイルを開いているときに、他で編集が行われた場合、読み込み直すことへの問い合わせをするようにしたが、、、間違えてその確認を閉じた場合、再表示させる方法が分からない。  
困る。

※[makeLinkfile](#imitationmakefile)を実行したときに、vimbackupディレクトリをホームディレクトリ配下に作成する。
そこに、秀丸エディタで編集したファイルのバックアップファイルを作るようにしている。  

2021/02/11：新規登録。  

</details>

<details><summary>キーバインド用ファイル。</summary>

#### キー割り当て.KEY
`F4`	：画面分割(上下)  
`Shift+F4`	：画面分割(左右)  

2021/02/23：新規登録。  

画面分割は、vimエディタを超えることは出来ないようだ(そして、設定の硬軟さからサクラエディタより劣る)。  

</details>

<details><summary>AutoHotKeyでのショートカット設定内容。</summary>

#### AutoHotKey-秀丸エディタ個別対応

* Ctrl+g	：Grep検索ウィンドウ表示  
* Ctrl+j	：指定行移動  
* Win+Alt+f	：全画面表示(割り当てキーをいずれ変更する？)。  

</details>

[https://hide.maruo.co.jp/software/hidemaru.html](https://hide.maruo.co.jp/software/hidemaru.html)  


<a name="sakuraperation"></a>
### サクラエディタ
これぐらいは用意できるだろう？  

[https://sakura-editor.github.io/](https://sakura-editor.github.io/)  

<details><summary>iniファイル。</summary>

#### sakura.ini
サクラエディタの設定ファイル。  

2021/02/23：新規登録。  

</details>

[目次に戻る](#tableOfContents)  


<a name="atomperation"></a>
### ATOM
残念ながら開発中止になったエディタだ。  
ちょっと使いにくく、数日使って利用を諦めてしまったぐらいだし・・・使いこなせないだけだろうが、他にエディタはあるからな。  

[https://atom.io](https://atom.io)  
[https://github.com/atom/atom](https://github.com/atom/atom)  
最終バージョン：1.60.0？  

[GitHubがテキストエディタ「Atom」の開発停止を宣言、2022年12月15日にリポジトリがアーカイブ予定](https://gigazine.net/news/20220609-github-sunsetting-atom/)  
[Sunsetting Atom](https://github.blog/2022-06-08-sunsetting-atom/)  

[目次に戻る](#tableOfContents)  


<a name="vscodeperation"></a>
### Visual Studio Code(VSCode)
Microsoft社製品のエディタ利用を拒否する輩はいますまい。  
ただし、プラグイン導入が必須になるため、それが出来ないならば、使う意味は薄れる(むしろ足を引っ張る)。  

[https://code.visualstudio.com/](https://code.visualstudio.com/)  
~~[https://azure.microsoft.com/ja-jp/products/visual-studio-code/](https://azure.microsoft.com/ja-jp/products/visual-studio-code/)~~  

<details><summary>VSCodeディレクトリ。</summary>

[目次に戻る](#tableOfContents)  


#### VSCodeの設定ファイル。
Visual Studio Codeのバックアップファイル(Windows用？)。  

* 格納ファイル。  
  ※以下の他に、ワークスペースの`settings.json`と`workspace.code-workspace`の2種類のファイルなどが必要になるが、これはそのプロジェクトにあるため、ここで個別バックアップはしない。  
  [C:\Users\asakunotomohiro\AppData\Roaming\Code\User\settings.json]()  
  [C:\Users\asakunotomohiro.vscode\extensions]()  
  extensionsディレクトリは、20MB近くある。  

本体インストール後に、日本語化を提案されるため、導入する。  

2021/07/01：新規登録。  

</details>


<a name="terapadperation"></a>
### テラパッドエディタ
普段は使わない。  

<details><summary>iniファイル。</summary>

[目次に戻る](#tableOfContents)  


#### TeraPad.ini
テラパッドエディタの設定ファイル。  

2021/02/23：新規登録。  

</details>


<a name="notepadperation"></a>
### ノートパッド++
普段は使わない。  

[https://github.com/notepad-plus-plus/notepad-plus-plus](https://github.com/notepad-plus-plus/notepad-plus-plus/commit/06657c82b3b9a1871c483982282f046b1ac7b3be)  
[https://notepad-plus-plus.org/](https://notepad-plus-plus.org/)  

[目次に戻る](#tableOfContents)  


<a name="imitationmakefile"></a>
## makeLinkfile
下記のAutoHotKey(Windowsのみ)・[g]vimrcファイルのシンボリックファイルを各所に配置する。  

* AutoHotKey：ドキュメントディレクトリ・スタートアップに配置する。  
* alias.bat：ドキュメントディレクトリに配置する。  
* [g]vimrc：HOMEディレクトリに配置する。  
* \_gitignore\_global(以下、シンボリックファイルとして利用する)  
  * ~~gitignore\_global.txt：ドキュメントディレクトリに配置する(Sourcetree専用？)~~。  
  * ~~hgignore\_global.txt：ドキュメントディレクトリに配置する(Sourcetree専用？)~~。  
  * ignore：~/.config/git/ignore(すべてのgitアカウント用)。  

※Windowsのコマンドプロンプトからbashを起動した場合読み込まず、`Bash on Ubuntu on Windows`でも、読み込まない。
唯一`Ubuntu(Windowsの話)`で読み込んだ(配布方法を忘れた)。  
ディレクトリに移動して、シェルを叩けば配置される？  

2021/02/13：新規登録(Windows用)。  
2021/04/01：新規登録(Mac用・Android用)。  

DroidVimには配布できないようだ。  
無理矢理
`ln -sf /storage/emulated/0/ ~/shared_droidvim`
を実行して無理矢理シェルを叩きに行ったところで、**vimrc** を **$HOME** に配置できない。  
何より、権限が**root**になっており、閲覧できない。  
そして、`chown -hR [whoami] .`での権限変更も受け付けてくれない。  
完全に。


## TERATERM.INI
テラタームの設定ファイル。  

2021/04/01：新規登録。  


## AutoHotkey
通称AHKと言われるWindows専用のキーボードショートカットツール。  
しかし、任意のソフトウェアを起動する場合、フルPathをべた書きする必要があり、他環境では変更を要求される。  
また、Windows98/Meは動作保証外。  

2021/02/12：新規登録。  
  exe：v1.1.33.2 Unicode 64-bi  

* 今後の予定：
  * 起動時間が長い場合、ショートカットファイルをデスクトップに置くことで起動時間は短縮できる。  
    いつでもどこでも起動させるようにしたい。  
    ※起動に時間が掛かり、それを中断させる場合はスクリプトのリロードで処理が停止する。  
  * ~~AutoHotKeyを無視するウィンドウ(ソフトウェア)が存在するため、それを回避してAutoHotKeyを優先させたい(具体的には、WindowsOSが用意しているソフトウェア一部)~~。  
    タスクマネージャがアクティブになっているときも有効にしたかったが、できないようだ(勝手に外部のソフトウェアが動かせたら問題あるかららしい)。  

<details><summary>スクリプトファイル。</summary>
</details>


<a name="autohotkeyperation"></a>
### AutoHotKey.exe
よくよく考えたらexeファイルを分ける必要なかった。
そのため、`朝来野智博.exe`を通常名に戻した。  
通常のスクリプトファイルから起動するだけでなく、今回用のexeファイルからも(上記)同様に、任意のソフトウェアを起動する。  

起動方法の組み合わせは、`メモYYYYMMDD.xlsx`の`初期設定(ターミナル・Bash・キーボード)`シートに記載した。  
`F23 & [ej]`にて、英語キーボードから日本語キーボードへの変更(もしくはその逆)を実施する処理(要管理者権限)も埋め込んでいる。  

<details><summary>AutoHotKeyでのショートカット設定内容。</summary>

#### 以下、ホットキー(ソフトウェア起動用)
ソフト起動時の通常Path(例外あり)  

- C:\Program Files\～～～  
- C:\Program Files (x86)\～～～  

※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。  


#### AutoHotKey-Eclipse個別対応
個別対応  

* Ctrl+g	：Grep検索ウィンドウ表示  
* Ctrl+j	：指定行移動  

</details>

[目次に戻る](#tableOfContents)  


#### ホットキー(ソフトウェア内での挙動)
こちらも通常のショートカットキーを潰している可能性がある。  

* Ctrl+h	：バックスペースキー  
* Ctrl+w	：ウィンドウ終了(タブ・子ウィンドウ)  
* Win+q	：ウィンドウ終了(親ウィンドウまるごと)  
* 基本的には、ソフトウェア起動を主に設定している。  


<a name="shellperation"></a>
## シェル

* 利用シェル  
  [bash](#configfilebash)  
  [zsh](#configfilezsh)  

* MacOS専用：home-brew  
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`  
次に、`echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/asakunotomohiro/.zprofile`コマンド必須。  

* コマンド説明  
  * Homebrewでのパッケージをアップグレード：`brew upgrade`  
  * Homebrew本体の更新：`brew update`  
  * Homebrew本体から一時的に切り離す：`brew unlink パッケージ名`  
  * 切り離しから戻す(再接続の)場合：`brew link パッケージ名`  


* シェルの起動種類(Mac用)  
  ※以下、番号順に起動する。  
  * ログイン/ログアウト  
    通常は使わない方がいい(利用可能なのが他にある)。  
    1.**~/.zshenv**  
    2.**/etc/zprofile**  
  * インタラクティブシェル(作業者との対話型)  
    3.**~/.zprofile**  
    4.**/etc/zshrc**  
    5.**/etc/zshrc_Apple_Terminal**  
    6.**~/.zshrc**  
      エイリアス・プロンプト表記・シェルオプション設定などに使う。  
    *ログイン起動シェル  
    *コマンドライン起動シェル  
  * ノンインタラクティブシェル  
    非対話型  
    1. **~/.zshenv**  
       出力なし・長時間稼働なし・エラー発生なしの場合に限り使う。  

<details><summary>manコマンドの日本語化(断念)。</summary>

日本語化ができる方法があるようで、その通りにしたのだが、できなかった。  
エラーは出ないが、インストールに失敗するのか、何もインストールされずに、処理が終わる。  

1. 最新版の日本語化されたヘルプを入手する。  
    例）`curl -O http://linuxjm.osdn.jp/man-pages-ja-20220815.tar.gz`  
    ファイル名に付いている数字は毎月変更する。  

1. 展開  
    tarコマンド：`tar xfz man-pages-ja-20220815.tar.gz`  

1. そのディレクトリに移動。  
    cdコマンド：`cd man-pages-ja-20220815`  

1. 設定ファイルの実行。  
    makeコマンド：`make config`  

   1. インストールディレクトリの選択。  
      `Install directory   [/usr/share/man/ja_JP.UTF-8] ?: /usr/local/share/man/ja_JP.UTF-8`  
      ※基本はどこでも良いと思うが、一応はローカルディレクトリを指定するのが吉らしい。  

   1. インストール方法の選択。  
      `compress manual with..`  
      `select [0..3] : 0`  

   1. 権限の設定。  
      `uname of page owner [root] ?:`  
      `group of page owner [root] ?:`  
      特に気にしなくて良いならrootのままでいいようだ。  
      brewコマンドで導入するときは違うようなので、そのときに調べる。  

   1. 日本語化するコマンドの選択。  
      `[C]ontinue`するまでずっとEnterの空打ちで構わないそうだ。  

1. インストール実施。  
    makeコマンド：`sudo make install`  
    通常であれば、上記で設定したインストールディレクトリにインストールされるようだ。  
    私の環境ではインストールされず、何も作成されないままだった(そして、エラーにもならず)。  


</details>

<a name="production"></a>
<details><summary>開発環境構築。</summary>

* 簡易目次  
  * [Python環境構築](#productionpython)  
  * [C環境構築](#productionclang)  
  * [Java環境構築](#productionjava)  
  * [Ruby環境構築](#productionruby)  
  * [Perl環境構築](#productionperl)  

<a name="productionpython"></a>
### Python環境構築

環境管理ソフトウェアの導入：`brew install pyenv`  

* 以下、上記のpyenvを前提に構築する。  
  * インストール可能一覧コマンド  
    `pyenv install --list`  

  * Pythonインストールコマンド例  
    `pyenv install 3.10.4`  

  * pyenvでインストールしたPython言語環境のバージョン一覧コマンド  
    `pyenv versions`  

  * pyenvでインストールしたPython言語環境の切り替え準備  
    `eval "$(pyenv init -)"`  
    ※既に環境ファイルに設定済み。  

  * 今回インストールしたバージョンのPython環境をグローバル上で使用する場合のコマンド  
    `pyenv global 指定バージョン`  
    例）`pyenv global 3.10.4`  

  * 今回インストールしたバージョンのPython環境をローカル上で使用する場合のコマンド  
    `pyenv local 指定バージョン`  
    例）`pyenv local 3.10.4`  

* 勉強サイト  
  [Pythonプログラミング入門](https://utokyo-ipp.github.io/index.html)  

[目次に戻る](#tableOfContents)  


<a name="productionclang"></a>
### C環境構築

インストール：
`brew install gcc`  

普通に使うのはしんどいため、mac標準搭載のcコンパイラを使うことにする。  
今回インストールしたバージョンのCコンパイラを使う場合のコマンド：`gcc-11 cファイル`  

[目次に戻る](#tableOfContents)  


<a name="productionjava"></a>
### Java環境構築

<details><summary>環境確認。</summary>

```terminal
$ java --version	←☆実行環境がない。
The operation couldn’t be completed. Unable to locate a Java Runtime.
Please visit http://www.java.com for information on installing Java.

$ javac --version	←☆コンパイル環境がない。
The operation couldn’t be completed. Unable to locate a Java Runtime.
Please visit http://www.java.com for information on installing Java.

$
```

</details>

インストール：
`brew install java`  

<details><summary>実際のインストール作業。</summary>

```terminal
$ sw_vers
ProductName:    macOS
ProductVersion: 12.6
BuildVersion:   21G115
$
$ brew install java
Running `brew update --auto-update`...
==> Fetching dependencies for openjdk: giflib, libpng, freetype, fontconfig, pcre2, glib, xorgproto, libxau, libxdmcp, libxcb, libx11, libxext, libxrender, lzo, pixman, cairo, graphite2, icu4c, harfbuzz, jpeg-turbo, lz4, zstd, libtiff, and little-cms2
==> Fetching giflib
==> Downloading https://ghcr.io/v2/homebrew/core/giflib/manifests/5.2.1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/giflib/blobs/sha256:6a1194d7b2d991583e3b5d46782ac8d0cecfc35bc28a5b4daf86ec4311cc7cdc
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:6a1194d7b2d991583e3b5d46782ac8d0cecfc35bc28a5b4daf86ec4311cc7cdc?se=2023-03-20T07%3A20%3A00Z&sig=McbR1
######################################################################## 100.0%
==> Fetching libpng
==> Downloading https://ghcr.io/v2/homebrew/core/libpng/manifests/1.6.39-1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libpng/blobs/sha256:3866f0b5172ab2d599f2cb43e14870b2a444dee43964ce5ececa35b885c9330d
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:3866f0b5172ab2d599f2cb43e14870b2a444dee43964ce5ececa35b885c9330d?se=2023-03-20T07%3A20%3A00Z&sig=7L7%2
######################################################################## 100.0%
==> Fetching freetype
==> Downloading https://ghcr.io/v2/homebrew/core/freetype/manifests/2.13.0_1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/freetype/blobs/sha256:731770a82dfaa0512945bf4cdb9d0743c7c1ef54653eecaefb6163a5539c828e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:731770a82dfaa0512945bf4cdb9d0743c7c1ef54653eecaefb6163a5539c828e?se=2023-03-20T07%3A20%3A00Z&sig=OfiZp
######################################################################## 100.0%
==> Fetching fontconfig
==> Downloading https://ghcr.io/v2/homebrew/core/fontconfig/manifests/2.14.2
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/fontconfig/blobs/sha256:2e1558c0e3cb449da701c17897cdad76b21cc4a4af619a31848b08fa0a9fb2ca
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:2e1558c0e3cb449da701c17897cdad76b21cc4a4af619a31848b08fa0a9fb2ca?se=2023-03-20T07%3A20%3A00Z&sig=%2B3h
######################################################################## 100.0%
==> Fetching pcre2
==> Downloading https://ghcr.io/v2/homebrew/core/pcre2/manifests/10.42
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/pcre2/blobs/sha256:23ce93cf86bd4816b7d039efa0a5d68c751bce3f552a8cbf41762518b4be199e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:23ce93cf86bd4816b7d039efa0a5d68c751bce3f552a8cbf41762518b4be199e?se=2023-03-20T07%3A20%3A00Z&sig=EqLYY
######################################################################## 100.0%
==> Fetching glib
==> Downloading https://ghcr.io/v2/homebrew/core/glib/manifests/2.76.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/glib/blobs/sha256:99e3328a0d04c5ee44f8263c418176d0a1f936f4fac7bc6f06c49ebd8ca672a3
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:99e3328a0d04c5ee44f8263c418176d0a1f936f4fac7bc6f06c49ebd8ca672a3?se=2023-03-20T07%3A20%3A00Z&sig=%2Bdb
######################################################################## 100.0%
==> Fetching xorgproto
==> Downloading https://ghcr.io/v2/homebrew/core/xorgproto/manifests/2022.2
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/xorgproto/blobs/sha256:d6deb2e4712bdd55eadfdcd7156814a6c42c9d94eb5cda72b89c9e4221a8a99d
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:d6deb2e4712bdd55eadfdcd7156814a6c42c9d94eb5cda72b89c9e4221a8a99d?se=2023-03-20T07%3A20%3A00Z&sig=mwfLp
######################################################################## 100.0%
==> Fetching libxau
==> Downloading https://ghcr.io/v2/homebrew/core/libxau/manifests/1.0.11
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libxau/blobs/sha256:8f7c0378757601370d13539c5f1a11f560326464d9ba1f9fb9f5e2631163d559
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:8f7c0378757601370d13539c5f1a11f560326464d9ba1f9fb9f5e2631163d559?se=2023-03-20T07%3A20%3A00Z&sig=rlUC2
######################################################################## 100.0%
==> Fetching libxdmcp
==> Downloading https://ghcr.io/v2/homebrew/core/libxdmcp/manifests/1.1.4
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libxdmcp/blobs/sha256:7ead4738215915004a6f3333584cbcb7ae1accb1b9b0a4742708e276c64ff984
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:7ead4738215915004a6f3333584cbcb7ae1accb1b9b0a4742708e276c64ff984?se=2023-03-20T07%3A20%3A00Z&sig=fOG8g
######################################################################## 100.0%
==> Fetching libxcb
==> Downloading https://ghcr.io/v2/homebrew/core/libxcb/manifests/1.15_1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libxcb/blobs/sha256:8a0df37f2087ac271ae9780b2db056b4a75f2090a535ac7c9560944d295962db
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:8a0df37f2087ac271ae9780b2db056b4a75f2090a535ac7c9560944d295962db?se=2023-03-20T07%3A20%3A00Z&sig=9GJdr
######################################################################## 100.0%
==> Fetching libx11
==> Downloading https://ghcr.io/v2/homebrew/core/libx11/manifests/1.8.4
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libx11/blobs/sha256:5da752047f0745a2628343aa2f313f4544b13d0643ff796ae079fcc4d3203a63
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:5da752047f0745a2628343aa2f313f4544b13d0643ff796ae079fcc4d3203a63?se=2023-03-20T07%3A20%3A00Z&sig=rvhCu
######################################################################## 100.0%
==> Fetching libxext
==> Downloading https://ghcr.io/v2/homebrew/core/libxext/manifests/1.3.5
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libxext/blobs/sha256:4f194ef26f45585047eab4ceaa2c811c4273d32d2ea47d9b3d18f09bb0c1f300
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:4f194ef26f45585047eab4ceaa2c811c4273d32d2ea47d9b3d18f09bb0c1f300?se=2023-03-20T07%3A20%3A00Z&sig=72ixS
######################################################################## 100.0%
==> Fetching libxrender
==> Downloading https://ghcr.io/v2/homebrew/core/libxrender/manifests/0.9.11
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libxrender/blobs/sha256:660b41237f01b7561da61e4abd212f4575e6c97f4c76cc70c550868edbe227e5
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:660b41237f01b7561da61e4abd212f4575e6c97f4c76cc70c550868edbe227e5?se=2023-03-20T07%3A20%3A00Z&sig=0TG7U
######################################################################## 100.0%
==> Fetching lzo
==> Downloading https://ghcr.io/v2/homebrew/core/lzo/manifests/2.10
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/lzo/blobs/sha256:e16072e8ef7a8810284ccea232a7333a2b620367814b133a455217d22e89ae8e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:e16072e8ef7a8810284ccea232a7333a2b620367814b133a455217d22e89ae8e?se=2023-03-20T07%3A20%3A00Z&sig=Oq135
######################################################################## 100.0%
==> Fetching pixman
==> Downloading https://ghcr.io/v2/homebrew/core/pixman/manifests/0.42.2
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/pixman/blobs/sha256:1e4026e8980666338f1a49cc61a3b6e968a744d92a67aeacfe918f8e8266d8ce
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:1e4026e8980666338f1a49cc61a3b6e968a744d92a67aeacfe918f8e8266d8ce?se=2023-03-20T07%3A20%3A00Z&sig=FrfJg
######################################################################## 100.0%
==> Fetching cairo
==> Downloading https://ghcr.io/v2/homebrew/core/cairo/manifests/1.16.0_5
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/cairo/blobs/sha256:50feaae83e93330cc0ee6b90477cfa931fab52cdb98ad37a99a0e518da6a580e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:50feaae83e93330cc0ee6b90477cfa931fab52cdb98ad37a99a0e518da6a580e?se=2023-03-20T07%3A20%3A00Z&sig=b2l5Z
######################################################################## 100.0%
==> Fetching graphite2
==> Downloading https://ghcr.io/v2/homebrew/core/graphite2/manifests/1.3.14
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/graphite2/blobs/sha256:2254ea02844280605c79ab735ce1c5eb4a943fe897c3119611de54169130a88e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:2254ea02844280605c79ab735ce1c5eb4a943fe897c3119611de54169130a88e?se=2023-03-20T07%3A20%3A00Z&sig=UWms8
######################################################################## 100.0%
==> Fetching icu4c
==> Downloading https://ghcr.io/v2/homebrew/core/icu4c/manifests/72.1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/icu4c/blobs/sha256:90c50fe2cbf8bedcae43886caaa096ab6fc54f893be192912220ba1ec48e634f
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:90c50fe2cbf8bedcae43886caaa096ab6fc54f893be192912220ba1ec48e634f?se=2023-03-20T07%3A20%3A00Z&sig=deKBs
######################################################################## 100.0%
==> Fetching harfbuzz
==> Downloading https://ghcr.io/v2/homebrew/core/harfbuzz/manifests/7.1.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/harfbuzz/blobs/sha256:a93182e4d1b76b7a5abe3be51d41c65531c603cbdfc069632b1e52f7c6efbd37
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:a93182e4d1b76b7a5abe3be51d41c65531c603cbdfc069632b1e52f7c6efbd37?se=2023-03-20T07%3A25%3A00Z&sig=zQoYw
######################################################################## 100.0%
==> Fetching jpeg-turbo
==> Downloading https://ghcr.io/v2/homebrew/core/jpeg-turbo/manifests/2.1.5.1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/jpeg-turbo/blobs/sha256:844f7f6b0883d91c6e5f16c2c752d05566cea571def6f262b580c6d35a928e14
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:844f7f6b0883d91c6e5f16c2c752d05566cea571def6f262b580c6d35a928e14?se=2023-03-20T07%3A25%3A00Z&sig=R%2Fj
######################################################################## 100.0%
==> Fetching lz4
==> Downloading https://ghcr.io/v2/homebrew/core/lz4/manifests/1.9.4
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/lz4/blobs/sha256:284fa580570efdc8056e4fc95dc05f7b0546aa0c346795dd616d4cec8eb99426
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:284fa580570efdc8056e4fc95dc05f7b0546aa0c346795dd616d4cec8eb99426?se=2023-03-20T07%3A25%3A00Z&sig=Vn0wv
######################################################################## 100.0%
==> Fetching zstd
==> Downloading https://ghcr.io/v2/homebrew/core/zstd/manifests/1.5.4
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/zstd/blobs/sha256:6de68b55a5336e68071b587756944e5138334760f594d3c84f036c0558a06019
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:6de68b55a5336e68071b587756944e5138334760f594d3c84f036c0558a06019?se=2023-03-20T07%3A25%3A00Z&sig=MMBFH
######################################################################## 100.0%
==> Fetching libtiff
==> Downloading https://ghcr.io/v2/homebrew/core/libtiff/manifests/4.4.0_1-1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libtiff/blobs/sha256:b48b8b5166bc548be184e03892adf5259dad564bee1cb62ddb84c1bdf21caaeb
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:b48b8b5166bc548be184e03892adf5259dad564bee1cb62ddb84c1bdf21caaeb?se=2023-03-20T07%3A25%3A00Z&sig=XFojw
######################################################################## 100.0%
==> Fetching little-cms2
==> Downloading https://ghcr.io/v2/homebrew/core/little-cms2/manifests/2.14
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/little-cms2/blobs/sha256:ae03cf730b8472ba74ccf339e64c2275b3b1558bee4d43f87d13bb8ddf15bcfc
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:ae03cf730b8472ba74ccf339e64c2275b3b1558bee4d43f87d13bb8ddf15bcfc?se=2023-03-20T07%3A25%3A00Z&sig=u1wv%
######################################################################## 100.0%
==> Fetching openjdk
==> Downloading https://ghcr.io/v2/homebrew/core/openjdk/manifests/19.0.2
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/openjdk/blobs/sha256:f0d33cdc95ee66471146865dd98092c92b0ef97598fe1ea57d4cb31f859851b5
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:f0d33cdc95ee66471146865dd98092c92b0ef97598fe1ea57d4cb31f859851b5?se=2023-03-20T07%3A25%3A00Z&sig=aKO6b
######################################################################## 100.0%
==> Installing dependencies for openjdk: giflib, libpng, freetype, fontconfig, pcre2, glib, xorgproto, libxau, libxdmcp, libxcb, libx11, libxext, libxrender, lzo, pixman, cairo, graphite2, icu4c, harfbuzz, jpeg-turbo, lz4, zstd, libtiff, and little-cms2
==> Installing openjdk dependency: giflib
==> Pouring giflib--5.2.1.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/giflib/5.2.1: 19 files, 540.7KB
==> Installing openjdk dependency: libpng
==> Pouring libpng--1.6.39.arm64_monterey.bottle.1.tar.gz
🍺  /opt/homebrew/Cellar/libpng/1.6.39: 27 files, 1.3MB
==> Installing openjdk dependency: freetype
==> Pouring freetype--2.13.0_1.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/freetype/2.13.0_1: 67 files, 2.4MB
==> Installing openjdk dependency: fontconfig
==> Pouring fontconfig--2.14.2.arm64_monterey.bottle.tar.gz
==> Regenerating font cache, this may take a while
==> /opt/homebrew/Cellar/fontconfig/2.14.2/bin/fc-cache -frv
🍺  /opt/homebrew/Cellar/fontconfig/2.14.2: 88 files, 2.4MB
==> Installing openjdk dependency: pcre2
==> Pouring pcre2--10.42.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/pcre2/10.42: 230 files, 6.2MB
==> Installing openjdk dependency: glib
==> Pouring glib--2.76.0.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/glib/2.76.0: 455 files, 22.2MB
==> Installing openjdk dependency: xorgproto
==> Pouring xorgproto--2022.2.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/xorgproto/2022.2: 268 files, 3.9MB
==> Installing openjdk dependency: libxau
==> Pouring libxau--1.0.11.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libxau/1.0.11: 21 files, 123.5KB
==> Installing openjdk dependency: libxdmcp
==> Pouring libxdmcp--1.1.4.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libxdmcp/1.1.4: 11 files, 130.4KB
==> Installing openjdk dependency: libxcb
==> Pouring libxcb--1.15_1.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libxcb/1.15_1: 2,461 files, 7.3MB
==> Installing openjdk dependency: libx11
==> Pouring libx11--1.8.4.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libx11/1.8.4: 1,054 files, 7MB
==> Installing openjdk dependency: libxext
==> Pouring libxext--1.3.5.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libxext/1.3.5: 87 files, 445.8KB
==> Installing openjdk dependency: libxrender
==> Pouring libxrender--0.9.11.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libxrender/0.9.11: 12 files, 213.9KB
==> Installing openjdk dependency: lzo
==> Pouring lzo--2.10.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/lzo/2.10: 31 files, 565.6KB
==> Installing openjdk dependency: pixman
==> Pouring pixman--0.42.2.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/pixman/0.42.2: 11 files, 842.5KB
==> Installing openjdk dependency: cairo
==> Pouring cairo--1.16.0_5.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/cairo/1.16.0_5: 126 files, 6.4MB
==> Installing openjdk dependency: graphite2
==> Pouring graphite2--1.3.14.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/graphite2/1.3.14: 18 files, 280.6KB
==> Installing openjdk dependency: icu4c
==> Pouring icu4c--72.1.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/icu4c/72.1: 263 files, 78.4MB
==> Installing openjdk dependency: harfbuzz
==> Pouring harfbuzz--7.1.0.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/harfbuzz/7.1.0: 76 files, 8.8MB
==> Installing openjdk dependency: jpeg-turbo
==> Pouring jpeg-turbo--2.1.5.1.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/jpeg-turbo/2.1.5.1: 44 files, 2.5MB
==> Installing openjdk dependency: lz4
==> Pouring lz4--1.9.4.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/lz4/1.9.4: 22 files, 681.5KB
==> Installing openjdk dependency: zstd
==> Pouring zstd--1.5.4.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/zstd/1.5.4: 31 files, 2.3MB
==> Installing openjdk dependency: libtiff
==> Pouring libtiff--4.4.0_1.arm64_monterey.bottle.1.tar.gz
🍺  /opt/homebrew/Cellar/libtiff/4.4.0_1: 249 files, 4.8MB
==> Installing openjdk dependency: little-cms2
==> Pouring little-cms2--2.14.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/little-cms2/2.14: 21 files, 1.4MB
==> Installing openjdk
==> Pouring openjdk--19.0.2.arm64_monterey.bottle.tar.gz
==> Caveats
For the system Java wrappers to find this JDK, symlink it with
  sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

openjdk is keg-only, which means it was not symlinked into /opt/homebrew,
because macOS provides similar software and installing this software in
parallel can cause all kinds of trouble.

If you need to have openjdk first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc

For compilers to find openjdk you may need to set:
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

==> Summary
🍺  /opt/homebrew/Cellar/openjdk/19.0.2: 637 files, 320.0MB
==> Running `brew cleanup openjdk`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
==> `brew cleanup` has not been run in the last 30 days, running now...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/berkeley-db--18.1.40_1... (2.3MB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/cscope--15.9... (182.8KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/gdbm--1.23... (269.2KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/libyaml--0.2.5... (108.4KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/lua--5.4.4_1... (257.4KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/mpdecimal--2.5.1... (540.7KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/sqlite--3.41.0... (2MB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/vim--9.0.1350... (12.7MB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/vim--9.0.0350_1... (12.6MB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/ruby_bottle_manifest--3.1.2_1... (13.5KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/sqlite_bottle_manifest--3.39.3... (6.9KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/berkeley-db_bottle_manifest--18.1.40_1... (7.2KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/macvim_bottle_manifest--9.0.472... (19.0KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/gdbm_bottle_manifest--1.23... (6.1KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/openssl@1.1_bottle_manifest--1.1.1q... (7.6KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/lua_bottle_manifest--5.4.4_1... (6.6KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/vim_bottle_manifest--9.0.0350_1... (26.8KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/libyaml_bottle_manifest--0.2.5... (7.5KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/ca-certificates_bottle_manifest--2022-07-19_1... (1.8KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/xz_bottle_manifest--5.2.6... (6.4KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/perl_bottle_manifest--5.34.0_1... (16.4KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/mpdecimal_bottle_manifest--2.5.1... (6.9KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/ncurses_bottle_manifest--6.3... (9KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/gettext_bottle_manifest--0.21... (10.5KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/python@3.10_bottle_manifest--3.10.6_2... (19.2KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/readline_bottle_manifest--8.1.2... (6.6KB)
Removing: /Users/asakunotomohiro/Library/Caches/Homebrew/cscope_bottle_manifest--15.9... (8.1KB)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/vim... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/ncurses... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/gdbm... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/mpdecimal... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/cscope... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/libyaml... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/perl... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/readline... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/sqlite... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/xz... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/lua... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/macvim... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/ca-certificates... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/gettext... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/openssl@1.1... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/python@3.10... (2 files, 2.5KB)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/ruby... (64B)
Removing: /Users/asakunotomohiro/Library/Logs/Homebrew/berkeley-db... (64B)
Pruned 2 symbolic links and 19 directories from /opt/homebrew
==> Caveats
==> openjdk
For the system Java wrappers to find this JDK, symlink it with
  sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

openjdk is keg-only, which means it was not symlinked into /opt/homebrew,
because macOS provides similar software and installing this software in
parallel can cause all kinds of trouble.

If you need to have openjdk first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc

For compilers to find openjdk you may need to set:
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

$
$ sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
Password: ログインパスワードの入力
Sorry, try again.
Password:
$
$ java --version
openjdk 19.0.2 2023-01-17
OpenJDK Runtime Environment Homebrew (build 19.0.2)
OpenJDK 64-Bit Server VM Homebrew (build 19.0.2, mixed mode, sharing)
$ javac --version
javac 19.0.2
$
```

</details>

sudoでのリンク張り替えが必須になる。  
`sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk`  
※このコマンドは、インストール後に表示されるはず。  

[目次に戻る](#tableOfContents)  


<a name="productionruby"></a>
### Ruby環境構築
`brew install rbenv ruby-build`  

[目次に戻る](#tableOfContents)  


<a name="productionperl"></a>
### Perl環境構築
`curl -kL http://install.perlbrew.pl | bash`  

* インストール可能一覧表示コマンド  
  `perlbrew available`  

* 実際のインストール：`perlbrew install perl-5.36.0`  

* インストール済み確認：`perlbrew list`  

* バージョン切り替え：`perlbrew switch 5.36.0`  


* todo: 後日解説。  
  **~/.pl**  

</details>

[目次に戻る](#tableOfContents)  


<a name="configfilebash"></a>
### bash用環境ファイル
HOMEディレクトリ直下に配置するのが基本になる。  
※Homebrewを使ったbashインストールは不可？  

<details><summary>環境構築。</summary>

最新？  
<https://ftp.gnu.org/gnu/bash/>  
**bash-5.1.tar.gz	2020-12-06 15:44	10M**  
パッチ：`curl 'https://ftp.gnu.org/gnu/bash/bash-5.1-patches/bash50-[001-016]' | patch -p0`  
次のコマンド：`./configure`  
次のコマンド：`make`  
次のコマンド：`sudo make install`  
**/usr/local/bin**にインストールされる。  
既存のbashは、**/bin/bash**にある。  
インストール後のバージョン確認コマンド：`/usr/local/bin/bash --version`  
ログインシェルやデフォルトシェルをzshからbashに切り替える必要はあるが、割愛(今後zshを使う)。  

</details>

2021/04/01：Mac用・Android用新規登録。  

※ **シェル** ：zshとの共通ファイルを読み込む。  

[目次に戻る](#tableOfContents)  


<a name="configfilezsh"></a>
### zsh用環境ファイル
HOMEディレクトリ直下に配置するのが基本になる。  
※bashと違い、Homebrewを使ったインストール可？  
そもそもbrewコマンドを使わない場合のインストールは手順が面倒なので、Homebrewからインストール実施。  

2021/04/01：Mac用新規登録。  

<details><summary>環境調整メモ。</summary>

Bashの挙動に寄せる。  
`unsetopt nomatch`  

ディレクトリ名だけでそのディレクトリに移動する設定。  
~~`setopt autocd`~~  
この辺りは面倒で**cd**コマンドを使って移動したほうがいい。  

Ctrl+Dでのターミナル終了無効化。  
`setopt ignore_eof`  

</details>

<details><summary>環境構築。</summary>

ソフトウェアの導入：`brew install zsh`  

</details>

※ **シェル** ：bashとの共通ファイルを読み込む。  

[目次に戻る](#tableOfContents)  


<a name="androidosoperation"></a>
### AndroidOS向け作業。
携帯電話でGit操作などをする前の準備が結構な難易度の高さになっており、導入に躊躇してしまう。  

[F-Droid](https://f-droid.org/)
を導入する必要がある。  
これは、GooglePlay以外からアプリケーションをインストールするためのAndroidOS向けソフトウェア用の胴元になる。  
もしかしたらAndroid以外のソフトウェアもインストールできるかもしれない。  
そして、GooglePlay以外からの導入は、審査が無いため、完全自己責任になっており、あらぬ事故に巻き込まれる可能性が高くなる。  
今回導入するのは、ターミナルである[Termux](https://f-droid.org/packages/com.termux/)というアプリ。  

インストール後、ディレクトリなどを利用するために、`termux-setup-storage`を打ち込む必要がある(ソフトウェア上で)。  
そうすることで、ホームディレクトリから外部のSDカードやダウンロードディレクトリなどを操作できる。  
しかし、ソフトウェアやターミナル本体のアップデート後に実施しなければ元の木阿弥になるため、実行の見計らいは考えること。  

<details><summary>インストール履歴メモ。</summary>

以下、私の作業記録。
```terminal
apt update
pkg install root-repo
pkg install x11-repo
apt update
pkg install git
pkg install vim
apt upgrade
termux-setup-storage
```
インストールしたいソフトウェアは、[別途](./makeLinkfileAndroid.sh)記載している。  
最後のコマンドは、DroidVimにも備わっており、メニューにある**MANAGE_EXTERNAL_STORAGES**と言う文字列が相当する。
しかし、今確認したらそのボタンがない(どういうこと？)。  

最後のコマンドは、microSDカードへのディレクトリに紐付ける。  
そして、そのコマンド実行は1回で十分機能する。
```text
It appears that directory '~/storage' already exists.
This script is going to rebuild its structure from
scratch, wiping all dangling files. The actual storage
content IS NOT going to be deleted.
```
当然2回目以降も実行する場合は、削除後に作り直すとのことで、警告(?)が出る。  
止めておけ。  

</details>

[目次に戻る](#tableOfContents)  


<a name="onetaroperation"></a>
## 一太郎
バックアップファイルを作成するように設定してあるが、 ~~ゴミ~~ バックアップファイルがカレントディレクトリに生成される。  
気持ち悪いので、無効化しているが、指定した場所に保存しない。  

※バックアップファイルの作成場所は、[makeLinkfile](#imitationmakefile)を実行したときに作成される、vimのバックアップファイルと同じディレクトリ(そこの専用ディレクトリ配下に作成していく)。  
`~/.vim_backup/Taro/`  

AutoHotKeyの設定にて、一太郎を起動する設定キーあり。  

2021/04/01：新規登録。  

[目次に戻る](#tableOfContents)  


<a name="atokperation"></a>
## ATOK
Windows版は設定をバックアップできるが、Mac版はできない。  
Mac版の買い切り版が無いため、今後IMEの乗り換えを検討する。  

2021/04/01：新規登録(Windows用)。  

[目次に戻る](#tableOfContents)  


<a name="memotextperation"></a>
## メモ\_YYYYMMDD(テキストファイル)
メモをとるためのひな形  

2021/02/14：新規登録。  

[目次に戻る](#tableOfContents)  


<a name="memoexcelperation"></a>
## メモ\_YYYYMMDD(Excelファイル)
WindowsOSでの作業準備ファイル。  
作業を残すためのひな形でもある。  

2021/04/01：新規登録。  

[目次に戻る](#tableOfContents)  


<a name="mouseperation"></a>
## マウス設定(M-DUX70BK).xml
ゲーム用にボタン設定をしている。  
しかし、無茶苦茶でかいマウスなため、お蔵入り。  

2021/02/15：新規登録。  

[目次に戻る](#tableOfContents)  







































<a name="fromnowonperation"></a>
## 今後の課題
~~今は、簡易的なメモ取りとしてMarkdownを使っているが、将来的には、sphinxでメモを取れるようになりたい~~。  
今そんなことをしている場合ではない。  

今後は、普通にちまちまコミットしていくことにする。  
気がつけば編集した量が膨大になり、見直しに時間が掛かってしまう。  
編集した段階でコミットするように心がける。  

[目次に戻る](#tableOfContents)  


<a name="licenseperation"></a>
## ライセンス
GPL-ver2  

改造を含む利用可能なソースコードと同一条件でのライセンス  
そもそも隠す物ではないはず。  

[目次に戻る](#tableOfContents)  


以上。
