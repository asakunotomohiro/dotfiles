#UseHook
#NoEnv
#SingleInstance, Force
#InstallKeybdHook


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
;	Happy Hacking Keyboard用設定
;		ダイヤモンドキー	vkFFsc079左	vkFFsc07b右

;	修飾シンボル
;		例）<+a

;	コンビネーションキー
;		例）LShift & a

GroupAdd, BROWSERGROUP, ahk_exe msedge.exe
GroupAdd, BROWSERGROUP, ahk_exe iexplore.exe
GroupAdd, BROWSERGROUP, ahk_exe firefox.exe
GroupAdd, BROWSERGROUP, ahk_exe chrome.exe
return

GroupAdd, DIRANDVIMGROUP, ahk_exe explorer.exe
GroupAdd, DIRANDVIMGROUP, ahk_exe gvim.exe
return

GroupAdd, PHOTOVIEWER, ahk_exe DllHost.exe
GroupAdd, PHOTOVIEWER, ahk_exe ApplicationFrameHost.exe
return
GroupAdd, PHOTOVIEWERCLASS, ahk_class Photo_Lightweight_Viewer
GroupAdd, PHOTOVIEWERCLASS, ahk_class ApplicationFrameWindow
return
GroupAdd, PHOTOVIEWERTEN, ahk_exe ApplicationFrameHost.exe
return
GroupAdd, PHOTOVIEWERTENCLASS, ahk_class ApplicationFrameWindow
return
GroupAdd, PHOTOVIEWERSEV, ahk_exe DllHost.exe
return

GroupAdd, ime2NotActiveTitle, Minecraft
GroupAdd, ime2NotActiveTitle, ahk_exe explorer.exe
return
exit

;	■以下,ホットキー
;		Winキー＋標準キー
;				c	googleChromeブラウザ(※)
;				f	Firefoxブラウザ(※)
;				g	Git(Sourcetree)(※)
;				h	秀丸エディタ(※)
;				k	Slack(chat)(※)
;				p	ペイント(※)
;				v	Gvimエディタ(※)
;		Winキー + Ctrlキー + 標準キー
;				j	Jasper soft
;				s	サクラエディタ(※)
;		Winキー + Altキー + 標準キー
;				r
;				c	Discord(chat)
;				e	Evernote
;				i	一太郎
;				j	ジャストシステムのツールとユーティリティ
;				k	Kindle
;				m	minecraft
;				n	Notepad++
;				o	Origin Game
;				s	Steam Game
;				t	calc(計算ソフトウェア)
;				w	JW_CAD
;				x	Dropbox
;		Winキー + Altキー + Shift + 標準キー
;		Winキー + Altキー + Ctrlキー + 標準キー
;	エクスプローラ
;		Winキー + Ctrlキー + 標準キー
;				e	Explorerをすべてアクティブにする。
;				x	Explorerをすべてアクティブにする(dropbox以外)。
;		Winキー + Shiftキー + 標準キー
;				e	Explorerをすべて最小化にする。
;				x	Explorerを順次アクティブにする(dropboxのみ)。
;	アプリケーションキーとの組み合わせ
;		AppsKey + 標準キー
;				a	Access	※切り替えがうまくいかず。
;				b	Blend(廃止予定)	※切り替えが全くうまくいかず。
;				d	Delve(設定無し)
;				d	OneDrive
;				e	Excelアクティブ化
;				f	Forms(設定無し)
;				g	Groove(廃止)共同作業ツール
;				h	Publisher("版元"の頭文字)個人出版用ツール？	※切り替えがうまくいかず。
;				i	IDE(VisualStudio)	※切り替えがうまくいかず。
;				i	InfoPath(廃止)
;				k	Kaizala(設定無し)
;				k	スクリーンキーボード
;				l	Excel新規起動
;				l	Microsoft Lists(設定無し)
;				m	Outlook
;				n	OneNote
;				p	Planner(設定無し)
;				p	PowerPoint
;				p	Project(設定無し)
;				s	PowerShell
;				s	SharePoint(設定無し)
;				s	Skype(設定無し)
;				s	Stream(設定無し)
;				s	Sway(設定無し)
;				t	Microsoft Teams(設定無し)
;				t	To-Do(設定無し)
;				t	タスクマネージャ
;				u	電卓
;				v	Visio(設定無し)
;				v	Visual Studio Code
;				w	Whiteboard(設定無し)
;				w	Word
;				y	Yammer(設定無し)
;	ポウズキー(Pause)との組み合わせ(上記MS-Office起動対応)
;				i	IDE(Eclipse)	※起動させられない。
;	F10との組み合わせ
;				u	Bash on Ubuntu
;	F23との組み合わせ(ゲームに特化しよう)
;				o	Oxygen Not Included
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。

TrayTip, "注意", 下記変更ができない場合、本ファイルの文字コードをSJIS(CRLF)にすること。, 3, 0
Menu, tray, Add
Menu, tray, Add, Text, testRun
Return
testRun:
	Gui, Add, Text, , インストール先のAutoHotkeyU64.exeをAutoHotkey.exeに名前変更して使うこと。`nまた、本ファイルの文字コードをUTF-8のBOMあり(CRLF)にすること。`n`nそして、それらの設定を終えた場合、本行を基準に上記TrayTip行から下記Retern行までの15行分ほどを削除すること。
	Gui, Show
Return
a::
i::
u::
e::
o::
	Goto, testRun
Return

Insert::return		; インサートキー無効
Pause::return		; ポーズキー無効
ScrollLock::return	; スクロールロックキー無効
NumLock::return		; ナムロックキー無効
Capslock::return	; キャップスロックキー無効
AppsKey::AppsKey	; アプリケーションキー単体実行
F10::F10
F13::F13
F19::F19
F23::F23
global steamListBox :=

;■ブラウザ上でTab記号を入力する。
; 特定のページに対してだけ発動できず、利用断念。
;#IfWinActive, ahk_exe firefox.exe
;#IfWinActive, ahk_group BROWSERGROUP
;tab::
;	BlockInput, Send
;	tmp := ClipboardAll
;	clipboard := "`t"
;	sendInput, ^v
;	Sleep, 50
;	clipboard := tmp
;	BlockInput, Off
;return
;#IfWinActive

;	全ゲームの表示。
F23 & g::
	GameArray := [ 
			 , A_Desktop . "\Oxygen Not Included.url"
			 , A_Desktop . "\Factorio.url"
			 , A_Desktop . "\HITMAN 2.url"
			 , A_Desktop . "\" . "SimCity™.lnk"
			 , A_Desktop . "\HITMAN.url"
			 , A_Desktop . "\" . "Surviving Mars.url"
			 , A_Desktop . "\Hitman GO Definitive Edition.url"
			 , A_Desktop . "\Hitman Absolution.url"
			 , A_Desktop . "\Hitman Blood Money.url"
			 , A_Desktop . "\Hitman Contracts.url"
			 , A_Desktop . "\Hitman 2 Silent Assassin.url"
			 , A_Desktop . "\Hitman Codename 47.url"
			 , A_Desktop . "\Sniper Ghost Warrior Contracts.url"
			 , A_Desktop . "\Zombie Army Trilogy.url"
			 , A_Desktop . "\Sniper Elite 3.url"
			 , A_Desktop . "\Sniper Elite V2.url"
			 , A_Desktop . "\Sniper Elite.url"
			 , A_Desktop . "\Flockers.url"
			 , A_Desktop . "\" . "Cities Skylines.url"
			 , A_Desktop . "\" . "Banished.url"
			 , A_Desktop . "\" . "Block'hood.url"
			 , A_Desktop . "\" . "SimCity 4 Deluxe.url"
			 , A_Desktop . "\" . "TheoTown.url"
			 , A_Desktop . "\" . "OpenTTD.url"
			 , A_Desktop . "\" . "The Sims™ 4.url"
			 , A_Desktop . "\大秦帝国.url"
			 , A_Desktop . "\三國志漢末覇業.url"
			 , A_Desktop . "\Batman™ Arkham Knight.url"
			 , ""]

	steamGameSearch(GameArray, varSoftwarePID )
return

