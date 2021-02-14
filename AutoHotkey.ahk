#UseHook
^h::Send {Backspace}
#q::WinClose, A
GroupAdd, ime2NotActiveTitle, ahk_exe Explorer.exe
return
#IfWinNotActive, ahk_group ime2NotActiveTitle
	Insert::return		; インサートキー無効
	Pause::return		; ポーズキー無効
	ScrollLock::return	; スクロールロックキー無効
	NumLock::return		; ナムロックキー無効
	Capslock::return	; キャップスロックキー無効
	return
#IfWinNotActive
#!r::
	WinGetClass, className, A
	WinGetTitle, titleReloadName, A
	WinGet, winGetPID, PID, A
	varFoundRegReload := RegExMatch(titleReloadName, "(AutoHotkey\.ahk).*(GVIM)", varReload)
	If ( ErrorLevel <> 0 )
	{
		MsgBox, リロードエラー発生：ErrorLevel
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
	TrayTip, "make", (c)asakunotomohiro`ndate：2021/01/10`nAHKVer：%A_AhkVersion%`ndate：%A_YYYY%/%A_MM%/%A_DD%(%A_DDDD%) %A_Hour%:%A_Min% %A_Sec%.%A_MSec%, 3, 0
	sleep 3000
	Menu, TRAY, NoIcon
return
hidemaru := ""
#h::
	hidemaru := "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
	IfExist, %hidemaru%
	{
		Run, %hidemaru%, , , varHidemaruPID
	}
	else
	{
		hidemaru := "C:\Program Files\Hidemaru\Hidemaru.exe"
		IfExist, %hidemaru%
		{
			Run, %hidemaru%, , , varHidemaruPID
		}
		else
		{
			TrayTip, %hidemaru%, Pathが正しくないか、インストールされていない。, 3, 0
		}
	}
	sleep 100
	WinActivate, ahk_exe %hidemaru%
return
;	sakura = "C:\Program Files (x86)\sakura\sakura.exe"
;	Run, %sakura%, , , varSakuraPID
;	sleep 100
;	WinActivate
;return
#v::
	gvimEditor := "C:\Program Files\vim81-kaoriya-win64\gvim.exe"
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
			TrayTip, %gvimEditor%, Pathが正しくないか、インストールされていない。, 3, 0
		}
	}
	sleep 550
	WinActivate, ahk_pid %varGvimPID%
return
#p::
	Run, %windir%\system32\mspaint.exe, , , varPaintPID
	sleep 200
	SetTitleMatchMode,2
	WinActivate ,ペイント
return
#f::
	firefoxBrowser := "C:\Program Files\Mozilla Firefox\firefox.exe"
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
			TrayTip, %firefoxBrowser%, Pathが正しくないか、インストールされていない。, 3, 0
		}
	}
	sleep 800
	WinActivate, Mozilla Firefox
return
#c::
	googleChorme := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
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
			TrayTip, %googleChorme%, Pathが正しくないか、インストールされていない。, 3, 0
		}
	}
	sleep 150
	WinActivate, ahk_pid %varChormePID%
return
#!i::
	eclipse := "C:\dev\pleiades\eclipse\eclipse.exe"
	Run, %eclipse%, , , varEclipsePID
	sleep 150
	WinActivate, ahk_exe %eclipse%
return
#!j::
	jaspersoft := "C:\Program Files\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
	Run, %jaspersoft%, , , varJaspersoftPID
	sleep 150
	WinActivate, ahk_exe %jaspersoft%
return
;#!s::
#g::
	Sourcetree := "C:\Users\asakunotomohiro\AppData\Local\SourceTree\SourceTree.exe"
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
				TrayTip, %Sourcetree%, Pathが正しくないか、インストールされていない。, 3, 0
			}
		}
	}
	sleep 150
	WinActivate, ahk_pid %varSourcetreePID%
return
~^w::
	WinGetTitle, titleControlWName, A
	varFoundRegControlWHidemaru := RegExMatch(titleControlWName, ".*(秀丸)$", varControlW)
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
		; 正規表現：http://uxmilk.jp/50674
	If ( ErrorLevel <> 0 )
	{
		MsgBox, 正規表現ErrorLevel：%ErrorLevel%
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
;	以上。ここまで。