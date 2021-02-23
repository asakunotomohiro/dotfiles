#UseHook
^h::Send {Backspace}
#q::WinClose, A

;キーの指定方法のメモ
;　Windowsロゴキー #
;　無変換キー vk1Dsc07B
;　SHIFT +
;　Ctrl ^
;　Alt !
;　;(セミコロン)vkBBsc027
;　:(コロン) vkBAsc028
;　,(カンマ) vkBCsc033
;　.(ピリオド) vkBEsc034
;　Space vk20sc039
;　その他はAutoHotKey Wikiのキーリスト参照

;	修飾シンボル
;		例）<+a

;	コンビネーションキー
;		例）LShift & a

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

;	■以下,ホットキー
;		Winキー＋標準キー
;		Winキー + Ctrlキー + 標準キー
;		Winキー + Altキー + 標準キー

;	AHKリロード
#NoTrayIcon
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
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		ディクテーションなるものが動くようだ。しかし、日本語運用時は動かないようだ。
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
			TrayTip, %exename%, Pathが正しくないか、インストールされていない。, 3, 0
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
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		音声認識のセットアップ画面が起動する。
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
			TrayTip, %sakura%, Pathが正しくないか、インストールされていない。, 3, 0
		}
	}
	sleep 100
	WinActivate
return
#v::
	gvimEditor := "C:\Program Files\vim81-kaoriya-win64\gvim.exe"
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		クリップボード履歴が潰れる。
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
			TrayTip, %exename%, Pathが正しくないか、インストールされていない。, 3, 0
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
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		デュアルディスプレイ用のショートカット？
	sleep 200
	SetTitleMatchMode,2
	WinActivate ,ペイント
return
#f::
	firefoxBrowser := "C:\Program Files\Mozilla Firefox\firefox.exe"
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		フィードバックHubウィンドウが起動する(普通は使わないよね)。
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
;#!c::
#c::
	googleChorme := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
	;	Windows標準のCortana起動のショートカットを潰す。
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
			TrayTip, %jaspersoft%, Pathが正しくないか、インストールされていない。, 3, 0
		}
	}
	sleep 150
	WinActivate, ahk_exe %jaspersoft%
return
;#!s::
#g::
	StringTrimRight, appdataRoaming, A_AppData, 7
	Sourcetree := appdataRoaming . "Local\SourceTree\SourceTree.exe"
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
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
				TrayTip, %Sourcetree%, Pathが正しくないか、インストールされていない。, 3, 0
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
#IfWinActive ahk_exe Hidemaru.exe
^g::Send, !sg
^j::Send, ^g
#IfWinActive
;■市販品のキーボード対応
; ■CapslockをCtrlキーに入れ替える.
;	以上。ここまで。