steamGameSearch(GameArray, ByRef varSoftwarePID )
{
	global gameLocalArray := Object()
	global steamExeArray := Object()
	global gameExeArray := Object()
	Array := [ 
			 , A_StartMenuCommon . "\Programs\Steam\Steam.lnk"
			 , A_ProgramFiles . "\Steam\Steam.exe"
			 , A_ProgramFiles . " (x86)\Steam\Steam.exe"
			 , A_StartMenu . "\Programs\Steam\Steam.lnk"
			 , A_Desktop . "\Steam.lnk"
			 , ""]
	varSoftwarePID :=
	gameRunNotPathGet :=

	if % GameArray.MaxIndex() <= 3 && GameArray != ""
	{
		For index, element in GameArray
		{
			IfExist, %element%
			{
				steamGameRun = %element%
				break
			}
			varFoundReg := gameurlGrep(element, varControlWURL, varControlWCOMMENT1, varControlWCOMMENT2, varControlW)
			If ( varFoundReg > 0 )
			{
				steamGameRun = %varControlWURL%
				break
			}
		}
		if GameArray.MaxIndex() = "" && GameArray != ""
		{
			varFoundReg := gameurlGrep(GameArray, varControlWURL, varControlWCOMMENT1, varControlWCOMMENT2, varControlW)
			IfExist, %GameArray%
			{
				steamGameRun = %GameArray%
			}
			Else If ( varFoundReg > 0 )
			{
				steamGameRun = %varControlWURL%
			}
		}
		if varControlWURL != ""
		{
			Run, open %steamGameRun%
		}
		return %steamGameRun%
	}
gameElementArray := 
gameLocalArray := GameArray
steamExeArray := Array
	For index, element in GameArray
	{
		IfNotExist, %element%
		{
			if ( element = "" )
			{
				; 空の場合、for文をやり直す。
				continue
			}
			gameRunNotPathGet = %element%
			For exeIndex, exeElement in Array
			{
				IfNotExist, %exeElement%
				{
					continue
				}
				SplitPath, exeElement, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
				toppathDir :=
				if (OutExtension == "lnk")
				{
					FileGetShortcut, %exeElement%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
					SplitPath, OutTarget, OutFileActualName, OutActualDir, OutActualExtension, OutActualNameNoExt, OutActualDrive
					exeElement = %OutTarget%
					if OutDir =
					{
						msgbox, 起動したいゲームを見つけられない1。
					}
					else
					{
						; OutDirにPathが含まれている。
						toppathDir = %OutDir%
						break
					}
				}
			}
			if toppathDir =
			{
				continue
			}
			DetectHiddenWindows, On
			UniqueID := WinExist("ahk_exe Steam.exe")
			Loop, %toppathDir%\steamapps\common\%gameRunNotPathGet%, 0, 1
			{
				WinGet, steamclose, PID, ahk_id %UniqueID%
				sleep 200
				if steamclose !=
				{
					Process, Close, %steamclose%
					steamerr := ErrorLevel
				}
				sleep 200
				steamGamefullpath := A_LoopFileFullPath
			}
			DetectHiddenWindows, Off
			if steamerr > 0 
			{
				sleep 200
				WinActivate, ahk_pid %steamclose%
			}
			IfExist, %steamGamefullpath%
			{
				gameExeArray.Insert( index "." steamGamefullpath )
			}
			steamGamefullpath := 
		}

		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		if (OutExtension == "lnk")
		{
			IfNotExist, %element%
			{
				continue
			}
			FileGetShortcut, %element%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
			if OutTarget =
			{
				exefilename = %OutNameNoExt%.exe
			}
			else
			{
				StringTrimRight, OutputVar, OutTarget, 4
				exefilename = %OutputVar%.exe
			}
		}
		else if (OutExtension == "url")
		{
			IfNotExist, %element%
			{
				continue
			}
			StringTrimRight, OutputVar, OutFileName, 4
			exefilename = %OutputVar%.exe
		}
		else
		{
			sleep 200
			DetectHiddenWindows, On
			UniqueID := WinExist("ahk_exe Steam.exe")
			DetectHiddenWindows, Off
			varFoundReg := gameurlGrep(element, varControlWURL, varControlWCOMMENT1, varControlWCOMMENT2, varControlW)
			if % StrLen(UniqueID) == 3 && varControlW == ""
			{
				exefilename = %element%
			}
			Else If ( varFoundReg > 0 )
			{
				exefilename = %varControlW%
			}
			else
			{
				continue
			}
		}

		indexII := % index - 1
		if gameElementArray =
		{
			gameElementArray = %indexII%.%exefilename%|
		}
		else
		{
			gameElementArray = %gameElementArray%|%indexII%.%exefilename%
		}
	}
	indexII := % gameLocalArray.MaxIndex()
	gameElementArray = %gameElementArray%|%indexII%.URL
wordCount := 0
For index, element in GameArray
{
	if % StrLen(element) > wordCount
	{
		wordCount = % StrLen(element)
	}
}
wordCount := wordCount*4+wordCount
xwide := wordCount-100
rowHight := GameArray.MaxIndex()
Gui, Add, ListBox, W%wordCount% R%rowHight% VsteamListBox, %gameElementArray%
GUI, Add, Button, GhelloWorld, &OK
GUI, Add, Button, x+%xwide% Hidden GVhelloWorld, &URL
Gui, Show, , ゲーム選択。
Return

GuiClose:
GuiEscape:
Gui, Destroy
return
}

;	ファクトリオ
F23 & f::
	GameArray := [ 
			 , A_Desktop . "\Factorio.url"
			 , A_Desktop . "\Flockers.url"
			 , ""]

	oneSoftware := steamGameSearch(GameArray, varSoftwarePID )
return

;;; Gvim win + v
;		https://vim-jp.org/
;		https://vim-jp.org/vimdoc-ja/
;		https://www.vim.org/
#v::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		クリップボード履歴が潰れる。

	Array := [ 
			 , A_ProgramsCommon . "\Vim 8.2\gVim.lnk"
			 , A_ProgramFiles . "\Vim\gvim.exe"
			 , A_Programs . "\Vim 8.2\gVim.lnk"
			 , A_ProgramFiles . " (x86)\Vim\gvim.exe"
			 , A_ProgramFiles . "\vim82-kaoriya-win64\gvim.exe"
			 , A_ProgramFiles . " (x86)\vim82-kaoriya-win32\gvim.exe"
			 , A_Desktop . "\gVim.lnk"
			 , ""]
	oneSoftware :=

	For index, oneSoftware in Array
	{
		IfExist, %oneSoftware%
		{
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			break
		}
	}
	IfNotExist, %oneSoftware%
	{
		Loop, %A_ProgramFiles%\gvim.exe, 0, 1
		{
			if A_LoopFileFullPath !=
			{
				Array[1] := A_LoopFileFullPath
				break
			}
		}
		IfNotExist, %oneSoftware%
		{
			 oneSoftware := A_ProgramFiles . " (x86)\gvim.exe"
			Loop, %oneSoftware%, 0, 1
			{
				if A_LoopFileFullPath !=
				{
					Array[1] := A_LoopFileFullPath
					break
				}
			}
		}
	}
	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#v")
	IfExist, %oneSoftware%
	{
		sleep 480
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

#IfWinActive ahk_group PHOTOVIEWER
Ctrl & Tab::
	WinGetClass, winClassName, ahk_group PHOTOVIEWER
	WinGet, activeWinID, IDLast, ahk_group PHOTOVIEWERCLASS
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#e::
	Run Explorer "C:\Users\"%A_UserName%, , , varExplorerPID
	sleep 240
	WinActivate, ahk_pid %varExplorerPID%
return

#IfWinActive ahk_class CabinetWClass
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class CabinetWClass
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#F13::
	Run Explorer %A_Desktop%, , , varExplorerPID
	sleep 240
	WinActivate, ahk_pid %varExplorerPID%
return

F23 & h::
	GameArray := [ 
			 , A_Desktop . "\HITMAN 2.url"
			 , A_Desktop . "\HITMAN.url"
			 , A_Desktop . "\Hitman GO Definitive Edition.url"
			 , A_Desktop . "\Hitman Absolution.url"
			 , A_Desktop . "\Hitman Blood Money.url"
			 , A_Desktop . "\Hitman Contracts.url"
			 , A_Desktop . "\Hitman 2 Silent Assassin.url"
			 , A_Desktop . "\Hitman Codename 47.url"
			 , A_Desktop . "\Sniper Ghost Warrior Contracts.url"
			 , A_Desktop . "\Zombie Army Trilogy.url"
			 , A_Desktop . "\Sniper Elite 3.url"
			 , A_Desktop . "\Sniper Elite V2.url"
			 , A_Desktop . "\Sniper Elite.url"
			 , ""]

	oneSoftware := steamGameSearch(GameArray, varSoftwarePID )
return

#^+s::
	Array := [ 
			 , A_ProgramFiles . "\sakura\sakura.exe"
			 , A_StartMenuCommon . "\Programs\サクラエディタ\サクラエディタ.lnk"
			 , A_StartMenu . "\Programs\サクラエディタ\サクラエディタ.lnk"
			 , A_ProgramFiles . " (x86)\sakura\sakura.exe"
			 , A_Desktop . "\サクラエディタ.lnk"
			 , "" ]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#^s")
;	IfExist, %oneSoftware%
;	{
;		sleep 300
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

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
			SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
			if (OutExtension == "lnk")
			{
				FileGetShortcut, %element%, OutTarget, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
				if OutTarget =
				{
					exefilename = %OutNameNoExt%.exe
				}
				else
				{
					StringTrimRight, OutputVar, OutTarget, 4
					exefilename = %OutputVar%.exe
				}
			}
			else
			{
				exefilename = %OutFileName%
			}

			sleep 1000
			Send, %originally%
			break
		}
	}

	return %element%
}

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
;		FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, , , , , Ctrl+Alt+s,
		Reload
		#NoTrayIcon
	}
return

