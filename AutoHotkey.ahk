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
		FileCreateShortcut, %A_ScriptFullPath%, %A_MyDocuments%\%A_ScriptName%.lnk, , , , , Ctrl+Alt+s,
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
	hidemaru = "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
	Run, %hidemaru%, , , varHidemaruPID
	sleep 100
	WinActivate, ahk_exe %hidemaru%
return
#v::
	gvimEditor := "C:\Program Files (x86)\vim82-kaoriya-win64\gvim.exe"
	Run, %gvimEditor%, , , varGvimPID
	sleep 550
	WinActivate, ahk_exe %gvimEditor%
return
#p::
	Run, %windir%\system32\mspaint.exe, , , varPaintPID
	sleep 200
	SetTitleMatchMode,2
	WinActivate ,�y�C���g
return
#f::
	firefoxBrowser := "C:\Program Files\Mozilla Firefox\firefox.exe"
	Run, %firefoxBrowser%, , , varFireFoxPID
	sleep 800
	WinActivate, Mozilla Firefox
return
#c::
	googleChorme := "C:\Program Files\Google\Chrome\Application\chrome.exe"
	Run, %googleChorme%, , , varChormePID
	sleep 150
	WinActivate, ahk_pid %varChormePID%
return
#g::
	Sourcetree = "C:\Users\asakuno\AppData\Local\SourceTree\SourceTree.exe"
	Run, %Sourcetree%, , , varSourcetreePID
	sleep 150
	WinActivate, ahk_pid %varSourcetreePID%
return
#!e::
	eclipse = "C:\dev\pleiades\eclipse\eclipse.exe"
	Run, %eclipse%, , , varEclipsePID
	sleep 150
	WinActivate, ahk_pid %varEclipsePID%
return
#!j::
	jaspersoft = "C:\Program Files\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
	Run, %jaspersoft%, , , varJaspersoftPID
	sleep 150
	WinActivate, ahk_pid %varJaspersoftPID%
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
#IfWinActive ahk_exe gvim.exe
^s::Send, {Esc 2}^{[}:w{Enter}	// Ctrl+s�ŕۑ�
#IfWinActive
;	�ȏ�B�����܂ŁB
