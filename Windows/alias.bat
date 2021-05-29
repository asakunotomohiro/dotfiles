@echo off
doskey ls=dir
doskey ll=dir /C /O:GD /R /T:W 

doskey tags=ctags $*

prompt [$P] $$ 

