#UseHook

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

GroupAdd, DIRANDVIMGROUP, ahk_exe explorer.exe
GroupAdd, DIRANDVIMGROUP, ahk_exe gvim.exe
return
GroupAdd, ime2NotActiveTitle, ahk_exe Explorer.exe
return
exit

; ■IME変換（日本語・英語切り替え）
;#IfWinNotActive, ahk_group ime2NotActiveTitle
	Insert::return		; インサートキー無効
	Pause::return		; ポーズキー無効
	ScrollLock::return	; スクロールロックキー無効
	NumLock::return		; ナムロックキー無効
	Capslock::return	; キャップスロックキー無効
;	return
;#IfWinNotActive

;	■以下,ホットキー
;		Winキー＋標準キー
;				c	googleChromeブラウザ(※)
;				f	Firefoxブラウザ(※)
;				g	Git(Sourcetree)(※)
;				h	秀丸エディタ(※)
;				p	ペイント(※)
;				v	Gvimエディタ(※)
;		Winキー + Ctrlキー + 標準キー
;				j	Jasper soft
;				s	サクラエディタ(※)
;		Winキー + Altキー + 標準キー
;				r
;				c	CAD
;				e	Evernote
;				g	Godot
;				i	IDE(Eclipse)
;				j	JW_cad
;				k	Kindle
;				m	minecraft
;				o	Origin Game
;				s	Steam Game
;				x	Dropbox
;		Winキー + Altキー + Shift + 標準キー
;				i	一太郎(2018版)
;		Winキー + Altキー + Ctrlキー + 標準キー
;				i	IDE(Visual Studio)
;	エクスプローラ
;		Winキー + Altキー + Ctrlキー + 標準キー
;				x	Explorerをすべてアクティブにする(dropbox限定)。
;		Winキー + Altキー + Shiftキー + 標準キー
;				x	Explorerを順次アクティブにする(dropbox以外)。
;		Winキー + Shiftキー + 標準キー
;				e	Explorerをすべて最小化する(例外なし)。
;		Winキー + Ctrlキー + 標準キー
;				e	Explorerをすべてアクティブにする(例外なし)。
;	アプリケーションキーとの組み合わせ
;		AppsKey + 標準キー
;				a	Access
;				b	Blend
;				d	OneDrive
;				d	Delve(設定無し)
;				e	Excel
;				f	Forms(設定無し)
;				g	Groove
;				i	InfoPath
;				k	スクリーンキーボード
;				k	Kaizala(設定無し)
;				l	Microsoft Lists(設定無し)
;				m	Outlook
;				n	OneNote
;				p	PowerPoint
;				p	Planner(設定無し)
;				p	Project(設定無し)
;				h	Publisher("版元"の頭文字)
;				s	PowerShell
;				s	SharePoint(設定無し)
;				s	Skype(設定無し)
;				s	Stream(設定無し)
;				s	Sway(設定無し)
;				t	タスクマネージャ
;				t	Microsoft Teams(設定無し)
;				t	To-Do(設定無し)
;				u	電卓
;				v	VisualStudioCode
;				v	Visio(設定無し)
;				w	Word
;				w	Whiteboard(設定無し)
;				y	Yammer(設定無し)
;		※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。

