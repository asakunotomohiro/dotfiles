REM	※管理者権限で実行すること.

REM ----------------------------------------
REM 	mklink "{コピー先}" "{コピー元}"
REM ----------------------------------------

REM	以下,Vim関連
mklink "%HOMEPATH%\.vimrc" "%HOMEPATH%\dotfiles\_vimrc"
mklink "%HOMEPATH%\.gvimrc" "%HOMEPATH%\dotfiles\_gvimrc"

exit /b 0
