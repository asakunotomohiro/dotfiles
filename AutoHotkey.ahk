#UseHook
^h::Send {Backspace}
#q::WinClose, A
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
;	�f�B�N�e�[�V�����Ȃ���̂������悤���B�������A���{��^�p���͓����Ȃ��悤���B
	IfExist, %hidemaru%
	{
		UniqueID := WinExist("ahk_exe Hidemaru.exe")
		if % StrLen(UniqueID) == 3
		{
			Run, %hidemaru%, , , varHidemaruPID
		}
		else
		{
			WinActivate, ahk_exe %hidemaru%
			return
		}
	}
	else
	{
		hidemaru := "C:\Program Files\Hidemaru\Hidemaru.exe"
		IfExist, %hidemaru%
		{
			UniqueID := WinExist("ahk_exe Hidemaru.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, %hidemaru%, , , varHidemaruPID
			}
			else
			{
				WinActivate, ahk_exe %hidemaru%
				return
			}
		}
		else
		{
			TrayTip, %hidemaru%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
		}
	}
	sleep 100
	WinActivate, ahk_exe %hidemaru%
return
;#s::
#^s::
	sakura := "C:\Program Files\sakura\sakura.exe"
;	�����F���̃Z�b�g�A�b�v��ʂ��N������B
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
;	�N���b�v�{�[�h�������ׂ��B
	IfExist, %gvimEditor%
	{
		Run, %gvimEditor%, , , varGvimPID
	}
	else
	{
		gvimEditor := "C:\Program Files (x86)\vim82-kaoriya-win64\gvim.exe"
		IfExist, %gvimEditor%
		{
			Run, %gvimEditor%, , , varGvimPID
		}
		else
		{
			TrayTip, %gvimEditor%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
		}
	}
	sleep 550
	WinActivate, ahk_pid %varGvimPID%
return
#p::
	Run, %windir%\system32\mspaint.exe, , , varPaintPID
;	�f���A���f�B�X�v���C�p�̃V���[�g�J�b�g�H
	sleep 200
	SetTitleMatchMode,2
	WinActivate ,�y�C���g
return
#f::
	firefoxBrowser := "C:\Program Files\Mozilla Firefox\firefox.exe"
;	�t�B�[�h�o�b�NHub�E�B���h�E���N������(���ʂ͎g��Ȃ����)�B
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
	Run, open %eclipse%, ,  UseErrorLevel, varEclipsePID
	sleep 150
	WinActivate, ahk_exe %eclipse%
return
#!j::
	jaspersoft := "C:\Program Files\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
	IfExist, %jaspersoft%
	{
		Run, %jaspersoft%, , , varJaspersoftPID
	}
	else
	{
		jaspersoft := "C:\Program Files (x86)\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
		IfExist, %jaspersoft%
		{
			Run, %jaspersoft%, , , varJaspersoftPID
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
	IfExist, %Sourcetree%
	{
		Run, %Sourcetree%, , , varSourcetreePID
	}
	else
	{
		Sourcetree := "C:\Program Files (x86)\SourceTree\SourceTree.exe"
		IfExist, %Sourcetree%
		{
			Run, %Sourcetree%, , , varSourcetreePID
		}
		else
		{
			Sourcetree := "C:\Program Files\SourceTree\SourceTree.exe"
			IfExist, %Sourcetree%
			{
				Run, %Sourcetree%, , , varSourcetreePID
			}
			else
			{
				TrayTip, %Sourcetree%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
			}
		}
	}
	sleep 250
	WinActivate, ahk_exe %Sourcetree%
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