TrayTip, "注意", 下記変更ができない場合、本ファイルの文字コードをSJIS(CRLF)にすること。, 3, 0
Menu, tray, Add
Menu, tray, Add, Text, testRun
Return
testRun:
	Gui, Add, Text, , インストール先のAutoHotkeyU64.exeをAutoHotkey.exeに名前変更して使うこと。`nまた、本ファイルの文字コードをUTF-8のBOMあり(CRLF)にすること。`n`nそして、それらの設定を終えた場合、本行を基準に上記TrayTip行から下記Retern行までの18行分ほどを削除すること。
	Gui, Show
Return
GuiClose:
	Gui, Destroy
Return
a::
i::
u::
e::
o::
	Goto, testRun
Return

; 単純起動。
softRunGoGo(Array, ByRef varSoftwarePID, originally)
{
	varSoftwarePID :=

	For index, element in Array
	{
		IF FileExist( element )
		{
			Run, open %element%, , , varSoftwarePID
			sleep 450
			WinActivate, ahk_pid %varSoftwarePID%
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			Send, %originally%
		}
	}

	return %element%
}
officeRunGoGo(Array, ByRef varSoftwarePID, activOffice, originally)
{
	varSoftwarePID :=

	For index, element in Array
	{
		IF FileExist( element )
		{
			WinGet, OutputList, List, ahk_class %activOffice%
			if OutputList > 0 
			{
;				msgbox, 起動済み。
				WinGet, activeID, ID, A
				WinGet, serch_ID, ID, ahk_class %activOffice%
				WinGet, activeWinID, IDLast, ahk_class %activOffice%

				if ( activeID == serch_ID )
				{
					WinActivate, ahk_id %activeWinID%
					varSoftwarePID = %activeWinID%
				}
				else
				{
					WinActivate, ahk_id %serch_ID%
					varSoftwarePID = %serch_ID%
				}
			}
			else
			{
				; 起動
				Run, %element%, , , varSoftwarePID
				varSoftwarePID = %element%
			}
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			Send, %originally%
		}
	}

	return %varSoftwarePID%
}
officeExeRunGoGo(Array, ByRef varSoftwarePID, activOffice, originally)
{
	varSoftwarePID :=

	For index, element in Array
	{
		strSplitArray := StrSplit(element, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]

		IF FileExist( element )
		{
			WinGet, OutputList, List, ahk_exe %activOffice%
			if OutputList > 1 
			{
				WinGet, activeID, ID, A
				WinGet, serch_ID, ID, ahk_exe %activOffice%
				WinGet, activeWinID, IDLast, ahk_exe %activOffice%

;				sleep 100
				;	バグがあり、旨く切り替えてくれない。
				if ( activeID == serch_ID )
				{
					sleep 130
					; 引っかかりを感じる(待機時間の問題ではない)。
					WinActivate, ahk_id %activeWinID%
					varSoftwarePID = %activeWinID%
				}
				else
				{
					WinActivate, ahk_id %serch_ID%
					varSoftwarePID = %serch_ID%
				}

			}
			else if OutputList > 0 
			{
;				msgbox, 起動済み。
				WinGet, activeWinID, ID, ahk_exe %activOffice%
				WinActivate, ahk_id %activeWinID%
				varSoftwarePID = %activeWinID%
			}
			else
			{
				Run, open %element%, , , varSoftwarePID
				oneSoftware = %element%
				varSoftwarePID = %element%
			}
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			Send, %originally%
		}
	}

	return %varSoftwarePID%
}
moveBackToFront(Array, originally)
{
	varSoftwarePID :=

	For index, element in Array
	{
		strSplitArray := StrSplit(element, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive

		IfExist, %element%
		{
			WinGet, activeID, ID, A
			if (OutExtension == "lnk")
			{
				exename = %OutNameNoExt%.exe
			}
			WinGet, serch_ID, ID, ahk_exe %exename%
			WinGet, activeWinID, IDLast, ahk_exe %exename%

			if ( activeID == serch_ID )
			{
				; アクティブウィンドウ予定と実際のアクティブウィンドウが同じであれば最背面のウィンドウをアクティブにする。
				WinActivate, ahk_id %activeWinID%
				varSoftwarePID = %activeWinID%
			}
			else
			{
				; アクティブ予定のウィンドウをアクティブにしたい場合、前面だったウィンドウをアクティブにする。
				WinActivate, ahk_id %serch_ID%
				varSoftwarePID = %serch_ID%
			}

			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			Menu, TRAY, Icon
			TrayTip, %exename%, %exename%のPathが正しくないか、インストールされていない。, 1, 0
			sleep 1000
			Send, %originally%
			break
		}
	}

	return %varSoftwarePID%
}

#^c::
	; Win+Ctrl+c
	Array := [ "C:\Program Files\Google\Chrome\Application\chrome.exe"
			 , "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
			 , ""]

	moveBackToFront(Array, "#^c")
return

#^f::
	; Win+Ctrl+f
	Array := [ "C:\Program Files\Mozilla Firefox\firefox.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox.lnk"
			 , "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
			 , ""]

	moveBackToFront(Array, "#^f")
return

#^h::
	; Win+Ctrl+h
	Array := [ "C:\Program Files\Hidemaru\Hidemaru.exe"
			 , "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
			 , ""]

	moveBackToFront(Array, "#^h")
return

#^p::
	Array := [ systemroot . "\system32\mspaint.exe"
			 , ""]

	moveBackToFront(Array, "#^p")
return

#^+s::
	; Win+Ctrl+Shift+s
	Array := [ "C:\Program Files\sakura\sakura.exe"
			 , "C:\Program Files (x86)\sakura\sakura.exe"
			 , ""]

	moveBackToFront(Array, "#^+s")
return

AppsKey & l::
	; Ubuntu起動に変更？
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Excel 2003.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Calc.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "AppsKey & e")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Gvim win + v
;		https://vim-jp.org/
;		https://vim-jp.org/vimdoc-ja/
;		https://www.vim.org/
#v::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		クリップボード履歴が潰れる。
	Array := [ "C:\Program Files\vim82-kaoriya-win64\gvim.exe"
			 , "C:\Program Files (x86)\vim82-kaoriya-win32\gvim.exe"
			 , "C:\Program Files\vim\gvim.exe"
			 , "C:\Program Files (x86)\gvim.exe"
			 , "C:\Program Files\vim83-kaoriya-win64\gvim.exe"
			 , "C:\Program Files (x86)\vim83-kaoriya-win32\gvim.exe"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#v")
	IfExist, %oneSoftware%
	{
		sleep 480
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;Win+Alt+r
;		AHKリロード(丸括弧記号などの正規表現に使われる記号をファイル名に含めてはならない)
;		XboxGameBar関連が優先されるようで、リロードされない。
#NoTrayIcon
#!r::
	WinGetClass, className, A
	WinGetTitle, titleReloadName, A
	WinGet, winGetPID, PID, A
	scriptname := ""
	Loop, parse, A_ScriptName, `.
	{
		scriptname .= A_LoopField . "\."
	}
	StringTrimRight, scriptname, scriptname, 2
	regScriptName := "(" . scriptname . ").*(GVIM)"
	varFoundRegReload := RegExMatch(titleReloadName, regScriptName, varReload)
	If ( ErrorLevel <> 0 )
	{
		MsgBox, リロードでエラーが発生：ErrorLevel
	}
	If ( varFoundRegReload > 0 )
	{
		;FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, , , , , Ctrl+Alt+s,
		Reload
		#NoTrayIcon
	}
