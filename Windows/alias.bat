@echo off
doskey ls=dir
doskey ll=dir /C /O:GD /R /T:W 

doskey tags=ctags $*

prompt [$P] $$ 

REM 以上。
REM vim: set ts=4 sts=4 sw=4 tw=0 ff=dos fenc=utf-8 ft=dosbatch noexpandtab:
