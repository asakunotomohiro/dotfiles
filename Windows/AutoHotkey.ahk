#UseHook
^h::Send {Backspace}

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

; ��IME�ϊ��i���{��E�p��؂�ւ��j
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
;				c	googleChrome�u���E�U(��)
;				f	Firefox�u���E�U(��)
;				g	Sourcetree(��)
;				h	�G�ۃG�f�B�^(��)
;				p	�y�C���g(��)
;				v	Gvim�G�f�B�^(��)
;		Win�L�[ + Ctrl�L�[ + �W���L�[
;				s	�T�N���G�f�B�^(��)
;		Win�L�[ + Alt�L�[ + �W���L�[
;				r
;				e	�\��ς�
;				i	IDE(Eclipse)	"C:\pleiades\eclipse\eclipse.exe"
;				j	Jasper soft
;				k	Kindle
;				m	�\��ς�
;				o	�\��ς�
;				s	�\��ς�
;				x	�\��ς�
;		Win�L�[ + Alt�L�[ + Ctrl�L�[ + �W���L�[
;				i	IDE(VSCode)
;				x	Explorer�����ׂăA�N�e�B�u�ɂ���(dropbox�ȊO)�B
;		Win�L�[ + Alt�L�[ + Shift�L�[ + �W���L�[
;				x	Explorer�����ׂăA�N�e�B�u�ɂ���(dropbox����)�B
;		Win�L�[ + Shift�L�[ + �W���L�[
;				x	Explorer�����ׂăA�N�e�B�u�ɂ���B
;		Win�L�[ + Ctrl�L�[ + �W���L�[
;				x	Explorer�����ׂčŏ�������(��O�Ȃ�)�B
;		��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB

#+!e::
	evernote := "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
	IfNotExist, %evernote%
	{
		evernote := "C:\Program Files\Evernote\Evernote\Evernote.exe"
		IfNotExist, %evernote%
		{
			Send, #!e
		}
	}
	IfExist, %evernote%
	{
		WinGet, OutputVar, List, ahk_exe %evernote%
		WinGet, activeWinID, IDLast, ahk_exe %evernote%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			evernoteID := % OutputVar%A_Index%
			if ( evernoteID == activeWinID )
			{
				WinActivate, ahk_id %evernoteID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

#+c::
	googleChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
	IfNotExist, %googleChrome%
	{
		googleChrome := "C:\Program Files\Google\Chrome\Application\chrome.exe"
		IfNotExist, %googleChrome%
		{
			Send, #c
		}
	}
	IfExist, %googleChrome%
	{
		WinGet, OutputVar, List, ahk_exe %googleChrome%
		WinGet, activeWinID, IDLast, ahk_exe %googleChrome%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			chromeID := % OutputVar%A_Index%
			if ( chromeID == activeWinID )
			{
				WinActivate, ahk_id %chromeID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

#+f::
	firefoxBrowser := "C:\Program Files\Mozilla Firefox\firefox.exe"
	IfNotExist, %firefoxBrowser%
	{
		firefoxBrowser := "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
		IfNotExist, %firefoxBrowser%
		{
			Send, #f
		}
	}
	IfExist, %firefoxBrowser%
	{
		WinGet, OutputVar, List, ahk_exe %firefoxBrowser%
		WinGet, activeWinID, IDLast, ahk_exe %firefoxBrowser%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			firefoxID := % OutputVar%A_Index%
			if ( firefoxID == activeWinID )
			{
				WinActivate, ahk_id %firefoxID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

#+p::
	paint := systemroot . "\system32\mspaint.exe"
	WinGet, OutputVar, List, ahk_exe %paint%
	WinGet, activeWinID, IDLast, ahk_exe %paint%
	Loop, %OutputVar%
	{
		WinGetClass, OutputVar, ahk_id A_LoopField
		paintID := % OutputVar%A_Index%
		if ( paintID == activeWinID )
		{
			WinActivate, ahk_id %paintID%
		}
		else
		{
			WinActivate, ahk_id %activeWinID%
			break
		}
	}
return

#+^s::
	sakura := "C:\Program Files\sakura\sakura.exe"
	IfNotExist, %sakura%
	{
		sakura := "C:\Program Files (x86)\sakura\sakura.exe"
		IfNotExist, %sakura%
		{
			Send, #^s
		}
	}
	IfExist, %sakura%
	{
		WinGet, OutputVar, List, ahk_exe %sakura%
		WinGet, activeWinID, IDLast, ahk_exe %sakura%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			sakuraID := % OutputVar%A_Index%
			if ( sakuraID == activeWinID )
			{
				WinActivate, ahk_id %sakuraID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

#+h::
	hidemaru := "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
	strSplitArray := StrSplit(hidemaru, "\" )
	ii := strSplitArray.MaxIndex()
	exename := strSplitArray[ii]
	IfNotExist, %hidemaru%
	{
		hidemaru := "C:\Program Files\Hidemaru\Hidemaru.exe"
		strSplitArray := StrSplit(hidemaru, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		IfNotExist, %hidemaru%
		{
			Send, #h
		}
	}
	IfExist, %hidemaru%
	{
		WinGet, OutputVar, List, ahk_exe %exename%
		WinGet, activeWinID, IDLast, ahk_exe %exename%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			hidemaruID := % OutputVar%A_Index%
			if ( hidemaruID == activeWinID )
			{
				WinActivate, ahk_id %hidemaruID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

#+v::
	gvimEditor := "C:\Program Files\vim81-kaoriya-win64\gvim.exe"
	IfNotExist, %gvimEditor%
	{
		gvimEditor := "C:\Program Files (x86)\vim82-kaoriya-win64\gvim.exe"
		IfNotExist, %gvimEditor%
		{
			send, #v
		}
	}
	IfExist, %gvimEditor%
	{
		strSplitArray := StrSplit(gvimEditor, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		WinGet, OutputVar, List, ahk_exe %exename%
		WinGet, activeWinID, IDLast, ahk_exe %exename%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			gvimID := % OutputVar%A_Index%
			if ( gvimID == activeWinID )
			{
				WinActivate, ahk_id %gvimID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

;Win+Alt+r
;		AHK�����[�h
;		XboxGameBar�֘A���D�悳���悤�ŁA�����[�h����Ȃ��B
#NoTrayIcon
#!r::
	scriptname := ""
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
		MsgBox, err�����FErrorLevel�FA_LineNumber
	}
	If ( varFoundRegReload > 0 )
	{
		;FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, , , , , Ctrl+Alt+s,
		Reload
		#NoTrayIcon
	}
return

;;; �A�v���̏I��
#q::
	WinGetTitle, titleControlWName, A
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
	If ( ErrorLevel <> 0 )
	{
		MsgBox, #q�F%ErrorLevel%�F%A_LineNumber%
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

;;; Gvim win + v
#v::
	softwareRun := "C:\Program Files\vim81-kaoriya-win64\gvim.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�N���b�v�{�[�h�������ׂ��B
	IfExist, %softwareRun%
	{
		Run, %softwareRun%, , , runPID
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\vim82-kaoriya-win64\gvim.exe"
		strSplitArray := StrSplit(softwareRun, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		IfExist, %softwareRun%
		{
			Run, %softwareRun%, , , runPID
		}
		else
		{
			Menu, TRAY, Icon
			TrayTip, %exename%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
			sleep 1000
			Menu, TRAY, NoIcon
			Send, #v
		}
	}
	IfExist, %softwareRun%
	{
		sleep 550
		strSplitArray := StrSplit(softwareRun, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		WinActivate, ahk_exe %exename%
	}
return

;;; Chrome win + c
;#!c::
#c::
	softwareRun := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
	;	Windows�W����Cortana�N���̃V���[�g�J�b�g��ׂ��B
	IfExist, %softwareRun%
	{
		Run, %softwareRun%, , , softwarePID
	}
	else
	{
		softwareRun := "C:\Program Files\Google\Chrome\Application\chrome.exe"
		IfExist, %softwareRun%
		{
			Run, %softwareRun%, , , softwarePID
		}
		else
		{
			Send, #c
		}
	}
	IfExist, %softwareRun%
	{
		sleep 150
		WinActivate, ahk_pid %softwarePID%
	}
return

;;; Evernote win + Alt + e
#!e::
	softwareRun := "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
	UniqueID := WinExist("ahk_exe Evernote.exe")
	IfExist, %softwareRun%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files\Evernote\Evernote\Evernote.exe"
		IfExist, %softwareRun%
		{
			if % StrLen(UniqueID) == 3
			{
				Run, %softwareRun%, , , softwarePID
			}
		}
		else
		{
			Send, #!e
		}
	}
	IfExist, %softwareRun%
	{
		sleep 150
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe %softwareRun%
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; Firefox�u���E�U win + f
#f::
	softwareRun := "C:\Program Files\Mozilla Firefox\firefox.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�t�B�[�h�o�b�NHub�E�B���h�E���N������(���ʂ͎g��Ȃ����)�B
	IfExist, %softwareRun%
	{
		Run, %softwareRun%, , , softwarePID
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
		IfExist, %softwareRun%
		{
			Run, %softwareRun%, , , softwarePID
		}
		else
		{
			Send, #f
		}
	}
	IfExist, %softwareRun%
	{
		sleep 800
		WinActivate, Mozilla Firefox
	}
return

;;; Sourcetree win + g
#+g::
#g::
	StringTrimRight, appdataRoaming, A_AppData, 7
	softwareRun := appdataRoaming . "Local\SourceTree\SourceTree.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		Windows�W����Xbox�Q�[���L�^�p�v���O�����̋N����ׂ�(�ׂ�����Ȃ��̂����A�V���[�g�J�b�g�𖳌�������)�B
	IfExist, %softwareRun%
	{
		UniqueID := WinExist("ahk_exe SourceTree.exe")
		if % StrLen(UniqueID) == 3
		{
			Run, %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\SourceTree\SourceTree.exe"
		IfExist, %softwareRun%
		{
			UniqueID := WinExist("ahk_exe SourceTree.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, %softwareRun%, , , softwarePID
			}
		}
		else
		{
			softwareRun := "C:\Program Files\SourceTree\SourceTree.exe"
			IfExist, %softwareRun%
			{
				UniqueID := WinExist("ahk_exe SourceTree.exe")
				if % StrLen(UniqueID) == 3
				{
					Run, %softwareRun%, , , softwarePID
				}
			}
			else
			{
				Send, #g
			}
		}
	}
	IfExist, %softwareRun%
	{
		sleep 250
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe SourceTree.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
	; �V���[�g�J�b�g�t�@�C���ł̃v���O�����N���͂ł��Ȃ��悤���B
return

;;;�G�� win + h
#h::
	softwareRun := "C:\Program Files (x86)\Hidemaru\Hidemaru.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�f�B�N�e�[�V�����Ȃ���̂������悤���B�������A���{��^�p���͓����Ȃ��悤���B
	strSplitArray := StrSplit(softwareRun, "\" )
	ii := strSplitArray.MaxIndex()
	exename := strSplitArray[ii]
	IfExist, %softwareRun%
	{
		UniqueID := WinExist("ahk_exe Hidemaru.exe")
		if % StrLen(UniqueID) == 3
		{
			Run, %softwareRun%, , , varHidemaruPID
		}
	}
	else
	{
		softwareRun := "C:\Program Files\Hidemaru\Hidemaru.exe"
		strSplitArray := StrSplit(softwareRun, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		IfExist, %softwareRun%
		{
			UniqueID := WinExist("ahk_exe Hidemaru.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, %softwareRun%, , , varHidemaruPID
			}
		}
		else
		{
			TrayTip, %exename%, Path���������Ȃ����A�C���X�g�[������Ă��Ȃ��B, 3, 0
			Send, #h
		}
	}
	IfExist, %softwareRun%
	{
		sleep 100
		strSplitArray := StrSplit(softwareRun, "\" )
		ii := strSplitArray.MaxIndex()
		exename := strSplitArray[ii]
		WinActivate, ahk_exe %exename%
		WinGetTitle, softwareTitle, ahk_exe %exename%
		regFoundpos := RegExMatch(softwareTitle, ".*\(����\).*�G��$")
		if % StrLen(UniqueID) > 3  && regFoundpos == 0
		{
			sleep 100
			Send, ^n
			;	���Q������A�N���Ɏ��Ԃ�������B
		}
	}
return

;;; Eclipse win + Alt + i
;	�Ȃ����N�������A�Ώ����@���킩��Ȃ��B
#!i::
	softwareRun := "C:\pleiades\eclipse\eclipse.exe"
	UniqueID := WinExist("ahk_exe eclipse.exe")
	IfExist, %softwareRun%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, open %softwareRun%, ,  UseErrorLevel, softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\eclipse-pleiades\eclipse\eclipse.exe"
		IfExist, %softwareRun%
		{
			UniqueID := WinExist("ahk_exe eclipse.exe")
			if % StrLen(UniqueID) == 3
			{
				Run, open %softwareRun%, ,  UseErrorLevel, softwarePID
			}
		}
		else
		{
			softwareRun := "C:\Program Files\eclipse-pleiades\eclipse\eclipse.exe"
			IfExist, %softwareRun%
			{
				UniqueID := WinExist("ahk_exe eclipse.exe")
				if % StrLen(UniqueID) == 3
				{
					Run, open %softwareRun%, ,  UseErrorLevel, softwarePID
				}
			}
			else
			{
				Send, #!i
			}
		}
	}
	IfExist, %softwareRun%
	{
		sleep 250
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe eclipse.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; VisualStudioCode win + Alt + Ctrl + i
#!^i::
	StringTrimRight, appdataRoaming, A_AppData, 7
	softwareRun := appdataRoaming . "Local\Programs\Microsoft VS Code\Code.exe"
	UniqueID := WinExist("ahk_exe Code.exe")
	IfExist, %softwareRun%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\Microsoft VS Code\Code.exe"
		IfExist, %softwareRun%
		{
			if % StrLen(UniqueID) == 3
			{
				Run, %softwareRun%, , , softwarePID
			}
		}
		else
		{
			softwareRun := "C:\Program Files\Microsoft VS Code\Code.exe"
			IfExist, %softwareRun%
			{
				if % StrLen(UniqueID) == 3
				{
					Run, %softwareRun%, , , softwarePID
				}
			}
			else
			{
				Send, #g
			}
		}
	}
	IfExist, %softwareRun%
	{
		sleep 250
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe Code.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; Jasper soft win + Alt + j
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
			Send, #!j
		}
	}
	IfExist, %jaspersoft%
	{
		sleep 150
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe %jaspersoft%
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; �L���h�� win + Alt + k
#+!k::
#!k::
	StringTrimRight, appdataRoaming, A_AppData, 7
	softwareRun := appdataRoaming . "Local\Amazon\Kindle\application\Kindle.exe"
	IfExist, %softwareRun%
	{
		UniqueID := WinExist("ahk_exe Kindle.exe")
		if % StrLen(UniqueID) == 3
		{
			sleep 100
			Run, %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\Amazon\Kindle\Kindle.exe"
		IfExist, %softwareRun%
		{
			UniqueID := WinExist("ahk_exe Kindle.exe")
			if % StrLen(UniqueID) == 3
			{
				sleep 100
				Run, %softwareRun%, , , softwarePID
			}
		}
		else
		{
			softwareRun := "C:\Program Files\Amazon\Kindle\Kindle.exe"
			IfExist, %softwareRun%
			{
				UniqueID := WinExist("ahk_exe Kindle.exe")
				if % StrLen(UniqueID) == 3
				{
					sleep 100
					Run, %softwareRun%, , , softwarePID
				}
			}
			else
			{
				Send, #g
			}
		}
	}
	IfExist, %softwareRun%
	{
		sleep 250
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

;;; Minecraft win + Alt + m
#+!m::
#!m::
	softwareRun := "C:\Program Files (x86)\Minecraft\MinecraftLauncher.exe"
	UniqueID := WinExist("ahk_exe MinecraftLauncher.exe")
	IfExist, %softwareRun%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, open %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files\Minecraft\MinecraftLauncher.exe"
		IfExist, %softwareRun%
		{
			if % StrLen(UniqueID) == 3
			{
				Run, open %softwareRun%, , , softwarePID
			}
		}
		else
		{
			Send, #!m
		}
	}
	IfExist, %softwareRun%
	{
		sleep 500
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe MinecraftLauncher.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; �I���W�� win + Alt + o
#+!o::
#!o::
	softwareRun := "C:\Program Files (x86)\Origin\Origin.exe"
	UniqueID := WinExist("ahk_exe Origin.exe")
	IfExist, %softwareRun%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, open %softwareRun%, , , varOriginPID
		}
	}
	else
	{
		softwareRun := "C:\Program Files\Origin\Origin.exe"
		IfExist, %softwareRun%
		{
			if % StrLen(UniqueID) == 3
			{
				Run, open %softwareRun%, , , varOriginPID
			}
		}
		else
		{
			Send, #!s
		}
	}
	IfExist, %softwareRun%
	{
		sleep 150
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe Origin.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;;; WindowsOS�W���̃y�C���g�@Win�{p
#p::
	Run, %systemroot%\system32\mspaint.exe, , , varPaintPID
	; %windir%	�Ƃǂ��Ⴄ�H
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�f���A���f�B�X�v���C�p�̃V���[�g�J�b�g�H
	sleep 300
	SetTitleMatchMode,2
	WinActivate ,�y�C���g
return

;;;�T�N���G�f�B�^ win + Ctrl + s
#^s::
	softwareRun := "C:\Program Files\sakura\sakura.exe"
;	��WindowOS�W���̃V���[�g�J�b�g�L�[���㏑�����邱�ƂɂȂ邽�߁A�C�����邱�ƁB
;		�����F���̃Z�b�g�A�b�v��ʂ��N������B
	IfExist, %softwareRun%
	{
		Run, %softwareRun%, , , softwarePID
	}
	else
	{
		softwareRun := "C:\Program Files (x86)\sakura\sakura.exe"
		IfExist, %softwareRun%
		{
			Run, %softwareRun%, , , softwarePID
		}
		else
		{
			Send, #^s
		}
	}
	IfExist, %softwareRun%
	{
		sleep 100
		WinActivate
	}
return

;;; Steam win + Alt + s
#+!s::
#!s::
	softwareRun := "C:\Program Files (x86)\Steam\Steam.exe"
	UniqueID := WinExist("ahk_exe Steam.exe")
	IfExist, %softwareRun%
	{
		if % StrLen(UniqueID) == 3
		{
			Run, open %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun :="C:\Program Files\Steam\Steam.exe"
		IfExist, %softwareRun%
		{
			if % StrLen(UniqueID) == 3
			{
				Run, open %softwareRun%, , , softwarePID
			}
		}
		else
		{
			Send, #!s
		}
	}
	IfExist, %softwareRun%
	{
		sleep 150
		if % StrLen(UniqueID) == 3
		{
			WinActivate, ahk_exe Steam.exe
		}
		else
		{
			WinActivate, ahk_id %UniqueID%
		}
	}
return

;	Dropbox win + Alt + x
#!x::
	Process, Exist, Dropbox.exe
	softwarePID := ErrorLevel
	softwareRun := "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
	IfExist, %softwareRun%
	{
		If ( softwarePID == 0 )
		{
			Run, open %softwareRun%, , , softwarePID
		}
	}
	else
	{
		softwareRun := "C:\Program Files\Dropbox\Client\Dropbox.exe"
		IfExist, %softwareRun%
		{
			If ( softwarePID == 0 )
			{
				Run, open %softwareRun%, , , softwarePID
			}
		}
		else
		{
			Send, #!x
		}
	}
	IfExist, %softwareRun%
	{
		Run Explorer "Dropbox"
		sleep 500
		Send, !ddropbox{Enter}
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

;	��Control+w�L�[�̑g�ݍ��킹�ŃE�B���h�E�������.
~^w::
	WinGetTitle, titleControlWName, A
	varFoundRegControlWHidemaru := RegExMatch(titleControlWName, ".*(�G��)$", varControlW)
	varFoundRegControlWSakura := RegExMatch(titleControlWName, ".*(sakura).*$", varControlW)
	varFoundRegControlWPowerShell := RegExMatch(titleControlWName, ".*(Windows PowerShell).*$", varControlW)
	varFoundRegControlWEvernoteChild := RegExMatch(titleControlWName, ".*(?!.*com - )(Evernote)$", varControlW)
		; ���K�\���Fhttp://uxmilk.jp/50674
	If ( ErrorLevel <> 0 )
	{
		MsgBox, ���K�\��ErrorLevel�F%ErrorLevel%�F%A_LineNumber%
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
return

#e::
	Run Explorer %A_Desktop%
return

;��Gvim�p�̐ݒ�
#IfWinActive ahk_exe gvim.exe
#t::Send, {Esc 2}^{[}:tabnew{Enter}	; Ctrl+t�ŐV�K�^�u�쐬��
#w::Send, {Esc 2}^{[}:tabclose{Enter}	; Ctrl+c�Ń^�uClose��
#m::Send, {Esc 2}^{[}:tab split{Enter}:tabprev{Enter}:close{Enter}:tabnext{Enter}	; Ctrl+m�Ŋ����o�b�t�@���^�u�ړ���
	;	��Windows�̃V���[�g�J�b�g��ׂ�
!Space::WinMinimize
#!d::Send, {Esc 2}^{[}:bw{Enter}
#+!d::Send, !bd	; �s�v�ȏ������낤�B
#IfWinActive

;���G�ۃG�f�B�^�̐ݒ�
#IfWinActive ahk_exe Hidemaru.exe
^g::Send, !sg	; Ctrl&g�ɂ��Grep�����_�C�A���O���J��(���̕��Q�ŁA�s�ԍ��w��̃W�����v���ł��Ȃ��Ȃ�˃V���[�g�J�b�g��ׂ�������)�B
^j::Send, ^g	; Ctrl&g����L�Œׂꂽ���߁ACtrl+j�Ŏw��s�ړ����\�ɂ���(�{���̊����͂Ȃ�)�B
^!f::Send, !vz	; �S��ʕ\��(Ctrl+Alt+f)�B����́AMacOS�Ɏ�����点���B
#IfWinActive

^m::
;!n::
WinMinimize, A
return

;��Eclipse�̐ݒ�
#IfWinActive ahk_exe eclipse.exe
^g::Send, !aa	; Ctrl&g�ɂ��Grep�����_�C�A���O���J��(�����V���[�g�J�b�g�L�[��ׂ���)
^j::Send, ^l	; Ctrl&j�ɂ��w��s�ړ��_�C�A���O���J��
#IfWinActive

#+!^c::
	Menu, TRAY, Icon
	TrayTip, "make", (c)asakunotomohiro`ndate�F2021/01/10`nAHKVer�F%A_AhkVersion%`ndate�F%A_YYYY%/%A_MM%/%A_DD%(%A_DDDD%) %A_Hour%:%A_Min% %A_Sec%.%A_MSec%, 3, 0
	sleep 3000
	Menu, TRAY, NoIcon
return

;;; �[���ŗL�̃v���O������ϐ��ɐݒ�
;	�G�ۃG�f�B�^
hidemaru := ""

; ���X�N���[���V���b�g
;	Alt+Ctrl+PrtSc �� Win+Shift+S
!^PrintScreen::
	Send, #+s
return

#+!x::
	softwareRun := "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
	IfNotExist, %softwareRun%
	{
		softwareRun := "C:\Program Files\Dropbox\Client\Dropbox.exe"
		IfNotExist, %softwareRun%
		{
			Send, #+!x
		}
	}
	IfExist, %softwareRun%
	{
		WinGet, OutputVar, List, ahk_exe Explorer.exe 
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			softwareID := % OutputVar%A_Index%
			WinGet, activeWinID, IDLast, ahk_exe Explorer.exe, Dropbox
			if ( softwareID == activeWinID )
			{
				WinActivate, ahk_exe Explorer.exe, Dropbox
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

^#!x::
	WinGet, OutputVar, List, ahk_exe Explorer.exe, ,, Dropbox
	Loop, %OutputVar%
	{
		notSoftwareID := % OutputVar%A_Index%
		WinActivate, ahk_id %notSoftwareID%
	}
return

#^e::
	WinGet, OutputVar, List, ahk_exe Explorer.exe
	Loop, %OutputVar%
	{
		WinGetClass, OutputVar, ahk_id A_LoopField
		dirID := % OutputVar%A_Index%
		WinMinimize, ahk_id %dirID%
	}
return

#+e::
	WinGet, OutputVar, List, ahk_exe Explorer.exe
	Loop, %OutputVar%
	{
		WinGetClass, OutputVar, ahk_id A_LoopField
		dirID := % OutputVar%A_Index%
		WinActivate, ahk_id %dirID%
	}
return

; �ȉ��A���ǂ��K�v�B
#!+i::
	eclipse := "C:\pleiades\eclipse\eclipse.exe"
	IfNotExist, %eclipse%
	{
		eclipse := "C:\Program Files (x86)\eclipse-pleiades\eclipse\eclipse.exe"
		IfNotExist, %eclipse%
		{
			eclipse := "C:\Program Files\eclipse-pleiades\eclipse\eclipse.exe"
			IfNotExist, %eclipse%
			{
				Send, #!+i
			}
		}
	}
	IfExist, %eclipse%
	{
		WinGet, OutputVar, List, ahk_exe %eclipse%
		WinGet, activeWinID, IDLast, ahk_exe %eclipse%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			eclipseID := % OutputVar%A_Index%
			if ( chromeID == activeWinID )
			{
				WinActivate, ahk_id %eclipseID%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}

	StringTrimRight, appdataRoaming, A_AppData, 7
	msvscode := appdataRoaming . "Local\Programs\Microsoft VS Code\Code.exe"
	IfNotExist, %msvscode%
	{
		msvscode := "C:\Program Files (x86)\Microsoft VS Code\Code.exe"
		IfNotExist, %msvscode%
		{
			msvscode := "C:\Program Files\Microsoft VS Code\Code.exe"
			IfNotExist, %msvscode%
			{
				Send, #!+i
			}
		}
	}
	IfExist, %msvscode%
	{
		WinGet, OutputVar, List, ahk_exe %msvscode%
		WinGet, activeWinID, IDLast, ahk_exe %msvscode%
		Loop, %OutputVar%
		{
			WinGetClass, OutputVar, ahk_id A_LoopField
			eclipseID := % OutputVar%A_Index%
			if ( chromeID == activeWinID )
			{
				WinActivate, ahk_id %msvscode%
			}
			else
			{
				WinActivate, ahk_id %activeWinID%
				break
			}
		}
	}
return

;���s�̕i�̃L�[�{�[�h�Ή�
; ��Capslock��Ctrl�L�[�ɓ���ւ���.

;	�ȏ�B�����܂ŁB