return

;;; アプリの終了
#q::
	WinGetTitle, titleControlWName, A
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
	If ( ErrorLevel <> 0 )
	{
		MsgBox, #q：%ErrorLevel%：%A_LineNumber%
	}
	If ( varFoundRegControlWSakura > 0 )
	{
		Send, !{F4}
	}
	else
	{
		WinClose, A
	}
return

^!f::
	WinGet, windowSizeGet, MinMax, A
	if ( 1 == windowSizeGet )
	{
		WinRestore, A
	}
	Else If ( 0 == windowSizeGet )
	{
		WinMaximize, A
	}
return

#+e::
;	win + Shift + e
;	Explorerを次々に最小化にする。
	WinGet, OutputList, List, ahk_class CabinetWClass
	Loop, %OutputList%
	{
		dirID := % OutputList%A_Index%
		WinMinimize, ahk_id %dirID%
	}
return

#^e::
;	win + Ctrl + e
;	Explorerをすべてアクティブ化する。
	WinGet, OutputList, List, ahk_class CabinetWClass
	Loop, %OutputList%
	{
		dirID := % OutputList%A_Index%
		WinActivate, ahk_id %dirID%
	}
	WinActivate, A
return

;;; "Visual Studio" win + Alt + Ctrl + i
#!^i::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2017.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2015.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2012.lnk"
			 , ""]
	oneSoftware :=

	; 以下、バージョンによっては変更が必要になるだろう。
	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "devenv.exe", "#!^i")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; 以下、改良が必要⇒一太郎起動に変更。
#!+i::
;	eclipse := "C:\pleiades\eclipse\eclipse.exe"
;	IfNotExist, %eclipse%
;	{
;		eclipse := "C:\Program Files (x86)\eclipse-pleiades\eclipse\eclipse.exe"
;		IfNotExist, %eclipse%
;		{
;			eclipse := "C:\Program Files\eclipse-pleiades\eclipse\eclipse.exe"
;			IfNotExist, %eclipse%
;			{
;				Send, #!+i
;			}
;		}
;	}
;	IfExist, %eclipse%
;	{
;		WinGet, activeWinID, IDLast, ahk_class SWT_Window0, , - Eclipse IDE
;		WinActivate, ahk_id %activeWinID%
;	}
;
;	StringTrimRight, appdataRoaming, A_AppData, 7
;	msvscode := appdataRoaming . "Local\Programs\Microsoft VS Code\Code.exe"
;	IfNotExist, %msvscode%
;	{
;		msvscode := "C:\Program Files (x86)\Microsoft VS Code\Code.exe"
;		IfNotExist, %msvscode%
;		{
;			msvscode := "C:\Program Files\Microsoft VS Code\Code.exe"
;			IfNotExist, %msvscode%
;			{
;				Send, #!+i
;			}
;		}
;	}
;	IfExist, %msvscode%
;	{
;		WinGet, activeWinID, IDLast, ahk_exe %msvscode%
;		WinActivate, ahk_id %activeWinID%
;	}
;return
;#!+i::
;	一太郎起動に変更。
;	; Win+Alt+Shift+i
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2025.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2024.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2023.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2022.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2021.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2020.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2018.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2017.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\一太郎\一太郎2015.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	; バージョン変更により、必ず以下(第3引数)の修正が必要になる。
	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "js:TARO28", "#!+i")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;	Dropbox win + Alt + x
#!x::
	Array := [ "C:\Program Files\Dropbox\Client\Dropbox.exe"
			 , "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Dropbox\Dropbox.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!x")
	IfExist, %oneSoftware%
	{
		Run Explorer "Dropbox", , , varExplorerPID
		sleep 1000
		WinActivate, ahk_id %varExplorerPID%
		Send, !ddropbox{Enter}
	}
return

