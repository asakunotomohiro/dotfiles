#UseHook
^h::Send {Backspace}
#q::WinClose, A

;�L�[�̎w����@�̃���
;�@Windows���S�L�[ #
;�@���ϊ��L�[ vk1Dsc07B
;�@SHIFT +
;�@Ctrl ^
;�@Alt !
;�@;(�Z�~�R����)vkBBsc027
;�@:(�R����) vkBAsc028
;�@,(�J���}) vkBCsc033
;�@.(�s���I�h) vkBEsc034
;�@Space vk20sc039
;�@���̑���AutoHotKey Wiki�̃L�[���X�g�Q��

;	�C���V���{��
;		��j<+a

;	�R���r�l�[�V�����L�[
;		��jLShift & a

GroupAdd, ime2NotActiveTitle, ahk_exe Explorer.exe
return
#IfWinNotActive, ahk_group ime2NotActiveTitle
	Insert::return		; �C���T�[�g�L�[����
	Pause::return		; �|�[�Y�L�[����
	ScrollLock::return	; �X�N���[�����b�N�L�[����
	NumLock::return		; �i�����b�N�L�[����
	Capslock::return	; �L���b�v�X���b�N�L�[����
	return
#IfWinNotActive

;	���ȉ�,�z�b�g�L�[
;		Win�L�[�{�W���L�[
;		Win�L�[ + Ctrl�L�[ + �W���L�[
;		Win�L�[ + Alt�L�[ + �W���L�[

;	AHK�����[�h
#NoTrayIcon
#!r::
	WinGetClass, className, A
	WinGetTitle, titleReloadName, A
	WinGet, winGetPID, PID, A
	varFoundRegReload := RegExMatch(titleReloadName, "(AutoHotkey\.ahk).*(GVIM)", varReload)
	If ( ErrorLevel <> 0 )
	{
		MsgBox, �����[�h�G���[�����FErrorLevel
	}
	If ( varFoundRegReload > 0 )
	{
		FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, , , , , Ctrl+Alt+s,
		Reload
		#NoTrayIcon
	}
return
#+!^c::
	Menu, TRAY, Icon
	TrayTip, "make", (c)asakunotomohiro`ndate�F2021/01/10`nAHKVer�F%A_AhkVersion%`ndate�F%A_YYYY%/%A_MM%/%A_DD%(%A_DDDD%) %A_Hour%:%A_Min% %A_Sec%.%A_MSec%, 3, 0
	sleep 3000
	Menu, TRAY, NoIcon
return
hidemaru := ""
#h::
	hidemaru := "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�f�B�N�e�[�V�����Ȃ���̂������悤���B�������A���{��^�p���͓����Ȃ��悤���B
	IfExist, %hidemaru%
	{
		UniqueID := WinExist("ahk_exe Hidemaru.exe")
		if % StrLen(UniqueID) == 3
		{
			Run, %hidemaru%, , , varHidemaruPID
		}
	}
	else
	{
		hidemaru := "C:\Program Files\Hidemaru\Hidemaru.exe"
		strSplitArray := StrSplit(hidemaru, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		IfExist, %hidemaru%
		{
			UniqueID := WinExist("ahk_exe Hidemaru.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, %hidemaru%, , , varHidemaruPID
			}
		}
		else
		{
			Menu, TRAY, Icon
			TrayTip, %exename%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
			Menu, TRAY, NoIcon
		}
	}
	sleep 100
	strSplitArray := StrSplit(hidemaru, "\" )
	ii := strSplitArray.MaxIndex()
	exename := strSplitArray[ii]
	WinActivate, ahk_exe %exename%
return
;#s::
#^s::
	sakura := "C:\Program Files\sakura\sakura.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�����F���̃Z�b�g�A�b�v��ʂ��N������B
	IfExist, %sakura%
	{
		Run, %sakura%, , , varSakuraPID
	}
	else
	{
		sakura := "C:\Program Files (x86)\sakura\sakura.exe"
		IfExist, %sakura%
		{
			Run, %sakura%, , , varSakuraPID
		}
		else
		{
			TrayTip, %sakura%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
		}
	}
	sleep 100
	WinActivate
return
#v::
	gvimEditor := "C:\Program Files\vim81-kaoriya-win64\gvim.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�N���b�v�{�[�h�������ׂ��B
	IfExist, %gvimEditor%
	{
		Run, %gvimEditor%, , , varGvimPID
	}
	else
	{
		gvimEditor := "C:\Program Files (x86)\vim82-kaoriya-win64\gvim.exe"
		strSplitArray := StrSplit(gvimEditor, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		IfExist, %gvimEditor%
		{
			Run, %gvimEditor%, , , varGvimPID
		}
		else
		{
			Menu, TRAY, Icon
			TrayTip, %exename%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
			Menu, TRAY, NoIcon
		}
	}
	sleep 550
	strSplitArray := StrSplit(gvimEditor, "\" )
	ii := strSplitArray.MaxIndex()
	exename := strSplitArray[ii]
	WinActivate, ahk_exe %exename%
return
#p::
	Run, %windir%\system32\mspaint.exe, , , varPaintPID
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�f���A���f�B�X�v���C�p�̃V���[�g�J�b�g�H
	sleep 200
	SetTitleMatchMode,2
	WinActivate ,�y�C���g
return
#f::
	firefoxBrowser := "C:\Program Files\Mozilla Firefox\firefox.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�t�B�[�h�o�b�NHub�E�B���h�E���N������(���ʂ͎g��Ȃ����)�B
	IfExist, %firefoxBrowser%
	{
		Run, %firefoxBrowser%, , , varFireFoxPID
	}
	else
	{
		firefoxBrowser := "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
		IfExist, %firefoxBrowser%
		{
			Run, %firefoxBrowser%, , , varFireFoxPID
		}
		else
		{
			TrayTip, %firefoxBrowser%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
		}
	}
	sleep 800
	WinActivate, Mozilla Firefox
return
;#!c::
#c::
	googleChorme := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
	;	Windows�W����Cortana�N���̃V���[�g�J�b�g��ׂ��B
	IfExist, %googleChorme%
	{
		Run, %googleChorme%, , , varChormePID
	}
	else
	{
		googleChorme := "C:\Program Files\Google\Chrome\Application\chrome.exe"
		IfExist, %googleChorme%
		{
			Run, %googleChorme%, , , varChormePID
		}
		else
		{
			TrayTip, %googleChorme%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
		}
	}
	sleep 150
	WinActivate, ahk_pid %varChormePID%
return
#!i::
	eclipse := "C:\dev\pleiades\eclipse\eclipse.exe"
	UniqueID := WinExist("ahk_exe eclipse.exe")
	IfExist, %eclipse%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, open %eclipse%, ,  UseErrorLevel, varEclipsePID
		}
	}
	else
	{
		eclipse := "C:\Program Files (x86)\eclipse-pleiades\eclipse.exe"
		IfExist, %eclipse%
		{
			UniqueID := WinExist("ahk_exe eclipse.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, open %eclipse%, ,  UseErrorLevel, varEclipsePID
			}
		}
		else
		{
			eclipse := "C:\Program Files\eclipse-pleiades\eclipse.exe"
			IfExist, %eclipse%
			{
				UniqueID := WinExist("ahk_exe eclipse.exe")
				if % StrLen(UniqueID) == 3
				{
					Run, open %eclipse%, ,  UseErrorLevel, varEclipsePID
				}
			}
		}
	}
	sleep 250
	WinActivate, ahk_exe eclipse.exe
return
#!j::
	jaspersoft := "C:\Program Files\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
	IfExist, %jaspersoft%
	{
		UniqueID := WinExist("ahk_exe Jaspersoft Studio.exe")
		if % StrLen(UniqueID) == 3
		{
			Run, %jaspersoft%, , , varJaspersoftPID
		}
		else
		{
			WinActivate, ahk_exe %jaspersoft%
			return
		}
	}
	else
	{
		jaspersoft := "C:\Program Files (x86)\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
		IfExist, %jaspersoft%
		{
			UniqueID := WinExist("ahk_exe %jaspersoft%")
			if % StrLen(UniqueID) == 3
			{
				Run, %jaspersoft%, , , varJaspersoftPID
			}
			else
			{
				WinActivate, ahk_exe %jaspersoft%
				return
			}
		}
		else
		{
			TrayTip, %jaspersoft%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
		}
	}
	sleep 150
	WinActivate, ahk_exe %jaspersoft%
return
;#!s::
#g::
	StringTrimRight, appdataRoaming, A_AppData, 7
	Sourcetree := appdataRoaming . "Local\SourceTree\SourceTree.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
	IfExist, %Sourcetree%
	{
		UniqueID := WinExist("ahk_exe SourceTree.exe")
		if % StrLen(UniqueID) == 3
		{
			Run, %Sourcetree%, , , varSourcetreePID
		}
	}
	else
	{
		Sourcetree := "C:\Program Files (x86)\SourceTree\SourceTree.exe"
		IfExist, %Sourcetree%
		{
			UniqueID := WinExist("ahk_exe SourceTree.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, %Sourcetree%, , , varSourcetreePID
			}
		}
		else
		{
			Sourcetree := "C:\Program Files\SourceTree\SourceTree.exe"
			IfExist, %Sourcetree%
			{
				UniqueID := WinExist("ahk_exe SourceTree.exe")
				if % StrLen(UniqueID) == 3
				{
					Run, %Sourcetree%, , , varSourcetreePID
				}
			}
			else
			{
				TrayTip, %Sourcetree%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
			}
		}
	}
	sleep 250
	WinActivate, ahk_exe Sourcetree.exe
return
#!s::
	steamGame :="C:\Program Files (x86)\Steam\Steam.exe"
	IfExist, %steamGame%
	{
		Run, %steamGame%, , , varSteamPID
	}
	else
	{
		steamGame :="C:\Program Files\Steam\Steam.exe"
		IfExist, %Sourcetree%
		{
			Run, %steamGame%, , , varSteamPID
		}
	}
	sleep 150
	WinActivate
return
#!m::
	MinecraftGame := "C:\Program Files (x86)\Minecraft\MinecraftLauncher.exe"
	IfExist, %MinecraftGame%
	{
		Run, %MinecraftGame%, , , varMinecraftPID
	}
	else
	{
		MinecraftGame := "C:\Program Files\Minecraft\MinecraftLauncher.exe"
		IfExist, %MinecraftGame%
		{
			Run, %MinecraftGame%, , , varMinecraftPID
		}
	}
	sleep 500
	WinActivate
return
#!e::
	evernote := "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
	IfExist, %evernote%
	{
		Run, %evernote%, , , varEvernotePID
	}
	else
	{
		evernote := "C:\Program Files\Evernote\Evernote\Evernote.exe"
		IfExist, %evernote%
		{
			Run, %evernote%, , , varEvernotePID
		}
	}
	sleep 150
	WinActivate, ahk_exe %evernote%
return
#!x::
	dropbox := "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
	IfExist, %dropbox%
	{
		Run, %dropbox%, , , varDropboxPID
	}
	else
	{
		dropbox := "C:\Program Files\Dropbox\Client\Dropbox.exe"
		IfExist, %dropbox%
		{
			Run, %dropbox%, , , varDropboxPID
		}
	}
	sleep 150
	WinActivate, ahk_exe %dropbox%
return
~^w::
	WinGetTitle, titleControlWName, A
	varFoundRegControlWHidemaru := RegExMatch(titleControlWName, ".*(�G��)$", varControlW)
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
		; ���K�\���Fhttp://uxmilk.jp/50674
	If ( ErrorLevel <> 0 )
	{
		MsgBox, ���K�\��ErrorLevel�F%ErrorLevel%
	}
	If ( varFoundRegControlWHidemaru > 0 )
	{
		Send, !fx
	}
	Else If ( varFoundRegControlWSakura > 0 )
	{
		Send, !fc
	}
return
#IfWinActive ahk_exe Hidemaru.exe
^g::Send, !sg
^j::Send, ^g
#IfWinActive
;���s�̕i�̃L�[�{�[�h�Ή�
; ��Capslock��Ctrl�L�[�ɓ���ւ���.
;	�ȏ�B�����܂ŁB