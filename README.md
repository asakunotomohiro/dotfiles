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
  * [brewのインストール](#homebrewperation)  
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
    * [MacOS向け作業](#macosoperation)  
  * 主にWindows向け  
    * [一太郎](#onetaroperation)  
    * [ATOK](#atokperation)  
    * [メモ(テキストファイル)](#memotextperation)  
    * [メモ(Excelファイル)](#memoexcelperation)  
    * [マウス設定(M-DUX70BK)](#mouseperation)  
  * [今後の課題](#fromnowonperation)  
  * [ライセンス](#licenseperation)  

<a name="homebrewperation"></a>
### Homebrew
<https://brew.sh>  

<details><summary>インストール方法について。</summary>

以下、実際のインストール作業記録。
```terminal
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"	←☆インストール。
==> Checking for `sudo` access (which may request your password)...
Password:
Sorry, try again.
Password:
==> This script will install:
/opt/homebrew/bin/brew



HEAD is now at 7a14ae618 Merge pull request #13876 from Homebrew/sponsors-maintainers-man-completions
==> Tapping homebrew/core
remote: Enumerating objects: 1270600, done.
remote: Counting objects: 100% (30/30), done.
remote: Compressing objects: 100% (21/21), done.
remote: Total 1270600 (delta 16), reused 20 (delta 9), pack-reused 1270570
Receiving objects: 100% (1270600/1270600), 513.50 MiB | 23.28 MiB/s, done.
Resolving deltas: 100% (876215/876215), done.
From https://github.com/Homebrew/homebrew-core
 * [new branch]              master     -> origin/master
HEAD is now at 796afdb1481 flix: update 0.31.0 bottle.
Warning: /opt/homebrew/bin is not in your PATH.
  Instructions on how to configure your shell for Homebrew
  can be found in the 'Next steps' section below.
==> Installation successful!

==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
Read the analytics documentation (and how to opt-out) here:
  https://docs.brew.sh/Analytics
No analytics data has been sent yet (nor will any be during this install run).

==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
  https://github.com/Homebrew/brew#donations

==> Next steps:
- Run these two commands in your terminal to add Homebrew to your PATH:
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/asakunotomohiro/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh

$
```

</details>

<a name="gitperation"></a>
### Git
バージョン管理として用いる(できる限り最新版を使うように心がけている)。  
vimエディタで必要なプラグインを取得するのに必要。  
また、[AndroidOS](#androidosoperation)のDroidVimソフトウェアは、OSのバージョンが古い場合、Git導入が出来ない。  

[gitforwindows.org/](https://gitforwindows.org/)  
[git-scm.com/book/ja/v2](https://git-scm.com/book/ja/v2)  
[mkhrussell.github.io/blog/configure-git-on-macos-for-development-work/](https://mkhrussell.github.io/blog/configure-git-on-macos-for-development-work/)  

Windowsでは、取得(Clone)時に改行が勝手に切り替えられる。  
そのため、抑止コマンドでの制御が必要になる。  
`git config --global core.autocrlf false`  
設定の確認コマンド：`git config --global --get core.autocrlf`  
※**true**の場合は、自動変換が有効化されている。  
別の方法に`git config --global core.autocrlf input`がある(これは何？)。  

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

* Gti技術で困ったときに見る。  
  * [フリープログラミングブックス(目次)](https://github.com/EbookFoundation/free-programming-books/blob/master/books/free-programming-books-ja.md#git)  
  * [サル先生のGit入門](https://backlog.com/ja/git-tutorial/reference/)  
  * [デザイナのための Git(pull 時のトラブル)](https://github.com/hatena/Git-for-Designers#pull-%E6%99%82%E3%81%AE%E3%83%88%E3%83%A9%E3%83%96%E3%83%AB)  
  * [Markdownファイル-相対リンク](https://github.com/tiimgreen/github-cheat-sheet/blob/master/README.ja.md#%E7%9B%B8%E5%AF%BE%E3%83%AA%E3%83%B3%E3%82%AF)  
  * [すべての開発者へ。すごいGitHubリポジトリ10選](https://qiita.com/baby-degu/items/6c0c73a1e79644ebbb1a?utm_source=Qiita%E3%83%8B%E3%83%A5%E3%83%BC%E3%82%B9&utm_campaign=bf629460cb-Qiita_newsletter_464_06_02_2021&utm_medium=email&utm_term=0_e44feaa081-bf629460cb-33090553)  

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

[あんちょこ](https://gihyo.jp/assets/files/magazine/SD/2015/201510/download/Furoku_CheatSheet_Vim.pdf)  

<details><summary>インストール方法について。</summary>

[目次に戻る](#tableOfContents)  

#### Vim環境構築
※Mac端末への構築。  

[Macvim](https://macvim.org)のほうがいい？  
事前に、既存のvimをbrew管理から削除する必要がある：`brew unlink vim`  
~~古いので止めた方が良いようだ。~~  
しかし、今見返したら**Vim 9.0.0065**とのこと・・・新しい(古くもあるけど・・・)。  
そして、香り屋さんのvimより新しいという・・・どういう風の吹き回しか。  

~~`brew install vim`~~  
`brew install macvim`  
導入前：**VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Dec 17 2021 18:32:29)**  
導入後：**VIM - Vi IMproved 9.0 (2022 Jun 28, compiled Feb 07 2023 11:35:56)**  
アップデートしただけだったようだが、何も変わらず。  
**Running `brew update --auto-update`...**  

インストール後のリンク付け：`ln -s $(brew --prefix macvim)/MacVim.app /Applications`  

2種類インストールされている場合競合する。  
そのため、どちらかを消した方が吉。  
`brew uninstall vim`  

以下、実際のインストール作業記録。
```terminal
$ brew unlink vim	←☆既存のvimを切り離す(後日分かったが、uninstallしなければ、他のソフトウェアアップデート時にもエラーが発生する)。
Unlinking /opt/homebrew/Cellar/vim/9.0.0350_1... 187 symlinks removed.
$ brew install macvim	←☆インストール。
Running `brew update --auto-update`...
==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
  https://github.com/Homebrew/brew#donations

==> Auto-updated Homebrew!
Updated 1 tap (homebrew/core).
==> New Formulae
camlp-streams              gdrive-downloader          llvm@14                    quilt-installer            toml-test
fuego-firestore            got                        opencl-icd-loader          scala@2.13

==> Downloading https://ghcr.io/v2/homebrew/core/cscope/manifests/15.9
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/cscope/blobs/sha256:b85e2ad5e9ddcdb57a2cca430520e64f70cefd2b182bae70c216360e72757611
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:b85e2ad5e9ddcdb57a2cca430520e64f70cefd2b182bae70
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/macvim/manifests/9.0.472
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/macvim/blobs/sha256:4cafa590c301a6faac579c80051f6a1d42aceaaf696543efd5c7534a7264b51c
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:4cafa590c301a6faac579c80051f6a1d42aceaaf696543ef
######################################################################## 100.0%
==> Installing dependencies for macvim: cscope
==> Installing macvim dependency: cscope
==> Pouring cscope--15.9.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/cscope/15.9: 11 files, 749.5KB
==> Installing macvim
==> Pouring macvim--9.0.472.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/macvim/9.0.472: 2,405 files, 47.5MB
==> Running `brew cleanup macvim`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
$ ln -s $(brew --prefix macvim)/MacVim.app /Applications	←☆リンク貼り付け。
$
  [復元日時2022/09/21 23:16:51]
Last login: Wed Sep 21 22:55:13 on console
Restored session: 2022年 9月21日 水曜日 22時49分35秒 JST
$
```

[ソースコード](https://github.com/macvim-dev/macvim)からインストールも可能なようだ。  

何にせよ、インストールなどに悩むのならば、[Vimのユーザーと開発者を結ぶコミュニティ](https://vim-jp.org/docs/chat.html)にて、相談するのがいいかもしれない。  

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
Macでは、LFの改行コードで無ければ動かない。  
※MacVim-KaoriYa版は古い。  

2021/02/12：vimrc新規登録。  
2021/02/13：gvimrc新規登録。  

* 技術で困ったときに見る。  
  [Vim スクリプト](https://github.com/EbookFoundation/free-programming-books/blob/master/books/free-programming-books-ja.md#vim)  


##### 内容
バックアップファイルは、OS問わず、ホームディレクトリ直下の**%USERPROFILE%\.vim\_backup**ディレクトリを使うようにしている。  
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
一番の困りごとは、日本語入力時の文節区切りが判別できないこと(色の変更ができず、目視できない。最悪だ)。  
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

<details><summary>インストール方法について(複数バージョン管理用)。</summary>

環境管理ソフトウェアの導入：`brew install --HEAD goenv`  

* 以下、上記のgoenvを前提に構築する。  
  * Homebrew更新。  
    `brew update`  

  * 個別ソフトウェアの更新。  
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

<details><summary>インストール方法について(単発用)。</summary>

インストールコマンド：`brew install go`  
この後、環境変数を設定する必要がある。  
`export PATH=~/go/bin:$PATH`  
※すでにzshrcに設定済み。  

バージョン確認：`go version`  

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
ちょっと使いにくく、数日使って利用を諦めてしまった・・・使いこなせないだけだろうが、他にエディタはあるからな。  

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


<a name="vscodeperation_settingfile"></a>
#### VSCodeの設定ファイル。
Visual Studio Codeのバックアップファイル(Windows用？)。  

* 格納ファイル。  
  ※以下の他に、ワークスペースの`settings.json`と`workspace.code-workspace`の2種類のファイルなどが必要になるが、プロジェクトごとに作成されるため、今回のdotfilesの管理対象外になる。  
  [C:\Users\asakunotomohiro\AppData\Roaming\Code\User\settings.json]()  
  [C:\Users\asakunotomohiro.vscode\extensions]()  
  extensionsディレクトリは、20MB近くある。  

本体インストール後に、日本語化を提案されるため、導入する。  

2021/07/01：新規登録。  

</details>


<a name="eclipseperation"></a>
### Eclipse
Javaは、vimエディタでの操作は厳しい。  
vimプラグインの[vim-lsp](https://github.com/prabirshrestha/vim-lsp)・[vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)の組み合わせでは、Eclipseの補完にはかなわないそうだ。  
むしろ、通常のエディタ機能ではJavaに特化したIDEに軍配が上がるそうだ。  
> Javaの既存IDEは、ヒューリスティックな（それこそsystみたいな）やつにも結構長い年月を経た結果対応しているところがあって、LSPでどこまで対応してくれるかわかんないっすね...  

フォーマッタがあるため、ちょっと触ってみた。  
保存時にフォーマッタを動かすようにしたため、非常に煩わしい挙動をすると思う(本当にそう思った場合は取りやめる)。  
Perlの構文色付けにどぎつい色が標準色になっているのはどうにかならないのかな(淡い色にした場合、それはそれで文字が見えない)。  

Gitの無視リソースは既存のファイルを読み込めないのか？  

[目次に戻る](#tableOfContents)  

<a name="eclipseperation_settingfile"></a>
#### Eclipseの設定ファイル。
ファイル名：eclipse設定ファイル.epf  

設定の取り込みは、設定画面から行う。  

2023/04/15：新規登録。  


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

* 配置場所。  
  * AutoHotKey：ドキュメントディレクトリ・スタートアップに配置する。  
  * ~~alias.bat~~：ドキュメントディレクトリに配置する(現在中止)。  
    プロンプト表記などを変更している。  
  * profile.ps1：Windows限定として、PowerShellのプロンプト表記を変更する。  
    ※System32ディレクトリ配下に配置するため、管理者権限必須。  
  * [g]vimrc：HOMEディレクトリに配置する。  
  * \_gitignore\_global(以下、シンボリックファイルとして利用する)  
    * ~~gitignore\_global.txt：ドキュメントディレクトリに配置する(Sourcetree専用？)~~。  
    * ~~hgignore\_global.txt：ドキュメントディレクトリに配置する(Sourcetree専用？)~~。  
    * ignore：**~/.config/git/ignore**(すべてのgitアカウント用)。  

※Windowsのコマンドプロンプトからbashを起動した場合読み込まず、**Bash on Ubuntu on Windows**でも、読み込まない。
唯一**Ubuntu(Windowsの話)**で読み込んだ(配布方法を忘れた)。  
ディレクトリに移動して、シェルを叩けば配置される？  

Windows向けの**makeLinkfile.ps1**を実行する場合、レジストリを変更するため、気をつけること。  
※CapsLockキーをCtrlキーに変更する処理も入っている。  

2021/02/13：新規登録(Windows用)。  
2021/04/01：新規登録(Mac用・Android用)。  

※環境を削除するにはファイル名先頭がunで始まるあと同名のファイル名を実行すること。  

<details><summary>DroidVimには配布できないようだ。</summary>

無理矢理
`ln -sf /storage/emulated/0/ ~/shared_droidvim`
を実行して無理矢理シェルを叩きに行ったところで、**vimrc** を **$HOME** に配置できない。  
何より、権限が**root**になっており、閲覧できない。  
そして、`chown -hR [whoami] .`での権限変更も受け付けてくれない。  
完全に。

</details>


## TERATERM.INI
テラタームの設定ファイル。  

2021/04/01：新規登録。  


## AutoHotkey
通称AHKと言われるWindows専用のキーボードショートカットツール。  
しかし、任意のソフトウェアを起動する場合、フルPathをべた書きする必要があり、他環境では変更を要求される。  
また、Windows98/Meは動作保証外。  
※ユニコード版に移行済み。  

スタートアップに配置する(ドキュメント配下にもある)。  
また、GVIMエディタから**Win+Alt+r**にて、再読み込みを行うようにしているため、他のエディタで使うのは勧めない。  

2021/02/12：新規登録。  
  exe：v1.1.33.2 Unicode 64-bi  

* 今後の予定：
  * 起動時間が長い場合、ショートカットファイルをデスクトップに置くことで起動時間は短縮できる。  
    いつでもどこでも起動させるようにしたい。  
    ※起動に時間が掛かり、それを中断させる場合はスクリプトのリロードで処理が停止する。  
  * ~~AutoHotKeyを無視するウィンドウ(ソフトウェア)が存在するため、それを回避してAutoHotKeyを優先させたい(具体的には、WindowsOSが用意しているソフトウェア一部)~~。  
    タスクマネージャがアクティブになっているときも有効にしたかったが、できないようだ(勝手に外部のソフトウェアが動かせたら問題あるかららしい)。  


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

* Path  
  * **C:\Program Files\～～～**  
  * **C:\Program Files (x86)\～～～**  

※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。  


#### AutoHotKey-Eclipse個別対応

* 個別対応  
  * Ctrl+g	：Grep検索ウィンドウ表示  
  * Ctrl+j	：指定行移動  

</details>

[目次に戻る](#tableOfContents)  


#### ホットキー(ソフトウェア内での挙動)
こちらも通常のショートカットキーを潰している可能性がある。  

* 個別対応  
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
    * Homebrew本体の更新：`brew update`  
    * Homebrew本体から一時的に切り離す：`brew unlink パッケージ名`  
    * 切り離しから戻す(再接続の)場合：`brew link パッケージ名`  
    * Homebrewでのパッケージをアップグレード：`brew upgrade [パッケージ名]`  
    * Homebrewでのパッケージを削除：`brew uninstall [パッケージ名]`  


* シェルの起動種類(Mac用)  
  ※以下、番号順に起動する。  
  * ログイン/ログアウト  
    通常は使わない方がいい(利用可能なのが他にある)。  
    1.**~/.zshenv**  
    2.**/etc/zprofile**  
  * インタラクティブシェル(作業者との対話型)  
    **/etc**配下のファイルは触らないこと。  
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

  * Pythonインストールコマンド例）  
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

インストール：
`brew install java`  
※アップデートを先にした方がいい。  

<details><summary>実際のインストール作業。</summary>

```terminal
$ java --version	←☆実行環境がない。
The operation couldn’t be completed. Unable to locate a Java Runtime.
Please visit http://www.java.com for information on installing Java.

$ javac --version	←☆コンパイル環境がない。
The operation couldn’t be completed. Unable to locate a Java Runtime.
Please visit http://www.java.com for information on installing Java.

$
$ sw_vers	←☆mac端末のバージョン確認。
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
　　　・
　　　・
　　　・
==> Downloading https://ghcr.io/v2/homebrew/core/openjdk/blobs/sha256:f0d33cdc95ee66471146865dd98092c92b0ef97598fe1ea57d4cb31f859851b5
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sha256:f0d33cdc95ee66471146865dd98092c92b0ef97598fe1ea57d4cb31f859851b5?se=2023-03-20T07%3A25%3A00Z&sig=aKO6b
######################################################################## 100.0%
==> Installing dependencies for openjdk: giflib, libpng, freetype, fontconfig, pcre2, glib, xorgproto, libxau, libxdmcp, libxcb, libx11, libxext, libxrender, lzo, pixman, cairo, graphite2, icu4c, harfbuzz, jpeg-turbo, lz4, zstd, libtiff, and little-cms2
==> Installing openjdk dependency: giflib
==> Pouring giflib--5.2.1.arm64_monterey.bottle.tar.gz
🍺  /opt/homebrew/Cellar/giflib/5.2.1: 19 files, 540.7KB
　　　・
　　　・
　　　・
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
　　　・
　　　・
　　　・
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
※手動で実施する必要があるため、忘れないこと。  

[目次に戻る](#tableOfContents)  


<a name="productionruby"></a>
### Ruby環境構築
`brew install rbenv ruby-build`  

[目次に戻る](#tableOfContents)  


<a name="productionperl"></a>
### Perl環境構築
詳しくは、[Perl用に勉強した環境構築ファイル](https://github.com/asakunotomohiro/asakunotomohiro/blob/study2programming/Perl言語/環境構築(インストール).md)を参照するのがいいだろう。  

* 備忘録  
  * [本体のインストールコマンド](https://perlbrew.pl/)  
    `\curl -L https://install.perlbrew.pl | bash`  
    ※Perlのバージョン管理ツールは、Perl本体が事前に入っていることで動く。  
  * インストール可能一覧表示コマンド  
    `perlbrew available`  
  * 実際のインストール：例）`perlbrew install perl-5.36.0`  
  * インストール済み確認：`perlbrew list`  
  * バージョン切り替え：例）`perlbrew switch 5.36.0`  


TODO: 後日解説。  
  **~/.pl**  

</details>

[目次に戻る](#tableOfContents)  


<a name="configfilebash"></a>
### bash用環境ファイル
HOMEディレクトリ直下に配置するのが基本になる。  
※Homebrewを使ったbashインストールは不可？  
個人端末ならば、homebrewからのインストールも問題ないようだ(問題なのは、大規模なデプロイメントらしい)。  
homebrewは、個人ユーザ向けに開発されているのが原因らしい。  

<details><summary>環境構築。</summary>

* 手順  
  <https://ftp.gnu.org/gnu/bash/>  
  **bash-5.1.tar.gz	2020-12-06 15:44	10M**  
  1. パッチ取得：<https://ftp.gnu.org/gnu/bash/bash-5.1-patches>  
     * ※現時点の最新版：**bash51-016	2022-01-04 16:48	2.1K**  
  1. パッチ適用コマンド：`curl 'https://ftp.gnu.org/gnu/bash/bash-5.1-patches/bash50-[001-016]' | patch -p0`  
  1. コマンド実行：`./configure`  
     エラーを確認する(問題なければ次のコマンドを実行)。  
  1. コマンド実行：[`make`](#configfilebash_makerunonmac)  
     環境構築。  
  1. コマンド実行：`sudo make install`  
     * **/usr/local/bin**にインストールされる。  
     * 既存のbashは、[**/bin/bash**](#configfilebash_bashversiononmac)にある。  
  1. インストール後のバージョン確認コマンド：`/usr/local/bin/bash --version`  
  1. ログインシェルやデフォルトシェルをzshからbashに切り替える必要はあるが、割愛(今後zshを使う)。  

<a name="configfilebash_makerunonmac"></a>
以下、makeコマンド実行記録。
```terminal
$ make
rm -f mksyntax
gcc -DPROGRAM='"bash"' -DCONF_HOSTTYPE='"aarch64"' -DCONF_OSTYPE='"darwin21.6.0"' -DCONF_MACHTYPE='"aarch64-apple-darwin21.6.0"' -DCONF_VENDOR='"apple"' -DLOCALEDIR='"/usr/local/share/locale"' -DPACKAGE='"bash"' -DSHELL -DHAVE_CONFIG_H -DMACOSX   -I.  -I. -I./include -I./lib -I./lib/intl -I/Users/asakunotomohiro/Downloads/bash-5.1/lib/intl  -g -O2 -Wno-parentheses -Wno-format-security    -g -O2 -Wno-parentheses -Wno-format-security    -g -O2 -Wno-parentheses -Wno-format-security  -o mksyntax ./mksyntax.c 
rm -f syntax.c
./mksyntax -o syntax.c
/bin/sh ./support/mkversion.sh -b -S . -s release -d 5.1 -o newversion.h \
        && mv newversion.h version.h
gcc -DPROGRAM='"bash"' -DCONF_HOSTTYPE='"aarch64"' -DCONF_OSTYPE='"darwin21.6.0"' -DCONF_MACHTYPE='"aarch64-apple-darwin21.6.0"' -DCONF_VENDOR='"apple"' -DLOCALEDIR='"/usr/local/share/locale"' -DPACKAGE='"bash"' -DSHELL -DHAVE_CONFIG_H -DMACOSX   -I.  -I. -I./include -I./lib -I./lib/intl -I/Users/asakunotomohiro/Downloads/bash-5.1/lib/intl  -g -O2 -Wno-parentheses -Wno-format-security  -DBUILDTOOL -c -o buildversion.o ./version.c
gcc -DPROGRAM='"bash"' -DCONF_HOSTTYPE='"aarch64"' -DCONF_OSTYPE='"darwin21.6.0"' -DCONF_MACHTYPE='"aarch64-apple-darwin21.6.0"' -DCONF_VENDOR='"apple"' -DLOCALEDIR='"/usr/local/share/locale"' -DPACKAGE='"bash"' -DSHELL -DHAVE_CONFIG_H -DMACOSX   -I.  -I. -I./include -I./lib -I./lib/intl -I/Users/asakunotomohiro/Downloads/bash-5.1/lib/intl  -g -O2 -Wno-parentheses -Wno-format-security    -g -O2 -Wno-parentheses -Wno-format-security    -g -O2 -Wno-parentheses -Wno-format-security  -o bashversion ./support/bashversion.c buildversion.o

      ***********************************************************
      *                                                         *
      * GNU bash, version 5.1.0(1)-release (aarch64-apple-darwin21.6.0)
      *                                                         *
      ***********************************************************

making lib/intl/libintl.a in ./lib/intl
            ・
            ・
            ・
gcc -c   -I. -I../.. -I../.. -I../../lib -I../../include -I. -I../../lib/intl -I/Users/asakunotomohiro/Downloads/bash-5.1/lib/intl -DHAVE_CONFIG_H -DSHELL -DMACOSX  -g -O2 -Wno-parentheses -Wno-format-security   random.c
random.c:93:8: warning: cast to smaller integer type 'unsigned int' from 'void (*)(void)' [-Wpointer-to-int-cast]
  iv = (u_bits32_t)seedrand;            /* let the compiler truncate */
       ^~~~~~~~~~~~~~~~~~~~
1 warning generated.
$
```

<a name="configfilebash_bashversiononmac"></a>
以下、本来のMacに搭載しているbashバージョン
```terminal
$ bash --version
GNU bash, version 3.2.57(1)-release (arm64-apple-darwin21)
Copyright (C) 2007 Free Software Foundation, Inc.
$
```

<a name="configfilebash_bashversionOninstall"></a>
以下、今回インストールしたバージョン確認。
```terminal
$ /usr/local/bin/bash --version
GNU bash, バージョン 5.1.0(1)-release (aarch64-apple-darwin21.6.0)
Copyright (C) 2020 Free Software Foundation, Inc.
ライセンス GPLv3+: GNU GPL バージョン 3 またはそれ以降 <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
$
```

</details>

2021/04/01：Mac用・Android用新規登録。  

※ **シェル** ：zshとの共通ファイルを読み込む。  

[目次に戻る](#tableOfContents)  


<a name="configfilezsh"></a>
### zsh用環境ファイル
HOMEディレクトリ直下に配置するのが基本になる。  
※bashと違い、Homebrewを使ったインストール可？  
そもそもbrewコマンドを使わない場合のインストールは手順が面倒なので、Homebrewからインストール実施。  
Macでは、LFの改行コードで無ければ動かない。  

2021/04/01：Mac用新規登録。  

<details><summary>環境調整メモ。</summary>

基本はzshrcに直接記載している。  

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

* 技術で困ったときに見る。  
  * [Oh My Zsh(英語版のみ)](https://github.com/ohmyzsh/ohmyzsh)  

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


<a name="androidosoperation_jota"></a>
#### Jota+(Androidアプリ)
ファイル名：**jotaplus_preferences.export**  

WindowsやMacで使えないため、取り扱いに気を付けること。  
※ライセンス課金済み(買い切り)。  

<a name="androidosoperation_droidvim"></a>
#### DroidVim(Androidアプリ)
ファイル名：**com.droidvim.xml**  

※gitコマンド実行権限に課金済み(買い切り)。  

<a name="macosoperation"></a>
### MacOS向け作業。
端末を入れ替えるときに、シェルなどで対応する技術がないため、GUIから操作する。  

<a name="macosoperation_systemsetting"></a>
#### システム環境設定

* キーボード  
  * ショートカット  
    * Spotlight  
      Spotlight検索発動：`Ctrl+Alt+Space`  
      Finder検索発動：`Ctrl+Alt+Shift+Space`  


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
Mac版の買い切り版が無い~~ため、今後IMEの乗り換えを検討する~~ (課金してしまった)。  
Android版は買い切り版のみ手に入れたが、今後使うことはないだろう。  


以下の組み合わせをATOKではできないようだ。  
[AquaMozc for Titan](https://play.google.com/store/apps/details?id=jp.gr.aqua.mozc.titan)ではできるため、便利だと思っていたのだが・・・。  

|入力組み合わせキー|期待結果|備考|
|--------|------|----|
|zh|←||
|zj|↓||
|zk|↑||
|zl|→||
||||  ||
|z-|～||
|z[|『||
|z]|』||
|z.|…||
|z,|‥||
|z/|・||

2021/04/01：新規登録(Windows用)。  

Mac版のIME：**英字入力中にスペルを自動変換**・**文頭を自動的に大文字にする**・**スペースバーを2回押してピリオドを入力**の3種類のチェックボックスをOffにする(設定---\>キーボード---\>ユーザ辞書)。  

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

[一般公開可能な調整サイト](https://chouseisan.com)  

[目次に戻る](#tableOfContents)  


<a name="licenseperation"></a>
## ライセンス
GPL-ver2  

改造を含む利用可能なソースコードと同一条件でのライセンス  
そもそも隠す物ではないはず。  

[目次に戻る](#tableOfContents)  


以上。