;;; Steam win + Alt + s
#^!s::
#!s::
	Array := [ "C:\Program Files\Steam\Steam.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Steam\Steam.lnk"
			 , "C:\Program Files (x86)\Steam\Steam.exe"
			 , ""]
	oneSoftware :=

	UniqueID := WinExist("ahk_exe Steam.exe")
	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!s")

	IfExist, %oneSoftware%
	{
		sleep 150
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; オリジン win + Alt + o
#^!o::
#!o::
	Array := [ "C:\Program Files\Origin\Origin.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Origin\Origin.lnk"
			 , "C:\Program Files (x86)\Origin\Origin.exe"
			 , ""]
	oneSoftware :=

	UniqueID := WinExist("ahk_exe Origin.exe")
	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!o")
	IfExist, %oneSoftware%
	{
		sleep 150
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Minecraft win + Alt + m
#+!m::
#!m::
	Array := [ "C:\Program Files\Minecraft\MinecraftLauncher.exe"
			 , "C:\Program Files (x86)\Minecraft\MinecraftLauncher.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Minecraft\Minecraft.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "minecraft.exe", "#!m")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; キンドル win + Alt + k
#+!k::
#!k::
	Array := [ "C:\Program Files\Amazon\Kindle\Kindle.exe"
			 , UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Amazon\Amazon Kindle\.lnk"
			 , "C:\Program Files (x86)\Amazon\Kindle\Kindle.exe"
			 , ""]
	oneSoftware :=

	StringTrimRight, appdataRoaming, A_AppData, 7
	Kindle := appdataRoaming . "Local\Amazon\Kindle\application\Kindle.exe"
	UniqueID := WinExist("ahk_exe Kindle.exe")
	IfExist, %Kindle%
	{
		if % StrLen(UniqueID) == 3
		{
			sleep 100
			Run, %Kindle%, , , varKindlePID
		}
	}
	else
	{
		oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!k")
	}

	; 以下の処理必要か？
	IfExist, %Kindle%
	{
		sleep 450
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe Kindle.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;;	JW_CAD_win
#!j::
	; Win + Alt + j
	; 以下、インストール先のPathを変更する必要が出てくることだろう。
	Array := [ "C:\jww\Jw_win.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Jw_cad\jw_cad.lnk"
			 , ""]
	oneSoftware :=

;	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "Afx:00400000:b:00010005:00000006:011B0669", "#^j")
;	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#^j")
	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "Jw_win.exe", "#^j")

	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Eclipse win + Alt + i
;	なぜか起動せず、対処方法がわからない。
#!i::
	Array := [ "C:\pleiades\eclipse\eclipse.exe"
			 , "C:\Program Files\eclipse-pleiades\eclipse\eclipse.exe"
			 , "C:\Program Files (x86)\eclipse-pleiades\eclipse\eclipse.exe"
			 , ""]
	oneSoftware :=

	; 以下、バージョンによっては変更が必要になるだろう。
	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "SWT_Window0", "#!i")

	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Godoto win + Alt + e
#^!g::
#!g::
	Array := [ "C:\Program Files\Godot.exe"
			 , "C:\Program Files\Godot_v3.3.2-stable_win64.exe"
			 , "C:\Program Files\Godot\Godot.exe"
			 , "C:\Program Files\Godot\Godot_v3.3.2-stable_win64.exe"
			 , "C:\Program Files (x86)\Godot.exe"
			 , "C:\Program Files (x86)\Godot\Godot.exe"
			 , "C:\Program Files (x86)\Godot\Godot_v3.3.2-stable_win32.exe"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "Godot_v3.3.2-stable_win64.exe", "#!g")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Evernote win + Alt + e
#^!e::
#!e::
	Array := [ "C:\Program Files\Evernote\Evernote\Evernote.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Evernote\Evernote.lnk"
			 , "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "ENMainFrame", "#!e")

	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; InfinityネットワークCAD win + Alt + c
#!c::
	Array := [ "C:\Program Files\AisanTechnology\WingneoINFINITY\WNI64UTL\UTIL\StartWos.exe"
			 , "C:\Program Files (x86)\AisanTechnology\WingneoINFINITY\WNI64UTL\UTIL\StartWos.exe"
			 , ""]
	oneSoftware :=

For index, element in Array
{
	IF FileExist( element )
	{
		softwareRunString := element . " /NET /N"
		Run, %softwareRunString%, , , varSoftwarePID
		oneSoftware = %element%
		break
	}
	Else If % index = Array.MaxIndex()
	{
		Send, #!c
	}
}
	IfExist, %oneSoftware%
	{
		sleep 800

		WinGetTitle, titleNameGet, INFINITY
		if titleNameGet =
		{
			WinGetTitle, titleNameGet, WingFan
		}
		WinGetClass, OutputVar, %titleNameGet%
		WinActivate ahk_class %OutputVar%
	}
return

;;;サクラエディタ win + Ctrl + s
#^s::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		音声認識のセットアップ画面が起動する。
	Array := Object()
	Array := [ "C:\Program Files\sakura\sakura.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\サクラエディタ\サクラエディタ.lnk"
			 , "C:\Program Files (x86)\sakura\sakura.exe"
			 , "" ]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#^s")

	IfExist, %oneSoftware%
	{
		sleep 300
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Jasper soft win + Ctrl + j
#^j::
	; こっちを一太郎起動にする？
Array := [ "C:\Program Files\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
		 , "C:\Program Files (x86)\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
		 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!j")
	IfExist, %oneSoftware%
	{
		sleep 300
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

#^v::
	Array := [ "C:\Program Files\Vim\gvim.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Vim 8.2\gVim.lnk"
			 , "C:\Program Files\vim82-kaoriya-win64\gvim.exe"
			 , "C:\Program Files (x86)\Vim\gvim.exe"
			 , "C:\Program Files (x86)\vim82-kaoriya-win64\gvim.exe"
			 , ""]

	moveBackToFront(Array, "#^v")
return

;;; WindowsOS標準のペイント　Win＋p
#p::
	Run, %systemroot%\system32\mspaint.exe, , , varPaintPID
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		デュアルディスプレイ用のショートカット？
	sleep 300
	SetTitleMatchMode,2
	WinActivate ,ペイント
return

;;;秀丸 win + h
#h::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		ディクテーションなるものが動くようだ。しかし、日本語運用時は動かないようだ。
	Array := [ "C:\Program Files\Hidemaru\Hidemaru.exe"
			 , "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
			 , ""]

	oneSoftware :=
	varSoftwarePID :=
	UniqueID := WinExist("ahk_exe Hidemaru.exe")

For index, element in Array
{
	IF FileExist( element )
	{
		WinActivate, ahk_exe %element%
		oneSoftware = %element%
		break
	}
	Else If % index = Array.MaxIndex()
	{
		Send, #h
	}
}
	IfExist, %oneSoftware%
	{
		sleep 100
		WinActivate, ahk_pid %varSoftwarePID%

		WinGetTitle, hidemaruTitle, ahk_exe %oneSoftware%
		regFoundpos := RegExMatch(hidemaruTitle, ".*\(無題\).*秀丸$")
		if % StrLen(UniqueID) > 3  && regFoundpos == 0
		{
			Send, ^n
			;	弊害があり、起動に時間がかかる。
		}
		else if % StrLen(UniqueID) < 4
		{
			Run, %element%, , , varSoftwarePID
		}
		else
		{
			WinActivate, ahk_exe %element%
		}
	}
return

;;; Sourcetree win + g
#^g::
#g::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
	;	Windows標準のXboxゲーム記録用プログラムの起動を潰す(潰しきれないのだが、ショートカットを無効化した)。
	Array := [ "C:\Program Files\SourceTree\SourceTree.exe"
			 , UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Atlassian\Sourcetree.lnk"
			 , "C:\Program Files (x86)\SourceTree\SourceTree.exe"
			 , ""]
	oneSoftware :=

	StringTrimRight, appdataRoaming, A_AppData, 7
	Sourcetree := appdataRoaming . "Local\SourceTree\SourceTree.exe"

	UniqueID := WinExist("ahk_exe SourceTree.exe")

	IfExist, %Sourcetree%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, %Sourcetree%, , , varSourcetreePID
		}
	}
	else
	{
		oneSoftware := softRunGoGo(Array, varSoftwarePID, "#g")
	}

	; 以下の処理必要か？
	IfExist, %Sourcetree%
	{
		sleep 300
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe SourceTree.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; Firefoxブラウザ win + f
#f::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		フィードバックHubウィンドウが起動する(普通は使わないよね)。
	Array := [ "C:\Program Files\Mozilla Firefox\firefox.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox.lnk"
			 , "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#f")
	IfExist, %oneSoftware%
	{
		sleep 150
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

;;; Chrome win + c
#c::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
	;	Windows標準のCortana起動のショートカットを潰す20210110
	Array := [ "C:\Program Files\Google\Chrome\Application\chrome.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk"
			 , "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#c")
	IfExist, %oneSoftware%
	{
		sleep 280
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Access起動
AppsKey & a::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Access.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Access 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Access 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Access 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Access 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Access 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Access 2003.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Base.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "MSACCESS.EXE", "{AppsKey down}a{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Blend for Visual Studio起動
AppsKey & b::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blend for Visual Studio 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blend for Visual Studio 2017.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blend for Visual Studio 2015.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blend for Visual Studio 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blend for Visual Studio 2012.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "Blend.exe", "{AppsKey down}b{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; OneDrive起動
AppsKey & d::
	Array := [ UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}d{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Excel起動
AppsKey & e::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Excel 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Excel 2003.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Calc.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "XLMAIN", "{AppsKey down}e{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Groove起動
AppsKey & g::
	Array := [ UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Groove 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Groove 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Groove 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Groove 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Groove 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Groove 2003.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}g{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Publisher起動
AppsKey & h::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Publisher.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Publisher 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Publisher 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Publisher 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Publisher 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Publisher 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Publisher 2003.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Draw.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "MSPUB.EXE", "{AppsKey down}h{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; InfoPath起動
AppsKey & i::
	Array := [ UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office InfoPath 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office InfoPath 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office InfoPath 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office InfoPath 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office InfoPath 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office InfoPath 2003.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}i{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

AppsKey & k::
	board := systemroot . "\system32\osk.exe"
	board := UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories\Accessibility\On-Screen Keyboard.lnk"
	Send, #r
	sleep 100
	Send, osk.exe{Enter}
	sleep 100
	; Windows10の場合は、以下だけで動く。
	Run, %systemroot% . \system32\osk.exe, , , varOskPID
return

; Outlook起動
AppsKey & m::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Outlook.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Outlook 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Outlook 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Outlook 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Outlook 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Outlook 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Outlook 2003.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "rctrl_renwnd32", "{AppsKey down}m{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; OneNote起動
AppsKey & n::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office OneNote 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office OneNote 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office OneNote 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office OneNote 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office OneNote 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office OneNote 2003.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "Framework::CFrame", "{AppsKey down}n{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; PowerPoint起動
AppsKey & p::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office PowerPoint 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office PowerPoint 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office PowerPoint 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office PowerPoint 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office PowerPoint 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office PowerPoint 2003.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Impress.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "PPTFrameClass", "{AppsKey down}p{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; PowerShell起動
AppsKey & s::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Windows PowerShell\Windows PowerShell ISE.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "PowerShell_ISE.exe", "{AppsKey down}s{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

AppsKey & u::
	cal := systemroot . "\system32\calc.exe"
	Run, %systemroot%\system32\calc.exe, , , varCalcPID
return

; VSCode起動
AppsKey & v::
	Array := [ UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "Code.exe", "{AppsKey down}v{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Word起動
AppsKey & w::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Word 2019.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Word 2016.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Word 2013.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Word 2010.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Office Word 2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Word 2003.lnk"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Writer.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "OpusApp", "{AppsKey down}w{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; Bash on Ubuntu on Windows
F23 & u::
	Array := [ systemroot . "\System32\bash.exe"
			 , UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Bash on Ubuntu on Windows.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "ConsoleWindowClass", "{F23 down}u{F23 up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; LibreOfficeの計算Math(要は、LaTeX)
F23 & m::
	Array := [ "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreOffice 7.0\LibreOffice Math.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwarePID, "", "{F23 down}m{F23 up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; タスクマネージャ起動
AppsKey & t::
	; いずれ起動キーを変更する。
	Send, ^+{Esc}
	
	moveBackToFront(Array, "^+{Esc}")
return

;	■Control+wキーの組み合わせでウィンドウを閉じたい.
~^w::
	WinGetTitle, titleControlWName, A
	varFoundRegControlWHidemaru := RegExMatch(titleControlWName, ".*(秀丸)$", varControlW)
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
	varFoundRegControlWPowerShell := RegExMatch(titleControlWName, ".*(Windows PowerShell).*$", varControlW)
	varFoundRegControlWEvernoteChild := RegExMatch(titleControlWName, ".*(?!.*com - )(Evernote)$", varControlW)
	varFoundRegControlWVSCode := RegExMatch(titleControlWName, ".*(Visual Studio Code).*$", varControlW)
	varFoundRegControlWPhotoView := RegExMatch(titleControlWName, ".*( - Windows フォト ビューアー).*$", varControlW)
;	varFoundRegControlWGVIM := RegExMatch(titleControlWName, ".*(GVIM).*$", varControlW)
		; 正規表現：http://uxmilk.jp/50674
	If ( ErrorLevel <> 0 )
	{
		MsgBox, 正規表現ErrorLevel：%ErrorLevel%：%A_LineNumber%
	}
	If ( varFoundRegControlWHidemaru > 0 )
	{
		Send, !fx
	}
	Else If ( varFoundRegControlWSakura > 0 )
	{
		Send, !fc
	}
	Else If (varFoundRegControlWEvernoteChild > 0)
	{
		Send, {Esc}
	}
	Else If ( varFoundRegControlWPowerShell > 0 )
	{
		Send, ^{F4}
	}
	Else If ( varFoundRegControlWVSCode > 0 )
	{
		Send, ^{F4}
	}
	Else If ( varFoundRegControlWPhotoView > 0 )
	{
		; Windows7用
		Send, !{F4}
	}
;	Else
;	Else If ( varFoundRegControlWGVIM > 0 )
;	{
;		Send, ^w
;	}
return

F13::
	WinActivate, ahk_class CabinetWClass
return

;	Alt+Ctrl+PrtSc ⇒ Win+Shift+S
!^PrintScreen::
	Send, #+s
return

;■Gvim用の設定
#IfWinActive ahk_exe gvim.exe
#t::Send, {Esc 2}^{[}:tabnew{Enter}	; Win+tで新規タブ作成※
#w::Send, {Esc 2}^{[}:tabclose{Enter}	; Win+cでタブClose※
#m::Send, {Esc 2}^{[}:tab split{Enter}:tabprev{Enter}:close{Enter}:tabnext{Enter}	; Win+mで既存バッファをタブ移動※
	;	※Windowsのショートカットを潰す
!Space::WinMinimize
#!d::Send, {Esc 2}^{[}:bw{Enter}	; バッファ削除
#+!d::Send, !bd	; 不要な処理だろう。
#IfWinActive

;■秀丸エディタの設定
#IfWinActive ahk_exe Hidemaru.exe
^g::Send, !sg	; Ctrl&gによるGrep検索ダイアログを開く(その弊害で、行番号指定のジャンプができなくなる⇒ショートカットを潰したため)。
^j::Send, ^g	; Ctrl&gが上記で潰れたため、Ctrl+jで指定行移動を可能にした(本来の割当はない)。
^!f::Send, !vz	; 全画面表示(Ctrl+Alt+f)。これは、MacOSに似か寄らせた。
#IfWinActive

; ■App+Space
;	Win+Spaceは、WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
#Space::
;AppsKey & Space::
	; アクティブウィンドウの最小化。
	WinMinimize, A
return

#e::
	Run Explorer %UserProfile%, , , varExplorerPID
	sleep 140
	WinActivate, ahk_id %varExplorerPID%
return

#F13::
	Run Explorer %A_Desktop%, , , varExplorerPID
	sleep 140
	WinActivate, ahk_id %varExplorerPID%
return

; ■Eclipseの設定
#IfWinActive ahk_exe eclipse.exe
^g::Send, !aa	; Ctrl&gによるGrep検索ダイアログを開く(既存ショートカットキーを潰した)
^j::Send, ^l	; Ctrl&jによる指定行移動ダイアログを開く
#IfWinActive

#+!^c::
	Menu, TRAY, Icon
	TrayTip, "make", (c)asakunotomohiro`ndate：2021/06/01`nAHKVer：%A_AhkVersion%`ndate：%A_YYYY%/%A_MM%/%A_DD%(%A_DDDD%) %A_Hour%:%A_Min% %A_Sec%.%A_MSec%, 3, 0
	sleep 3000
	Menu, TRAY, NoIcon
return

#^!x::
	; Win+Ctrl+Alt+x
	;	Dropboxディレクトリをアクティブにする。
	Array := [ "C:\Program Files\Dropbox\Client\Dropbox.exe"
			 , "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Dropbox\Dropbox.lnk"
			 , "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
			 , ""]
	oneSoftware :=

	For index, element in Array
	{
		IF FileExist( element )
		{
			oneSoftware = %element%
			break
		}
	}

	IfExist, %oneSoftware%
	{
		WinGet, activeWinID, IDLast, ahk_class CabinetWClass, Dropbox
		WinActivate, ahk_id %activeWinID%
	}
return

#+!x::
	;	Win+Shift+Alt+x
	WinGet, OutputList, List, ahk_class CabinetWClass, ,, Dropbox
	WinGet, activeWinID, IDLast, ahk_class CabinetWClass, ,, Dropbox
	Loop, %OutputList%
	{
		WinGetClass, OutputVar, ahk_id A_LoopField
		winWordID := % OutputVar%A_Index%
		if ( winWordID == activeWinID )
		{
			WinActivate, A
		}
		else
		{
			WinActivate, ahk_id %activeWinID%
			break
		}
	}
return

;■ 以下、個別のソフトウェア設定(現時点ではCtrl+Tabで同ソフトの切り替えのみ)
#IfWinActive ahk_class CabinetWClass
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class CabinetWClass
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe Acrobat.exe
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class AcrobatSDIWindow
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe DllHost.exe
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class Photo_Lightweight_Viewer
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive
#IfWinActive, ahk_exe ApplicationFrameHost.exe
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class ApplicationFrameWindow
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe WINWORD.EXE
Ctrl & Tab::
	OutputList := 
	WinGet, activeWinID, IDLast, ahk_class OpusApp
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe POWERPNT.EXE
Ctrl & Tab::
	OutputList := 
;	WinGet, activeWinID, IDLast, ahk_exe POWERPNT.EXE
	; 以下、Office365
	WinGet, activeWinID, IDLast, ahk_class PPTFrameClass
	if activeWinID =
	{
		; 以下、Offce2017
		WinGet, activeWinID, IDLast, ahk_class PP12FrameClass
	}
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe ONENOTE.EXE
Ctrl & Tab::
	OutputList := 
	WinGet, activeWinID, IDLast, ahk_class Framework::CFrame
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe OUTLOOK.EXE
Ctrl & Tab::
	OutputList := 
	WinGet, activeWinID, IDLast, ahk_class rctrl_renwnd32
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#IfWinActive ahk_exe Code.exe
Ctrl & Tab::
	Send, {Blind}^{PgDn}
return
#IfWinActive

#IfWinActive ahk_class MSPaintApp
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class MSPaintApp
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

AppsKey::AppsKey
^h::Send {Backspace}
;■市販品のキーボード対応
; ■CapslockをCtrlキーに入れ替える.

; vim:set ts=4 sts=4 sw=4 tw=0:
;	以上。ここまで。