; Excel起動
AppsKey & e::
;Pause & e::
	Array := [
			 , A_StartMenuCommon . "\Programs\Excel.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2010.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2007.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2023.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Excel 2003.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\EXCEL.EXE"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Calc.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\scalc.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\scalc.exe"
			 , A_StartMenuCommon . "\Programs\WPS Office\WPS Spreadsheets.lnk"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Calc.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\scalc.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\scalc.exe"
			 , A_StartMenu . "\Programs\Excel.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2021.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2019.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Calc.lnk"
			 , A_StartMenu . "\Programs\WPS Office\WPS Spreadsheets.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Calc.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2016.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2013.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2010.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2007.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2023.lnk"
			 , A_Desktop . "\Excel.lnk"
			 , ""]

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{AppsKey down}e{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;; Chrome win + c
#c::
	;	Windows標準のCortana起動のショートカットを潰す。

	Array := [ 
			 , A_ProgramFiles . "\Google\Chrome\Application\chrome.exe"
			 , A_StartMenuCommon . "\Programs\Google Chrome.lnk"
			 , A_StartMenu . "\Programs\Google Chrome.lnk"
			 , A_ProgramFiles . " (x86)\Google\Chrome\Application\chrome.exe"
			 , A_Desktop . "\Google Chrome.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#c")
;	IfExist, %oneSoftware%
;	{
;		sleep 280
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

#IfWinActive, ahk_exe ApplicationFrameHost.exe
Ctrl & Tab::
	WinGet, activeWinID, IDLast, ahk_class ApplicationFrameWindow
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

F19 & b::
	Run, https://github.com/asakunotomohiro/
return

;;; "Visual Studio"	開発環境 win + Alt + Ctrl + i
AppsKey & i::
	Array := [
			 , A_StartMenuCommon . "\Programs\Visual Studio 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Visual Studio 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Visual Studio 2017.lnk"
			 , A_StartMenuCommon . "\Programs\Visual Studio 2015.lnk"
			 , A_StartMenuCommon . "\Programs\Visual Studio 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Visual Studio 2012.lnk"
			 , A_StartMenu . "\Programs\Visual Studio 2013.lnk"
			 , A_StartMenu . "\Programs\Visual Studio 2012.lnk"
			 , A_Desktop . "\Visual Studio.lnk"
			 , A_WinDir . "\System32\notepad.exe"
			 , ""]

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "{AppsKey down}i{AppsKey up}", "PID")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

#^e::
;	win + Ctrl + e
;	Explorerをすべてアクティブ化する。

	WinGet, explorer, id, ahk_class CabinetWClass
	sleep 200
	WinGet, OutputList, List, ahk_class CabinetWClass
	Loop, %OutputList%
	{
		dirID := % OutputList%A_Index%
		WinActivate, ahk_id %dirID%
	}
	WinActivate, ahk_id %explorer%
return

;	Dropbox win + Alt + x
#!x::
	Array := [
			 , A_ProgramFiles . "\Dropbox\Client\Dropbox.exe"
			 , A_ProgramFiles . " (x86)\Dropbox\Client\Dropbox.exe"
			 , A_StartMenuCommon . "\Programs\Dropbox\Dropbox.lnk"
			 , A_StartMenu . "\Programs\Dropbox\Dropbox.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!x")
	IfExist, %oneSoftware%
	{
		BlockInput, On
		Run Explorer "Dropbox", , , varExplorerPID
		sleep 1000
		WinActivate, ahk_pid %varExplorerPID%
		Send, !ddropbox{Enter}
		BlockInput, Off
	}
return

#+e::
;	win + Shift + e
;	Explorerを次々に最小化にする。

	WinGet, OutputList, List, ahk_class CabinetWClass
	sleep 200	; 意味ない。
	Loop, %OutputList%
	{
		dirID := % OutputList%A_Index%
		WinMinimize, ahk_id %dirID%
	}
return

;	人形遊び
F23 & s::
	GameArray := [ 
			 , A_Desktop . "\" . "The Sims™ 4.url"
			 , ""]

	oneSoftware := steamGameSearch(GameArray, varSoftwarePID )
return

#IfWinActive ahk_exe WINWORD.EXE
Ctrl & Tab::
	WinGetClass, winClassName, ahk_exe WINWORD.EXE
	WinGet, activeWinID, IDLast, ahk_class %winClassName%
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

;;; スラックの起動 win + k
#k::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		ワイヤレスディスプレイとオーディオデバイスに接続？

	UniqueID := WinExist("ahk_exe slack.exe")
	Array := [ 
			 , A_StartMenu . "\Programs\Slack Technologies Inc\Slack.lnk"
			 , A_StartMenuCommon . "\Programs\Slack Technologies Inc\Slack.lnk"
			 , A_ProgramFiles . "\slack\slack.exe"
			 , A_ProgramFiles . " (x86)\slack\slack.exe"
			 , A_Desktop . "\Slack.lnk"
			 , ""]
	oneSoftware :=

	StringTrimRight, appdataRoaming, A_AppData, 7
	Slack := appdataRoaming . "Local\slack\slack.exe"
	IfExist, %Slack%
	{
		sleep 100
		if % StrLen(UniqueID) == 3
		{
			Run, %Slack%, , , varSlackPID
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
	else
	{
		oneSoftware := softRunGoGo(Array, varSoftwarePID, "#k")
;		IfExist, %oneSoftware%
;		{
;			sleep 200
;			WinActivate, ahk_pid %varSoftwarePID%
;		}
	}
return

;;; オリジン win + Alt + o
#^!o::
#!o::
	Array := [ 
			 , A_ProgramFiles . "\Origin\Origin.exe"
			 , A_StartMenuCommon . "\Programs\Origin\Origin.lnk"
			 , A_StartMenu . "\Programs\Origin\Origin.lnk"
			 , A_ProgramFiles . " (x86)\Origin\Origin.exe"
			 , A_Desktop . "\Origin.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#!o")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

#!i::
;	; Win+Alt+i
	Array := [
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2025.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2024.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2023.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2022.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2021.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2020.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2019.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2018.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2017.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2016.lnk"
			 , A_StartMenuCommon . "\Programs\一太郎\一太郎2015.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2019.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2020.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2021.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2022.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2023.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2024.lnk"
			 , A_StartMenu . "\Programs\一太郎\一太郎2025.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\一太郎\一太郎2010.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\一太郎\一太郎2008.lnk"
			 , A_StartMenu . "\プログラム\一太郎\一太郎2010.lnk"
			 , A_StartMenu . "\プログラム\一太郎\一太郎2008.lnk"
			 , A_StartMenuCommon . "\プログラム\一太郎\一太郎2010.lnk"
			 , A_Desktop . "\一太郎.lnk"
;			 , A_WinDir . "\System32\notepad.exe"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "#!i")
;	IfExist, %oneSoftware%
;	{
;		sleep 400
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;;	ジャストシステムのツールとユーティリティ
#!j::
;#j::
	; Win + Alt + j
	Array := [
			 , A_StartMenuCommon . "\Programs\JustSystems ツール&ユーティリティ\JustSystems ツール&ユーティリティ.lnk"
			 , A_StartMenu . "\Programs\JustSystems ツール&ユーティリティ\JustSystems ツール&ユーティリティ.lnk"
			 , A_Desktop . "\JustSystems ツール&ユーティリティ.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#^j")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;; Steam win + Alt + s
#^!s::
#!s::
	Array := [
			 , A_ProgramFiles . "\Steam\Steam.exe"
			 , A_StartMenuCommon . "\Programs\Steam\Steam.lnk"
			 , A_StartMenu . "\Programs\Steam\Steam.lnk"
			 , A_ProgramFiles . " (x86)\Steam\Steam.exe"
			 , A_Desktop . "\Steam.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "#!s")
;	IfExist, %oneSoftware%
;	{
;		sleep 150
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;; Minecraft win + Alt + m
#+!m::
#!m::
	Array := [
			 , A_StartMenuCommon . "\Programs\Minecraft\Minecraft.lnk"
			 , A_ProgramFiles . "\Minecraft\MinecraftLauncher.exe"
			 , A_ProgramFiles . " (x86)\Minecraft\MinecraftLauncher.exe"
			 , A_StartMenu . "\Programs\Minecraft\Minecraft.lnk"
			 , A_Desktop . "\Minecraft.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#!m")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

#IfWinActive ahk_exe Acrobat.exe
Ctrl & Tab::
	WinGetClass, winClassName, ahk_exe Acrobat.exe
	WinGet, activeWinID, IDLast, ahk_class %winClassName%
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

;;; Godot win + Alt + g
#^!g::
#!g::
	Array := [
			 , A_ProgramFiles . "\Godot.exe"
			 , A_ProgramFiles . "\Godot_v3.3.2-stable_win64.exe"
			 , A_ProgramFiles . "\Godot\Godot.exe"
			 , A_ProgramFiles . "\Godot\Godot_v3.3.2-stable_win64.exe"
			 , A_ProgramFiles . " (x86)\Godot.exe"
			 , A_ProgramFiles . " (x86)\Godot\Godot.exe"
			 , A_ProgramFiles . " (x86)\Godot\Godot_v3.3.2-stable_win32.exe"
			 , A_Desktop . "\Godot.exe"
			 , A_Desktop . "\Godot.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#!g")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_pid %varSoftwareID%
;	}
return

; PowerPoint起動
AppsKey & p::
;Pause & p::
	Array := [
			 , A_StartMenuCommon . "\Programs\PowerPoint.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2010.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2007.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2023.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\POWERPNT.EXE"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2024.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2023.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2022.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2020.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2018.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2017.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Agree\Agree 2015.lnk"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Impress.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\simpress.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\simpress.exe"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office PowerPoint 2003.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Agree 2010\Agree 2010.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Agree 2009\Agree 2009.lnk"
			 , A_StartMenuCommon . "\Programs\WPS Office\WPS Presentation.lnk"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Impress.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\simpress.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\simpress.exe"
			 , A_StartMenu . "\Programs\PowerPoint.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2021.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2019.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2021.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2020.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2019.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Impress.lnk"
			 , A_StartMenu . "\Programs\WPS Office\WPS Presentation.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Impress.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2016.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2013.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2010.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2007.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office PowerPoint 2023.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2024.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2023.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2022.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2018.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2017.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2016.lnk"
			 , A_StartMenu . "\Programs\Agree\Agree 2015.lnk"
			 , A_Desktop . "\Agree.lnk"
			 , ""]

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{AppsKey down}p{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;; ディスコードの起動 win + Alt + c
#!c::
	UniqueID := WinExist("ahk_exe Discord.exe")
	Array := [ 
			 , A_StartMenu . "\Programs\Discord Inc\Discord.lnk"
			 , A_StartMenuCommon . "\Programs\Discord Inc\Discord.lnk"
			 , A_Desktop . "\Discord.lnk"
			 , ""]
	oneSoftware :=

	StringTrimRight, appdataRoaming, A_AppData, 7
	Discord := appdataRoaming . "Local\Discord\Discord.exe"
	Loop, %Discord%, 0, 1
	{
		if A_LoopFileFullPath !=
		{
			Discord := A_LoopFileFullPath
			break
		}
	}
	IfExist, %Discord%
	{
		sleep 100
		if % StrLen(UniqueID) == 3
		{
			Run, %Discord%, , , varDiscordPID
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
	else
	{
		oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!c")
;		IfExist, %oneSoftware%
;		{
;			sleep 200
;			WinActivate, ahk_pid %varSoftwarePID%
;		}
	}
return

;■Gvim用の設定
#IfWinActive ahk_exe gvim.exe
BlockInput, On
#t::Send, {Esc 2}^{[}:tabnew{Enter}	; Win+tで新規タブ作成※
#w::Send, {Esc 2}^{[}:tabclose{Enter}	; Win+cでタブClose※
#m::Send, {Esc 2}^{[}:tab split{Enter}:tabprev{Enter}:close{Enter}:tabnext{Enter}	; Win+mで既存バッファをタブ移動※
	;	※Windowsのショートカットを潰す
;!Space::WinMinimize
#!d::Send, {Esc 2}^{[}:bw{Enter}	; バッファ削除。
#+!d::Send, !bd	; 不要な処理だろう。
BlockInput, Off
return
#IfWinActive

;;; Eclipse win + Alt + i
;	なぜか起動せず、対処方法がわからない。
;#!i::	win + Alt + i
Pause & i::
	Array := [
			 , "C:\pleiades\eclipse\eclipse.exe"
			 , A_ProgramFiles . "\eclipse-pleiades\eclipse\eclipse.exe"
			 , A_ProgramFiles . " (x86)\eclipse-pleiades\eclipse\eclipse.exe"
			 , ""]
	oneSoftware :=

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{Pause down}i{Pause up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

#!h::
;	花子起動。
;	; Win+Alt+h
	Array := [
			 , A_StartMenuCommon . "\Programs\花子\花子.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2025.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2024.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2023.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2022.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2021.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2020.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2019.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2018.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2017.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2016.lnk"
			 , A_StartMenuCommon . "\Programs\花子\花子2015.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\花子\花子2010.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\花子\花子2008.lnk"
			 , A_StartMenu . "\Programs\花子\花子2025.lnk"
			 , A_StartMenu . "\Programs\花子\花子2024.lnk"
			 , A_StartMenu . "\Programs\花子\花子2023.lnk"
			 , A_StartMenu . "\Programs\花子\花子2022.lnk"
			 , A_StartMenu . "\Programs\花子\花子2021.lnk"
			 , A_Desktop . "\花子.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "#!h")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;; Evernote win + Alt + e
#^!e::
#!e::
	Array := [
			 , A_ProgramFiles . "\Evernote\Evernote\Evernote.exe"
			 , A_StartMenuCommon . "\Programs\Evernote\Evernote.lnk"
			 , A_StartMenu . "\Programs\Evernote\Evernote.lnk"
			 , A_ProgramFiles . " (x86)\Evernote\Evernote\Evernote.exe"
			 , A_Desktop . "\Evernote.lnk"
			 , ""]

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "#!e")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;;; キンドル win + Alt + k
#+!k::
#!k::
	UniqueID := WinExist("ahk_exe Kindle.exe")
	Array := [ 
			 , A_ProgramFiles . "\Amazon\Kindle\Kindle.exe"
			 , A_StartMenuCommon . "\Programs\Amazon\Amazon Kindle\Kindle.lnk"
			 , A_StartMenu . "\Programs\Amazon\Amazon Kindle\Kindle.lnk"
			 , A_ProgramFiles . " (x86)\Amazon\Kindle\Kindle.exe"
			 , A_Desktop . "\Kindle.lnk"
			 , ""]
	oneSoftware :=

	StringTrimRight, appdataRoaming, A_AppData, 7
	Kindle := appdataRoaming . "Local\Amazon\Kindle\application\Kindle.exe"
	IfExist, %Kindle%
	{
		sleep 100
		if % StrLen(UniqueID) == 3
		{
			Run, %Kindle%, , , varKindlePID
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
	else
	{
		oneSoftware := softRunGoGo(Array, varSoftwarePID, "#!k")

		IfExist, %oneSoftware%
		{
			sleep 1200
			WinActivate, ahk_pid %varSoftwarePID%
		}
	}
return

; calc(三四郎)起動。
;	OpenOfficeやLibreOfficeの計算Math(要は、LaTeX)
#!t::
;	Win+Alt+t
	Array := [
			 , A_StartMenuCommon . "\Programs\calc\calc.lnk"
			 , A_StartMenuCommon . "\Programs\calc\calc 6.lnk"
			 , A_StartMenuCommon . "\Programs\calc\calc 5.lnk"
			 , A_StartMenuCommon . "\Programs\calc\calc 4.lnk"
			 , A_StartMenuCommon . "\Programs\calc\calc 3.lnk"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Math.lnk"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Math.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Math.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Math.lnk"
			 , A_StartMenu . "\Programs\calc\calc 4.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\smath.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\smath.exe"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\三四郎\三四郎2010.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\三四郎\三四郎2009.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\三四郎\三四郎2008.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\三四郎\三四郎2007.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\三四郎\三四郎2005.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\smath.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\smath.exe"
			 , A_StartMenu . "\Programs\calc\calc 6.lnk"
			 , A_StartMenu . "\Programs\calc\calc 5.lnk"
			 , A_StartMenu . "\Programs\calc\calc 3.lnk"
			 , A_StartMenu . "\Programs\calc\calc.lnk"
			 , A_StartMenu . "\Programs\三四郎\三四郎2010.lnk"
			 , A_Desktop . "\calc.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "#!+t")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

#^p::
	Array := [
			 , A_WinDir . "\system32\mspaint.exe"
			 , A_WinDir . "\System\mspaint.exe"
			 , A_WinDir . "\SysWOW64\mspaint.exe"
			 , ""]

	moveBackToFront(Array, "#^p")
return

;;; WindowsOS標準のペイント　Win＋p
#p::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		デュアルディスプレイ用のショートカット？

	Array := [
			 , A_WinDir . "\system32\mspaint.exe"
			 , A_WinDir . "\System\mspaint.exe"
			 , A_WinDir . "\SysWOW64\mspaint.exe"
			 , ""]

	softRunGoGo(Array, varSoftwarePID, "#p")
	sleep 300
	SetTitleMatchMode,2
	WinActivate ,ペイント
return

#IfWinActive ahk_exe mspaint.exe
Ctrl & Tab::
	WinGetClass, winClassName, ahk_exe mspaint.exe
	WinGet, activeWinID, IDLast, ahk_class %winClassName%
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

;;;サクラエディタ win + Ctrl + s
#^s::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		音声認識のセットアップ画面が起動する。

	Array := Object()
	Array := [
			 , A_StartMenuCommon . "\Programs\サクラエディタ\サクラエディタ.lnk"
			 , A_ProgramFiles . "\sakura\sakura.exe"
			 , A_StartMenu . "\Programs\サクラエディタ\サクラエディタ.lnk"
			 , A_ProgramFiles . " (x86)\sakura\sakura.exe"
			 , A_Desktop . "\サクラエディタ.lnk"
;			 , A_WinDir . "\System32\notepad.exe"
			 , "" ]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#^s")
;	IfExist, %oneSoftware%
;	{
;		sleep 300
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

;■秀丸エディタの設定
#IfWinActive ahk_exe Hidemaru.exe
BlockInput, On
^g::Send, !sg	; Ctrl&gによるGrep検索ダイアログを開く(その弊害で、行番号指定のジャンプができなくなる⇒ショートカットを潰したため)。
^j::Send, ^g	; Ctrl&gが上記で潰れたため、Ctrl+jで指定行移動を可能にした(本来の割当はない)。
^!f::Send, !vz	;	全画面表示(Ctrl+Alt+f)。これは、MacOSに似か寄らせた。
BlockInput, Off
return
#IfWinActive

#IfWinActive ahk_exe Code.exe
Ctrl & Tab::
	Send, {Blind}^{PgDn}
return
#IfWinActive

;;; Sourcetree win + g
#^g::
#g::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
	;	Windows標準のXboxゲーム記録用プログラムの起動を潰す(潰しきれないのだが、ショートカットを無効化した)。

	UniqueID := WinExist("ahk_exe SourceTree.exe")
	Array := [ 
			 , A_ProgramFiles . "\SourceTree\SourceTree.exe"
			 , A_StartMenu . "\Programs\Atlassian\Sourcetree.lnk"
			 , A_StartMenuCommon . "\Programs\Atlassian\Sourcetree.lnk"
			 , A_ProgramFiles . " (x86)\SourceTree\SourceTree.exe"
			 , A_Desktop . "\Sourcetree.lnk"
			 , ""]
	oneSoftware :=

	StringTrimRight, appdataRoaming, A_AppData, 7
	Sourcetree := appdataRoaming . "Local\SourceTree\SourceTree.exe"
	IfExist, %Sourcetree%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, %Sourcetree%, , , varSourcetreePID
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
	else
	{
		oneSoftware := officeRunGoGo(Array, varSoftwareID, "#g")

;		IfExist, %oneSoftware%
;		{
;			sleep 300
;			WinActivate, ahk_id %varSoftwareID%
;		}
	}
return

;	オキシゲン ノット インクルード
F23 & o::
	GameArray := A_Desktop . "\Oxygen Not Included.url"
	steamGameSearch(GameArray, varSoftwarePID )
return
VhelloWorld(gameLocalArray, gameExeArray)
{
iiElement :=
StringGetPos, steamListBoxPos, steamListBox, ., L1
StringLeft, iilistBox, steamListBox, steamListBoxPos
steamListBoxPos += 1
StringTrimLeft, guiListboxSteam, steamListBox, steamListBoxPos
iilistBox := iilistBox+1	; GUI側で選んだゲームの1文字目を添え字として抜き出す。

steamGameRun := 
For index, element in gameLocalArray
{
	if ( index == iilistBox && iilistBox != "" )
	{
		IfExist, %element%
		{
			steamGameRun = %element%
			break
		}
		else
		{
			For exeIndex, exeElement in gameExeArray
			{
				steamGameRun := 
				StringGetPos, exeGameElementPos, exeElement, ., L1
				StringLeft, iiExeIndex, exeElement, exeGameElementPos
				exeGameElementPos += 1
				StringTrimLeft, exeGameName, exeElement, exeGameElementPos
				if ( index == iiExeIndex )
				{
					steamGameRun = %exeGameName%
					break
				}
			}
			varFoundReg := gameurlGrep(element, varControlWURL, varControlWCOMMENT1, varControlWCOMMENT2, varControlW)
			If ( varFoundReg > 0 )
			{
				steamGameRun = %varControlWURL%
				break
			}
		}
	}
	else if ( iilistBox = "" )
	{
		varFoundReg := gameurlGrep(guiListboxSteam, varControlWURL, varControlWCOMMENT1, varControlWCOMMENT2, varControlW)
		If ( varFoundReg > 0 )
		{
			steamGameRun = %varControlWURL%
		}
	break
	}
}

if steamGameRun = 
{
	StringGetPos, steamListBoxPos, steamListBox, ., L1
	StringLeft, iilistBox, steamListBox, steamListBoxPos
	if ( gameLocalArray.MaxIndex() == iilistBox )
	{
		run https://github.com/asakunotomohiro/
		Gui, Show
		return
	}
	else {
		msgbox, インストールなし(%guiListboxSteam%)。
		Gui, Show
		return
	}
}
else
{
	sleep 200
	Run, open %steamGameRun%, , , varSoftwarePID
}
Gui, Destroy
return %steamGameRun%
}

;;;秀丸 win + h
#h::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		ディクテーションなるものが動くようだ。しかし、日本語運用時は動かないようだ。

	Array := [ 
			 , A_ProgramFiles . "\Hidemaru\Hidemaru.exe"
			 , A_StartMenuCommon . "\Programs\秀丸.lnk"
			 , A_StartMenu . "\Programs\秀丸.lnk"
			 , A_ProgramFiles . " (x86)\Hidemaru\Hidemaru.exe"
			 , A_Desktop . "\秀丸.lnk"
;			 , A_WinDir . "\System32\notepad.exe"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=
	UniqueID := WinExist("ahk_exe Hidemaru.exe")

For index, element in Array
{
	IF FileExist( element )
	{
		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		if (OutExtension == "lnk")
		{
			FileGetShortcut, %element%, element, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
		}
		oneSoftware = %element%
		break
	}
	Else If % index = Array.MaxIndex()-1
	{
		oneSoftware = %element%
		Send, #h
		break
	}
}
	IfExist, %oneSoftware%
	{
		WinActivate, ahk_exe %oneSoftware%
		sleep 100

		WinGetTitle, hidemaruTitle, A
		regFoundpos := RegExMatch(hidemaruTitle, ".*\(無題\).*秀丸$")
		if % StrLen(UniqueID) > 3  && regFoundpos == 0
		{
			Send, ^n
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
	else
	{
		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		if (OutExtension == "lnk")
		{
			StringTrimRight, OutputVar, OutFileName, 4
			OutFileName = %OutputVar%.exe
		}
	}
return

#IfWinActive ahk_exe OUTLOOK.EXE
Ctrl & Tab::
	WinGetClass, winClassName, ahk_exe OUTLOOK.EXE
	WinGet, activeWinID, IDLast, ahk_class %winClassName%
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

;;; Jasper soft win + Ctrl + j
#^j::
Array := [
		 , A_ProgramFiles . "\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
		 , A_ProgramFiles . " (x86)\TIBCO\Jaspersoft Studio-6.16.0\Jaspersoft Studio.exe"
		 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#^j")
;	IfExist, %oneSoftware%
;	{
;		sleep 300
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

;;; Firefoxブラウザ win + f
#f::
;	※WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
;		フィードバックHubウィンドウが起動する(普通は使わないよね)。

	Array := [ 
			 , A_ProgramFiles . "\Mozilla Firefox\firefox.exe"
			 , A_StartMenuCommon . "\Programs\Firefox.lnk"
			 , A_StartMenu . "\Programs\Firefox.lnk"
			 , A_ProgramFiles . " (x86)\Mozilla Firefox\firefox.exe"
			 , A_Desktop . "\Firefox.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "#f")
;	IfExist, %oneSoftware%
;	{
;		sleep 150
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

F19 & t::
	Run, https://twitter.com/asakunojp
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

#^v::
	; Win+Ctrl+v
	Array := [
			 , A_Desktop . "\gVim.lnk"
			 , A_ProgramsCommon . "\Vim 8.2\gVim.lnk"
			 , A_Programs . "\Vim 8.2\gVim.lnk"
			 , A_ProgramFiles . "\Vim\gvim.exe"
			 , A_ProgramFiles . "\vim82-kaoriya-win64\gvim.exe"
			 , A_ProgramFiles . " (x86)\Vim\gvim.exe"
			 , A_ProgramFiles . " (x86)\vim82-kaoriya-win32\gvim.exe"
			 , ""]
	oneSoftware :=

	For index, oneSoftware in Array
	{
		IfExist, %oneSoftware%
		{
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			break
		}
	}
	IfNotExist, %oneSoftware%
	{
		Loop, %A_ProgramFiles%\gvim.exe, 0, 1
		{
			if A_LoopFileFullPath !=
			{
				Array[1] := A_LoopFileFullPath
				break
			}
		}
		IfNotExist, %oneSoftware%
		{
			 oneSoftware := A_ProgramFiles . " (x86)\gvim.exe"
			Loop, %oneSoftware%, 0, 1
			{
				if A_LoopFileFullPath !=
				{
					Array[1] := A_LoopFileFullPath
					break
				}
			}
		}
	}

	moveBackToFront(Array, "#^v")
return

; Groove起動
AppsKey & g::
	Array := [
			 , A_StartMenuCommon . "\Programs\groove.lnk"
			 , A_StartMenu . "\Programs\groove.lnk"
			 , A_Desktop . "\groove.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}g{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
	}
return

; OneDrive起動
AppsKey & d::
;Pause & d::
	Array := [ 
			 , A_StartMenu . "\Programs\OneDrive.lnk"
			 , A_StartMenuCommon . "Programs\OneDrive.lnk"
			 , A_Desktop . "\OneDrive.lnk"
			 , ""]
	oneSoftware :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}d{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

; InfoPath起動
;AppsKey & i::
;	Array := [ 
;			 , UserProfile . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2021.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2019.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2016.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2013.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2010.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2007.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2023.lnk"
;			 , A_StartMenuCommon . "\Microsoft Office\Microsoft Office InfoPath 2003.lnk"
;			 , ""]
;	oneSoftware :=
;
;	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}i{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
;return

; Blend for Visual Studio起動
AppsKey & b::
;Pause & b::
	Array := [
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio.lnk"
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio 2019.lnk"
			 , A_StartMenu . "\Programs\Blend for Visual Studio 2021.lnk"
			 , A_StartMenu . "\Programs\Blend for Visual Studio 2019.lnk"
			 , A_StartMenu . "\Programs\Blend for Visual Studio 2017.lnk"
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio 2017.lnk"
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio 2015.lnk"
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Blend for Visual Studio 2012.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Visual Studio 2010 Express\Visual Studio コマンド プロンプト (2010).lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Visual Studio 2005\Microsoft Visual Studio 2005.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Visual Studio 6.0\Microsoft Visual C++ 6.0.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Visual Studio 6.0\Microsoft Visual Basic 6.0.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Visual Studio 6.0\Microsoft Visual InterDev 6.0.lnk"
			 , A_Desktop . "\Blend for Visual Studio.lnk"
			 , ""]

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "{AppsKey down}b{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; OneNote起動
AppsKey & n::
;Pause & n::
	Array := [
			 , A_StartMenuCommon . "\Programs\OneNote.lnk"
			 , A_StartMenu . "\Programs\OneNote.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\ONENOTE.EXE"
			 , A_Desktop . "\OneNote.lnk"
			 , ""]

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{AppsKey down}n{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; Outlook起動
AppsKey & m::
;Pause & m::
	Array := [
			 , A_StartMenuCommon . "\Programs\Outlook.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE"
			 , A_StartMenuCommon . "\Programs\Shuriken\Shuriken 2022.lnk"
			 , A_StartMenuCommon . "\Programs\Shuriken\Shuriken 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Shuriken\Shuriken 2020.lnk"
			 , A_StartMenuCommon . "\Programs\Shuriken\Shuriken 2019.lnk"
			 , A_StartMenu . "\Programs\Outlook.lnk"
			 , A_StartMenu . "\Programs\Shuriken\Shuriken 2022.lnk"
			 , A_StartMenu . "\Programs\Shuriken\Shuriken 2021.lnk"
			 , A_StartMenu . "\Programs\Shuriken\Shuriken 2020.lnk"
			 , A_StartMenu . "\Programs\Shuriken\Shuriken 2019.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Shuriken 2020\Shuriken 2020.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Shuriken 2010\Shuriken 2010.lnk"
			 , A_Desktop . "\Outlook.lnk"
			 , ""]

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{AppsKey down}m{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; PowerShell起動
AppsKey & s::
;Pause & s::
	Array := [ 
			 , A_StartMenuCommon . "\Programs\Windows PowerShell\PowerShell.lnk"
			 , A_StartMenuCommon . "\Programs\Windows PowerShell\Windows PowerShell ISE.lnk"
			 , A_StartMenu . "\Programs\Windows PowerShell\Windows PowerShell ISE.lnk"
			 , A_StartMenuCommon . "\Programs\Accessories\Windows PowerShell\Windows PowerShell ISE.lnk"
			 , A_StartMenu . "\Programs\Accessories\Windows PowerShell\Windows PowerShell ISE.lnk"
			 , A_Desktop . "\Windows PowerShell ISE.lnk"
			 , ""]

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "{AppsKey down}s{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

AppsKey & k::
;Pause & k::
	Array := [
			 , A_WinDir . "\system32\osk.exe"
			 , A_WinDir . "\System\osk.exe"
			 , A_WinDir . "\SysWOW64\osk.exe"
			 , ""]

	softRunGoGo(Array, varSoftwarePID, "{AppsKey down}k{AppsKey up}")
return

; VSCode起動
AppsKey & v::
	Array := [
			 , A_StartMenu . "\Programs\Visual Studio Code\Visual Studio Code.lnk"
			 , A_StartMenuCommon . "\Programs\Visual Studio Code\Visual Studio Code.lnk"
			 , A_Desktop . "\Visual Studio Code.lnk"
			 , ""]

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "{AppsKey down}v{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; Word起動
AppsKey & w::
;Pause & w::
	Array := [
			 , A_StartMenuCommon . "\Programs\Word.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2010.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2007.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Word 2023.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\WINWORD.EXE"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Writer.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\swriter.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\swriter.exe"
			 , A_StartMenuCommon . "\Programs\WPS Office\WPS Writer.lnk"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Writer.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Word 2003.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\swriter.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\swriter.exe"
			 , A_StartMenu . "\Programs\Word.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2021.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2019.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Writer.lnk"
			 , A_StartMenu . "\Programs\WPS Office\WPS Writer.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Writer.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2016.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2013.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2010.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2007.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Word 2023.lnk"
			 , A_Desktop . "\Word.lnk"
			 , ""]

	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{AppsKey down}w{AppsKey up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; Publisher起動
AppsKey & h::
;Pause & h::
	Array := [
			 , A_StartMenuCommon . "\Programs\Publisher.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2010.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2007.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Publisher 2023.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\MSPUB.EXE"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Draw.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\sdraw.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\sdraw.exe"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Publisher 2003.lnk"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Draw.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\sdraw.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\sdraw.exe"
			 , A_StartMenu . "\Programs\Publisher.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2021.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2019.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2016.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2013.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2010.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2007.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Publisher 2023.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Draw.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Draw.lnk"
			 , A_Desktop . "\Publisher.lnk"
			 , ""]

	oneSoftware := officeExeRunGoGo(Array, varSoftwarePID, "{AppsKey down}h{AppsKey up}", "PID")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_pid %varSoftwarePID%
;	}
return

AppsKey & u::
;Pause & u::
	Array := [
			 , A_WinDir . "\system32\calc.exe"
			 , A_WinDir . "\System\calc.exe"
			 , A_WinDir . "\SysWOW64\calc.exe"
			 , ""]

	; 起動バグあり。
	officeRunGoGo(Array, varSoftwarePID, "{AppsKey down}u{AppsKey up}")
return

;;;Notepad++の起動。 win + Alt + n
#!n::
	Array := [
			 , A_ProgramFiles . "\Notepad++\notepad++.exe"
			 , A_StartMenuCommon . "\Programs\Notepad++.lnk"
			 , A_StartMenu . "\Programs\Notepad++.lnk"
			 , A_ProgramFiles . " (x86)\Notepad++\notepad++.exe"
			 , A_Desktop . "\Notepad++.lnk"
			 , A_WinDir . "\System32\notepad.exe"
			 , "" ]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#!n")
;	IfExist, %oneSoftware%
;	{
;		sleep 300
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; Access起動
AppsKey & a::
;Pause & a::
	Array := [
			 , A_StartMenuCommon . "\Programs\Access.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2010.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2007.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Access 2023.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\MSACCESS.EXE"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Access 2003.lnk"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Base.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\sbase.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\sbase.exe"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Base.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Base.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Base.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\sbase.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\sbase.exe"
			 , A_StartMenu . "\Programs\Access.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2021.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2019.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2016.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2013.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2010.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2007.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Access 2023.lnk"
			 , A_Desktop . "\Access.lnk"
			 , ""]

	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "{AppsKey down}a{AppsKey up}", "PID")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

AppsKey & l::
;Pause & l::
	Array := [
			 , A_StartMenuCommon . "\Programs\Excel.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2021.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2019.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2016.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2013.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2010.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2007.lnk"
			 , A_StartMenuCommon . "\Programs\Microsoft Office\Microsoft Office Excel 2023.lnk"
			 , "C:\Documents and Settings\All Users\スタート メニュー\プログラム\Microsoft Office\Microsoft Office Excel 2003.lnk"
			 , A_ProgramFiles . " (x86)\Microsoft Office\root\Office16\EXCEL.EXE"
			 , A_StartMenuCommon . "\Programs\OpenOffice 4.1.10\OpenOffice Calc.lnk"
			 , A_ProgramFiles . "\OpenOffice 4\program\scalc.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 4\program\scalc.exe"
			 , A_StartMenuCommon . "\Programs\WPS Office\WPS Spreadsheets.lnk"
			 , A_StartMenuCommon . "\Programs\LibreOffice 7.0\LibreOffice Calc.lnk"
			 , A_ProgramFiles . "\OpenOffice 5\program\scalc.exe"
			 , A_ProgramFiles . " (x86)\OpenOffice 5\program\scalc.exe"
			 , A_StartMenu . "\Programs\Excel.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2021.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2019.lnk"
			 , A_StartMenu . "\Programs\OpenOffice 4.1.10\OpenOffice Calc.lnk"
			 , A_StartMenu . "\Programs\WPS Office\WPS Spreadsheets.lnk"
			 , A_StartMenu . "\Programs\LibreOffice 7.0\LibreOffice Calc.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2016.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2013.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2010.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2007.lnk"
			 , A_StartMenu . "\Programs\Microsoft Office\Microsoft Office Excel 2023.lnk"
			 , A_Desktop . "\Excel.lnk"
			 , ""]
	oneSoftware :=
	varSoftwarePID :=

	oneSoftware := softRunGoGo(Array, varSoftwarePID, "{AppsKey down}l{AppsKey up}")
	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_pid %varSoftwarePID%
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
	WinGet, exeName, ProcessName, A
	If ( varFoundRegControlWSakura > 0 && exeName = "sakura.exe" )
	{
		Send, !{F4}
	}
	else
	{
		WinClose, A
	}
return

;	■Control+wキーの組み合わせでウィンドウを閉じたい.
^w::
ingenious := ""
	WinGetClass, className, A
	ingenious := "^w"
IfNotEqual, className, CabinetWClass
{
	; バグあり。
	WinGetTitle, titleControlWName, A
	varFoundRegControlWHidemaru := RegExMatch(titleControlWName, ".*(秀丸)$", varControlW)
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
	varFoundRegControlWPowerShell := RegExMatch(titleControlWName, ".*(Windows PowerShell).*$", varControlW)
	varFoundRegControlWVSCode := RegExMatch(titleControlWName, ".*(Visual Studio Code).*$", varControlW)
	varFoundRegControlWEvernoteChild := RegExMatch(titleControlWName, ".*(?!.*com - )(Evernote)$", varControlW)
	varFoundRegControlWPhotoView := RegExMatch(titleControlWName, ".*( - Windows フォト ビューアー).*$", varControlW)
;	varFoundRegControlWGVIM := RegExMatch(titleControlWName, ".*(GVIM).*$", varControlW)
		; 正規表現：http://uxmilk.jp/50674
	If ( ErrorLevel <> 0 )
	{
		MsgBox, 正規表現ErrorLevel：%ErrorLevel%
	}
	WinGet, exeName, ProcessName, A
	If ( varFoundRegControlWHidemaru > 0 && exeName = "hidemaru.exe")
	{
		ingenious := "!fx"
	}
	Else If ( varFoundRegControlWSakura > 0 && exeName = "sakura.exe" )
	{
		ingenious := "!fc"
	}
	Else If ( varFoundRegControlWPowerShell > 0 && exeName = "PowerShell_ISE.exe" )
	{
		ingenious := "^{F4}"
	}
	Else If ( varFoundRegControlWVSCode > 0 && exeName = "Code.exe" )
	{
		ingenious := "^{F4}"
	}
	Else If ( varFoundRegControlWPhotoView > 0 && exeName = "" )
	{
		ingenious := "!{F4}"
	}
;	Else If ( varFoundRegControlWGVIM > 0 )
;	{
;		Send, ^w
;	}
}
	Send, %ingenious%
return

#^c::
	; Win+Ctrl+c
	Array := [
			 , A_ProgramFiles . "\Google\Chrome\Application\chrome.exe"
			 , A_StartMenuCommon . "\Programs\Google Chrome.lnk"
			 , A_StartMenu . "\Programs\Google Chrome.lnk"
			 , A_ProgramFiles . " (x86)\Google\Chrome\Application\chrome.exe"
			 , A_Desktop . "\Google Chrome.lnk"
			 , ""]

	moveBackToFront(Array, "#^c")
return

;;; InfinityネットワークCAD win + Alt + c
;	現在は、jw_cadを起動するようにしている。
;#!c::
;#!j::
#!w::
	Array := [
			 , A_ProgramFiles . "\AisanTechnology\WingneoINFINITY\WNI64UTL\UTIL\StartWos.exe"
			 , A_ProgramFiles . " (x86)\AisanTechnology\WingneoINFINITY\WNI64UTL\UTIL\StartWos.exe"
			 , ""]
	; 以下、インストール先のPathを変更する必要が出てくることだろう。
	Array := [
			 , A_StartMenuCommon . "\Programs\Jw_cad\jw_cad.lnk"
			 , A_StartMenu . "\Programs\Jw_cad\jw_cad.lnk"
			 , "C:\jww\Jw_win.exe"
			 , A_Desktop . "\jw_cad.lnk"
			 , ""]
	oneSoftware :=

;For index, element in Array
;{
;	IF FileExist( element )
;	{
;		softwareRunString := element . " /NET /N"
;		Run, %softwareRunString%, , , varSoftwarePID
;		oneSoftware = %element%
;		break
;	}
;	Else If % index = Array.MaxIndex()
;	{
;		break
;	}
;}
;	IfExist, %oneSoftware%
;	{
;		sleep 800
;
;		WinGetTitle, titleNameGet, INFINITY
;		if titleNameGet =
;		{
;			WinGetTitle, titleNameGet, WingFan
;		}
;		WinGetClass, OutputVar, %titleNameGet%
;		WinActivate ahk_class %OutputVar%
;	}
	oneSoftware := officeExeRunGoGo(Array, varSoftwareID, "#!c")

	IfExist, %oneSoftware%
	{
		sleep 200
		WinActivate, ahk_id %varSoftwareID%
	}
return

#^h::
	; Win+Ctrl+h
	Array := [
			 , A_ProgramFiles . "\Hidemaru\Hidemaru.exe"
			 , A_StartMenuCommon . "\Programs\秀丸.lnk"
			 , A_StartMenu . "\Programs\秀丸.lnk"
			 , A_ProgramFiles . " (x86)\Hidemaru\Hidemaru.exe"
			 , A_Desktop . "\秀丸.lnk"
			 , ""]

	moveBackToFront(Array, "#^h")
return

#^f::
	; Win+Ctrl+f
	Array := [
			 , A_ProgramFiles . "\Mozilla Firefox\firefox.exe"
			 , A_StartMenuCommon . "\Programs\Firefox.lnk"
			 , A_StartMenu . "\Programs\Firefox.lnk"
			 , A_ProgramFiles . " (x86)\Mozilla Firefox\firefox.exe"
			 , A_Desktop . "\Firefox.lnk"
			 , ""]

	moveBackToFront(Array, "#^f")
return

#^x::
	;	Win+Ctrl+x
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

; Bash on Ubuntu on Windows
;F23 & u::
;Pause & u::
F10 & u::
	Array := [
			 , A_WinDir . "\System32\bash.exe"
			 , A_StartMenu . "\Programs\Bash on Ubuntu on Windows.lnk"
			 , A_StartMenuCommon . "\Programs\Bash on Ubuntu on Windows.lnk"
			 , A_WinDir . "\System\bash.exe"
			 , A_WinDir . "\SysWOW64\bash.exe"
			 , A_Desktop . "\bash.lnk"
			 , ""]

														; uを上げ下げさせる方がいい？
	oneSoftware := officeRunGoGo(Array, varSoftwareID, "{F10 down}u{F10 up}")
;	IfExist, %oneSoftware%
;	{
;		sleep 200
;		WinActivate, ahk_id %varSoftwareID%
;	}
return

; ■Eclipseの設定
#IfWinActive ahk_exe eclipse.exe
^g::Send, !aa	; Ctrl&gによるGrep検索ダイアログを開く(既存ショートカットキーを潰した)
^j::Send, ^l	; Ctrl&jによる指定行移動ダイアログを開く
return
#IfWinActive

;	サウンドトラック(Playの頭文字)
F23 & p::
	GameArray := [ 
			 , A_Desktop . "\" . "Oxygen Not Included Soundtrack.url"
			 , A_Desktop . "\" . "DEATH STRANDING Soundtrack Expanded Edition.url"
			 , A_Desktop . "\" . "This War of Mine Soundtrack.url"
			 , A_Desktop . "\" . "Hacknet - Labyrinths Official Soundtrack.url"
			 , A_Desktop . "\" . "Hacknet Official Soundtrack.url"
			 , A_Desktop . "\" . "Shadow Tactics Blades of the Shogun - Official Soundtrack.url"
			 , A_Desktop . "\" . "Space Haven Soundtrack.url"
			 , A_Desktop . "\" . "This War of Mine Soundtrack.url"
			 , ""]

	steamGameSearch(GameArray, varSoftwarePID )
return

#IfWinActive ahk_exe POWERPNT.EXE
Ctrl & Tab::
	WinGetClass, winClassName, ahk_exe POWERPNT.EXE

	WinGet, activeWinID, IDLast, ahk_class %winClassName%
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

; ■App+Space
;	Win+Spaceは、WindowOS標準のショートカットキーを上書きすることになるため、気をつけること。
#Space::
;AppsKey & Space::
	WinMinimize, A
return

#IfWinActive ahk_exe ONENOTE.EXE
Ctrl & Tab::
	WinGetClass, winClassName, ahk_exe ONENOTE.EXE
	WinGet, activeWinID, IDLast, ahk_class %winClassName%
	WinActivate, ahk_id %activeWinID%
return
#IfWinActive

#+!^c::
	Menu, TRAY, Icon
	TrayTip, "make", (c)asakunotomohiro`ndate：2021/07/01`nAHKVer：%A_AhkVersion%`ndate：%A_YYYY%/%A_MM%/%A_DD%(%A_DDDD%) %A_Hour%:%A_Min% %A_Sec%.%A_MSec%, 3 , 0
	sleep 3000
	Menu, TRAY, NoIcon
return

F13::
	WinActivate, ahk_class CabinetWClass
return

; タスクマネージャ起動
AppsKey & t::
;Pause & t::
BlockInput, On
	Send, ^+{Esc}
BlockInput, Off
return

;	Alt+Ctrl+PrtSc ⇒ Win+Shift+S
!^PrintScreen::
BlockInput, On
	Send, #+s
BlockInput, Off
return

#+x::
	; Win+Shift+x
	;	Dropboxディレクトリをアクティブにする。

	Array := [
			 , A_ProgramFiles . "\Dropbox\Client\Dropbox.exe"
			 , A_StartMenuCommon . "\Programs\Dropbox\Dropbox.lnk"
			 , A_ProgramFiles . " (x86)\Dropbox\Client\Dropbox.exe"
			 , A_StartMenu . "\Programs\Dropbox\Dropbox.lnk"
			 , A_Desktop . "\Dropbox.lnk"
			 , ""]
	oneSoftware :=

	For index, oneSoftware in Array
	{
		IF FileExist( oneSoftware )
		{
			break
		}
	}

	IfExist, %oneSoftware%
	{
		WinGet, activeWinID, IDLast, ahk_class CabinetWClass, Dropbox
		WinActivate, ahk_id %activeWinID%
	}
return


LWin & Pause::
	BlockInput, On
	Send, {LWin Down}{Pause}{LWin Up}
	BlockInput, Off
return

moveBackToFront(Array, originally)
{
	varSoftwarePID :=

For index, element in Array
{
	IF FileExist( element )
	{

		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		if (OutExtension == "lnk")
		{
			FileGetShortcut, %element%, element, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
			exeelement = %element%
		}
		else
		{
			exeelement = %OutFileName%
		}
		reElement := element

		strSplitArray := StrSplit(element, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]

		WinGet, activeID, ID, A
		WinGet, serch_ID, ID, ahk_exe %exename%
		WinGet, activeWinID, IDLast, ahk_exe %exename%

		if ( activeID == serch_ID )
		{
			WinActivate, ahk_id %activeWinID%
			WinGet, varSoftwarePID, PID, ahk_id %activeWinID%
		}
		else if ( serch_ID != "")
		{
			WinActivate, ahk_id %serch_ID%
			WinGet, varSoftwarePID, PID, ahk_id %serch_ID%
		}
		else
		{
			softRunGoGo(Array, varSoftwarePID, originally)
		}
		break
	}
	Else If % index == Array.MaxIndex()-1
	{
		if (OutExtension == "lnk")
		{
			StringTrimRight, OutputVar, OutFileName, 4
			exename = %OutputVar%.exe
		}
		sleep 1000
		Send, %originally%
		break
	}
}

	return %reElement%
}

^h::Send {Backspace}

officeExeRunGoGo(Array, ByRef varSoftwareActive, originally, whichIDorPID = "ID")
{
	varSoftwareActive :=

	For index, element in Array
	{
		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		if (OutExtension == "lnk")
		{
			FileGetShortcut, %element%, element, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
			if OutDir =
			{
				StringTrimRight, OutputVar, OutFileName, 4
				exename = %OutputVar%.exe
			}
			else
			{
				strSplitArray := StrSplit(element, "\" )
				ii := strSplitArray.MaxIndex()
				exename := strSplitArray[ii]
			}
		}
		else
		{
			exename = %OutFileName%
		}
		reElement := element

		IF FileExist( element )
		{
			WinGet, OutputList, List, ahk_exe %element%
			if OutputList > 1 
			{
				WinGet, activeID, ID, A
				WinGetClass, winClassName, ahk_exe %element%
				WinGet, serch_ID, ID, ahk_exe %element%
				WinGet, activeWinID, IDLast, ahk_exe %element%

				sleep 200
				;	バグがあり、旨く切り替えてくれない。
				if ( activeID == serch_ID )
				{
					if ( whichIDorPID = "ID" )
					{
						varSoftwareActive := activeWinID
					}
					else if ( whichIDorPID = "PID" )
					{
						WinGet, varSoftwareActive, PID, ahk_id %activeWinID%
					}
				}
				else
				{
					if ( whichIDorPID = "ID" )
					{
						varSoftwareActive := serch_ID
					}
					else if ( whichIDorPID = "PID" )
					{
						WinGet, varSoftwareActive, PID, ahk_id %serch_ID%
					}
				}

			}
			else if OutputList > 0 
			{
				if ( whichIDorPID = "ID" )
				{
					WinGet, activeWinID, ID, ahk_exe %element%
					varSoftwareActive := activeWinID
				}
				else if ( whichIDorPID = "PID" )
				{
					WinGet, varSoftwareActive, PID, ahk_id %activeWinID%
				}
			}
			else
			{
				Run, open %element%, , , varSoftwarePID
				sleep 100
				WinGet, varSoftwareActive, ID, ahk_pid %varSoftwarePID%
				oneSoftware = %element%
			}
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			arrayOneTemp := Array[2]
			SplitPath, arrayOneTemp, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
			if arrayOneTemp !=
			{
				Loop, %A_StartMenuCommon%\*%OutNameNoExt%*, 0, 1
				{
					if A_LoopFileFullPath !=
					{
						reElement := A_LoopFileFullPath
						break
					}
				}
				IfNotExist, %oneSoftware%
				{
					Loop, %A_StartMenu%\*%OutNameNoExt%*, 0, 1
					{
						if A_LoopFileFullPath !=
						{
							reElement := A_LoopFileFullPath
							break
						}
					}
				}
			}
			IF FileExist( reElement )
			{
				Run, open %reElement%, , , varSoftwareActive
			}
			else
			{
				exeelement = %OutNameNoExt%
			}
		}
	}

	if ( whichIDorPID = "ID" && varSoftwareActive != "" )
	{
		WinActivate, ahk_id %varSoftwareActive%
	}
	else if ( whichIDorPID = "PID" && varSoftwareActive != "" )
	{
		WinActivate, ahk_pid %varSoftwareActive%
	}
	return %reElement%
}
helloWorld:
	GUI, Submit
	VhelloWorld(gameLocalArray, gameExeArray)
return

gameurlGrep(urlname, ByRef grepURL, ByRef grepFrontComment, ByRef grepBackComment, ByRef grepExefilename )
{
	varControlW :=
	grepURL :=
	grepFrontComment :=
	grepBackComment :=
	grepExefilename :=
	urlname := Trim(urlname)
	varFoundReg := RegExMatch(urlname, "i)(?P<COMMENT1>.*)(?P<URL>\bsteam://rungameid/\d+\b)(?P<COMMENT2>.*)", varControlW)
	grepURL := Trim(varControlWURL,  " `t|`n")
	grepFrontComment := Trim(varControlWCOMMENT1, " `t|`n")
	grepBackComment := Trim(varControlWCOMMENT2,  " `t|`n")
	grepExefilename = %grepBackComment%%grepFrontComment%	%grepURL%

	return varFoundReg
}

officeRunGoGo(Array, ByRef varSoftwareID, originally)
{
	varSoftwareID :=
	reElement :=

	For index, element in Array
	{
		SplitPath, element, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		IF FileExist( element )
		{
			if (OutExtension == "lnk")
			{
				FileGetShortcut, %element%, element, OutDir, OutArgs, OutDescription, OutIcon, OutIconNum, OutRunState
				reElement = %element%
				if OutDir !=
				{
					exeelement = %OutNameNoExt%.exe
					element = %OutDir%\%exeelement%
				}
				else
				{
					exeelement = %element%
				}
			}
			else
			{
				reElement := element
				exeelement = %OutFileName%
			}
			WinGet, OutputList, List, ahk_exe %exeelement%
			if OutputList > 0 
			{
				sleep 200
				WinGet, activeID, ID, A
				WinGetClass, winClassName, ahk_exe %exeelement%
				WinGet, serch_ID, ID, ahk_class %winClassName%
				WinGet, activeWinID, IDLast, ahk_class %winClassName%

				sleep 200
				if ( activeID == serch_ID )
				{
					varSoftwareID := activeWinID
				}
				else
				{
					varSoftwareID := serch_ID
				}
			}
			else
			{
				; 起動
				Run, open %element%, , , varSoftwarePID
				WinGet, varSoftwareID, ID, ahk_pid %varSoftwarePID%
			}
			break
		}
		Else If % index == Array.MaxIndex()-1
		{
			arrayOneTemp := Array[2]
			SplitPath, arrayOneTemp, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
			if arrayOneTemp !=
			{
				Loop, %A_StartMenuCommon%\*%OutNameNoExt%*, 0, 1
				{
					if A_LoopFileFullPath !=
					{
						reElement := A_LoopFileFullPath
						break
					}
				}
				IfNotExist, %oneSoftware%
				{
					Loop, %A_StartMenu%\*%OutNameNoExt%*, 0, 1
					{
						if A_LoopFileFullPath !=
						{
							reElement := A_LoopFileFullPath
							break
						}
					}
				}
			}
			IF FileExist( reElement )
			{
				Run, open %reElement%, , , varSoftwarePID
			}
			else
			{
				exeelement = %OutNameNoExt%
			}

			sleep 500
			break
		}
	}

	; ここでアクティブにする必要あるか？
	WinActivate, ahk_id %varSoftwareID%
	return %reElement%
}

;	町作り
F23 & c::
	GameArray := [ 
			 , A_Desktop . "\" . "SimCity™.lnk"
			 , A_Desktop . "\" . "Cities Skylines.url"
			 , A_Desktop . "\" . "天穂のサクナヒメ.url"
			 , A_Desktop . "\" . "Surviving Mars.url"
			 , A_Desktop . "\" . "Banished.url"
			 , A_Desktop . "\" . "Block'hood.url"
			 , A_Desktop . "\" . "SimCity 4 Deluxe.url"
			 , A_Desktop . "\" . "TheoTown.url"
			 , A_Desktop . "\" . "OpenTTD.url"
			 , A_Desktop . "\大秦帝国.url"
			 , A_Desktop . "\Three Kingdoms The Last Warlord.url"
			 , A_Desktop . "\Batman™ Arkham Knight.url"
			 , A_Desktop . "\" . "Tropico 6.url"
			 , A_Desktop . "\" . "Tropico 4.url"
			 , A_Desktop . "\" . "Tropico 5.url"
			 , ""]

	steamGameSearch(GameArray, varSoftwarePID )
return

;■市販品のキーボード対応
; ■CapslockをCtrlキーに入れ替える.

;	以上。ここまで。
; vim:set ts=4 sts=4 sw=4 tw=0:
