;*** AHK-RARE GUI *** V0.3alpha

;{01. script parameters

		debug:=0

		#NoEnv
		#Persistent
		#SingleInstance, Force
		#InstallKeybdHook
		#MaxThreads, 250
		#MaxThreadsBuffer, On
		#MaxHotkeysPerInterval 99000000
		#HotkeyInterval 99000000
		#KeyHistory 1
		;ListLines Off

		SetTitleMatchMode, 2		;Fast is default
		SetTitleMatchMode, Fast		;Fast is default
		DetectHiddenWindows, Off	;Off is default
		CoordMode, Mouse, Screen
		CoordMode, Pixel, Screen
		CoordMode, ToolTip, Screen
		CoordMode, Caret, Screen
		CoordMode, Menu, Screen
		SetKeyDelay, -1, -1
		SetBatchLines, -1
		SetWinDelay, -1
		SetControlDelay, -1
		SendMode, Input
		AutoTrim, On
		FileEncoding, UTF-8

		OnExit("TheEnd")
		;OnError("FehlerProtokoll")

		Menu Tray, Icon, %A_ScriptDir%\assets\GemSmall.ico

	;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	; Script Prozess ID feststellen
	;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		scriptPID:= DllCall("GetCurrentProcessId")

;}

;{02. declaring variables

	ARData	:= Object()
	RC			:= Object()
	LogoW 	:= 1200
	LW       	:= 450
	LogoH   	:= 71
	
	; Settings array for the RichCode control (code & examples)
	Settings :=
	( LTrim Join Comments
	{
	"TabSize"         	: 2,
	"Indent"           	: "`t",
	"FGColor"         	: 0xEDEDCD,
	"BGColor"        	: 0x3F3F3F,
	"BGColor"        	: 0x172842,
	"Font"              	: {"Typeface": "Arial", "Size": 10},
	"WordWrap"    	: False,
	
	"UseHighlighter"	: True,
	"HighlightDelay"	: 200,
	
	"Colors": {
		"Comments"	:	0x7F9F7F,
		"Functions"  	:	0x7CC8CF,
		"Keywords"  	:	0xE4EDED,
		"Multiline"   	:	0x7F9F7F,
		"Numbers"   	:	0xF79B57,
		"Punctuation"	:	0x97C0EB,
		"Strings"      	:	0xCC9893,
		
		; AHK
		"A_Builtins"   	:	0xF79B57,
		"Commands"	:	0xCDBFA3,
		"Directives"  	:	0x7CC8CF,
		"Flow"          	:	0xE4EDED,
		"KeyNames"	:	0xCB8DD9,
		"Description"	:	0x47B856,
		"Link"           	:	0x47B856,
		
		; CSS
		"ColorCodes"	:   0x7CC8CF,
		"Properties" 	:   0xCDBFA3,
		"Selectors"   	:	0xE4EDED,
		
		; HTML
		"Attributes"  	:   0x7CC8CF,
		"Entities"      	:	0xF79B57,
		"Tags"          	:	0xCDBFA3,
		
		; JS
		"Builtins"      	:	0xE4EDED,
		"Constants"   	:	0xF79B57,
		"Declarations"	:	0xCDBFA3,
		
		; PLAIN-TEXT
		"PlainText"		:	0x7F9F7F
		}
	}
	)

;}

;{03. draw primary gui 

		global hArg, ARG, hSearch, hTabs
		Gui, ARG: NEW
		Gui, ARG: +LastFound +HwndhARG +Resize
		Gui, ARG: Margin, 0, 0
	;-: Logo and Backgroundcolouring
		Gui, ARG: Add, Progress, % "x0 y0 w" LogoW+10 " h85 c172842 vBGColorLogo" , 100
		Gui, ARG: Add, Pic, % "x12 y10 BackgroundTrans"  	, % A_ScriptDir "\assets\AHK-Rare-GuiLogo.png" ;(LW//4.37) w" (LW:= 450) " h" (LogoH:= 71) "
		Gui, ARG: Add, Progress, % "x0 y85 w" (LogoW + 10 ) " h2 vDevider" , 100
		Gui, ARG: Add, Progress, % "x" LW + 7 " y0 w2 h" 85 , 100
	;-: temp. text controls
		Gui, ARG: Font, S12 CWhite, Normal
		Gui, ARG: Add, Text	, % "x" (LW + 10) " y10 vField1 BackgroundTrans", % "  . . . . . create index: "
		GuiControlGet, Field_, ARG: Pos, Field1
		Gui, ARG: Add, Text	, % "x" (Field_X + Field_W + 3) " y10 w300 vField2 BackgroundTrans ", % "00.00.000001"
	;-: Edit control for search patterns
		Gui, ARG: Font, S11 Italic CAAAAAA, Normal
		Gui, ARG: Add, Edit	, % "x" (LW + 20) " y50 w500 r1 vSearch HWNDhSearch -Theme", % "type your search pattern here"
		Edit_SetMargins(hSearch, 20, 20)
		;CTLCOLORS.Attach(hSearch, "677892")
	;-: Functions Listview
		Gui, ARG: Font, S9 Normal CDefault, Normal
		Gui, ARG: Add, Listview, % "xm y" (LogoH + 15) " w" LogoW+5 " r25 HWNDhLVFunc vLVFunc gShowFunction Section", main section|function name|short description|function nr.
		Gui, ARG: Font, S8 CDefault, Normal
		GuiControlGet, LV_, ARG: Pos, LVFunc
	;-: Short description section
		Gui, ARG: Add, Edit, % "xm y" (LV_Y + LV_H + 10) " w" LogoW//4 " r20 t8 HWNDhShowRoom1 vShowRoom1"
		GuiControlGet, SR_, ARG: Pos, ShowRoom1
	;-: Code highlighted RichEdit control
		Gui, ARG: Add, Tab, % "x" (LogoW//4+5) " y" (LV_Y+LV_H+10) " w" (LogoW//4*3) " h" SR_H " HWNDhTabs vShowRoom2", FUNCTION CODE|EXAMPLE(s)|DESCRIPTION
		Gui, ARG: Tab, 1
		RC[1] := new RichCode(Settings, "ARG", "x" (LogoW//4+5) " y" (LV_Y+LV_H+30) " w" (LogoW//4*3) " h" SR_H, 0)
		Gui, ARG: Tab, 2
		RC[2] := new RichCode(Settings, "ARG", "x" (LogoW//4+5) " y" (LV_Y+LV_H+30) " w" (LogoW//4*3) " h" SR_H, 0)
		Gui, ARG: Tab, 3
		RC[3] := new RichCode(Settings, "ARG", "x" (LogoW//4+5) " y" (LV_Y+LV_H+30) " w" (LogoW//4*3) " h" SR_H, 0)
	;-: Create a ToolTip control
		TT := New GuiControlTips(HARG)
		TT.SetDelayTimes(500, 3000, -1)
		Loop, 3
			TT.Attach(RC[A_Index].Hwnd, "Press the right`nmouse button`nto copy the text.", True)
	;-: Show the gui
		Gui, ARG: Show, AutoSize xCenter yCenter, AHK-Rare 'the search gui'
	;-: Resizing now
		WinMove, % "ahk_id " hARG,,,, % A_GuiWidth + 1
		
		OnMessage(0x200, "OnMouseHover")


;}

;{04. generate and fill listview with data

	; indexing AHK-Rare
		If FileExist(A_ScriptDir . "\AHK-Rare.ahk")
				ARData:= RarefuncIndexer(A_ScriptDir . "\AHK-Rare.ahk")
	; remove text controls
		GuiControl, ARG: Hide, Field1
		GuiControl, ARG: Hide, Field2			
	; populate listview with data from AHK-Rare.ahk
		For i, function in ARData
			LV_Add("", function.mainsection, function.name, function.short, function.hash)
		GuiControl, +Default, ARG: LVFunc

;}

;{05. Hotkey(s)
		
	; RButton for getting text to clipboard
		Hotkey, IfWinActive, % "ahk_id " hARG
		Hotkey, ~RButton, CopyTextToClipboard
;}

return

;{ Labels

ShowFunction: ;{

	toshow  	 := []
	toshow[1] := ""
	toshow[2] := ""

	selRow:= LV_GetNext(1)
	LV_GetText(fnr, selRow , 4)
	
	For i, function in ARData
		If Instr(function.hash, fnr)
				break
		
	; adding informations to Edit-Control (ShowRoom1)
		toshow[1]:= "FUNCTION:`n"                    	ARData[i].name 
		toshow[1].= "`n-----------------------------------------------------------------`n"
		toshow[1].= "SHORT DESCRIPTION:`n"    	ARData[i].short 
		toshow[1].= "`n-----------------------------------------------------------------`n"
		toshow[1].= "MAIN SECTION:`n"            	ARData[i].mainsection 
		toshow[1].= "`n-----------------------------------------------------------------`n"
		toshow[1].= "MAIN SECTION DESC.:`n"  	ARData[i].mainsectionDescription 
		toshow[1].= "`n-----------------------------------------------------------------`n"
		toshow[1].= "SUB SECTION:`n"                	ARData[i].subsection 
		toshow[1].= "`n-----------------------------------------------------------------`n"
		GuiControl, ARG:, ShowRoom1, % toshow[1]
	
	; populate function code tab and examples  tab
		RC[1].Settings.Highlighter := "HighlightAHK"	
		RC[1].Value := ARData[i].code
		RC[2].Settings.Highlighter := "HighlightAHK"	
		RC[2].Value := ARData[i].examples
		
	; reading data from the function included description section
		toshow[2]:=""
		If IsObject(ARData[i]["Description"])
		{
				 For descKey, Text in ARData[i]["Description"] 
				{
						If descKey
							toshow[2].= "-*" Format("{:U}", Trim(descKey)) "*-`n-----------------------------------------------------------------`n" 
						else
							continue
						Text:= StrReplace(Text, "`n`r`n`r", "`n")
						Text:= StrReplace(Text, "`r`n`r`n", "`n")
						Loop, 4
							Text	:= StrReplace(Text, SubStr("`t`t`t`t`t`t`t`t", 7 - A_Index) , A_Tab)
						Loop, Parse, Text, `n 
							toshow[2].= Rtrim(A_LoopField, ",") "`n"
				}	
		}

	
	; populate the description Tab
		RC[3].Settings.Highlighter := "HighlightAHK"	
		RC[3].Value := toshow[2]
				
return
;}

ARGGuiSize: ;{

	Critical, Off
	Critical
	GuiControl, ARG: Move, Devider, % " w" (A_GuiWidth) 
	GuiControl, ARG: Move, BGColorLogo, % " w" (A_GuiWidth) 
	GuiControl, ARG: Move, LVFunc, % " w" (A_GuiWidth) " h"(A_GuiHeight//3)
	GuiControlGet, LV_, ARG: Pos, LVFunc
	LV_AutoColumSizer(hLVFunc, "16% 15% 60%")
	GuiControl, ARG: Move, ShowRoom1, % " y" (LV_Y+LV_H+10) " w" (A_GuiWidth//4) " h"(A_GuiHeight-LV_Y-LV_H-10)
	GuiControl, ARG: Move, ShowRoom2, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+10) " w" (A_GuiWidth//4*3) " h" (A_GuiHeight-LV_Y-LV_H-10)
	GuiControl, ARG: Move, % RC[1].hwnd, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+30) " w" (A_GuiWidth//4*3) " h" (A_GuiHeight-LV_Y-LV_H-10)
	GuiControl, ARG: Move, % RC[2].hwnd, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+30) " w" (A_GuiWidth//4*3) " h" (A_GuiHeight-LV_Y-LV_H-10)
	GuiControl, ARG: Move, % RC[3].hwnd, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+30) " w" (A_GuiWidth//4*3) " h" (A_GuiHeight-LV_Y-LV_H-10)
	Critical, Off
return
;}

ARGGuiClose: ;{
ARGEscape:
ExitApp
;}

CopyTextToClipboard: ;{

	toCopy := ""
	MouseGetPos, mx, my,, hControlOver, 2
	
	If Instr(hControlOver, hTabs)
	{
			Loop, Parse, AhkRare, `n, `r
			{
					If (A_Index >= ARData[i].start) && (A_Index <= ARData[i].end)
							tocopy .= A_LoopField "`n"
					else if (A_Index > ARData[i].end)
							break
			}				
			Clipboard := tocopy
			ToolTip, % "copied to clipboard...", % mx -10, % my + 10, 2
			SetTimer, TTOff, -4000
	}

return

TTOff:
	ToolTip,,,, 2
return
;}

;}

;{ Functions

RarefuncIndexer(file){													                     			;--list all functions inside AHK-RARE script 
	
	ARData:= Object()
	ARData.DescriptionKeys := Object()
	s:=fI:=descFlag:=descKeyFlag:=descKeyFlagO :=0
	global AHKRare

	FileRead, AhkRare, % file
	
	Loop, Parse, AhkRare, `n, `r
	{
		
		If RegExMatch(A_LoopField, "(?<=\{\s;)[\w\s-\+\/\(\)]+(?=\(\d+\))")                                                                                                                                                    	; recognize name of mainsection
		{
					RegExMatch(A_LoopField, "(?<=\{\s;)[\w\s-\+\/\(\)]+(?=\(\d+\))", mainsection)
					mainsection	:= Trim(mainsection)
					subsection	:= ""
					RegExMatch(A_LoopField, "(?<=--\s)[\w\s]+(?=\s--)", MainSectionDescription)
					descFlag:=descKeyFlag:=descKeyFlagO := 0
					TrailingSpacesO:= TrailingSpaces 	:= 0
					continue
		}
		else If RegExMatch(A_LoopField, "(?<=\{\s;)\<\d\d\.\d\d[\d\.]*\>:\s[\w\-\_\+\/\(\)]+")                                                                                                                        	; recognize name of subsection
		{
					RegExMatch(A_LoopField, "(?<=\>:\s)[\w\-\_\s\+\/]+", subsection)
					subsection:= Trim(subsection)
					continue
		}
		else If RegExMatch(A_LoopField, "(;\s*\<\d\d\.\d\d\.\d\d\d\d\d)|(;\s*\<\d\d\.\d\d\.\d\d.\d\d\d\d\d)")                                                                                                 	; recognizes new function nr.
		{
				If ARData[(fI)].end = ""                                                                        	; if function boundaries are not proper set
						ARData[(fI)].end := A_Index - 1
				
				ARData[(fI)].code     	:= RTrim(ARData[(fI)].code, "}`n`r") "`n}"            	; closes a function to be safe with syntax
				ARData[(fI)].code     	:=   Trim(ARData[(fI)].code, "`n`r")                   	; deletes the first and last linefeed's
				ARData[(fI)].examples :=    Trim(ARData[(fI)].examples, "`n`r")             	
				
				Loop, 5                                                                                                 	; deletes up 2 empty lines
				{
						ARData[(fI)].examples 	:= StrReplace(ARData[(fI)].examples	, SubStr("`n`n`n`n`n`n`n`n`n", 1, 8 - A_Index), "`n")
						ARData[(fI)].code      	:= StrReplace(ARData[(fI)].code       	, SubStr("`n`n`n`n`n`n`n`n`n", 1, 8 - A_Index), "`n")
				}
				
				ARData[(fi)]["description"][(descKey)] := RTrim(ARData[(fi)]["description"][(descKey)], "`n")
				
				descFlag:= descKeyFlag:= descKeyFlagO   	:= 0                                 	; re-initialize flags
				TrailingSpacesO:= TrailingSpaces               	:= 0
				NoCode                                                       	:= 0
				
				fi ++                                                                                                    	; enumerator
				RegExMatch(A_LoopField, "[\d\.]+", hashCode)                                   	; reads the functions numbers (e.g. 04.01.00011)
				ARData[(fI)]                                                   	:= Object()
				ARData[(fi)].description                                	:= Object()
				ARData[(fI)].hash                                          	:= hashCode
				ARData[(fI)].start                                          	:= A_Index+1
				ARData[(fI)].mainsection                              	:= mainsection
				ARData[(fI)].mainsectionDescription           	:= mainsectionDescription
				ARData[(fI)].subsection                                	:= subsection
								
				GuiControl, Text, Field2, % fI ", " fname "`)"
				continue
		}
		else If RegExMatch(A_LoopField, ";\s*\<\/\d\d\.\d\d\.\d\d\d\d\d")                                                                                                                                                      	; function ends 
		{
				ARData[(fI)].end  := A_Index
				descFlag           	:= 0
				NoCode           	:= 1
		}
		else If RegExMatch(A_LoopField, "[\w\_-]+\([\w\d\s\,\=\.\*#-|\:\""""]*\)\s*\{\s+;--.*") or RegExMatch(A_LoopField, "[\w\_-]+\([\w\d\s\,\=\.\*#-|\:\""""]*\s*;--.*")         	; find function
		{
				RegExMatch(A_LoopField, "[\w\_-\d]+\(", fname)
				RegExMatch(A_LoopField, "(?<=;--).*", fshort)
				ARData[(fI)].name         	:= Trim(fname) "`)"
				ARData[(fI)].short         	:= Trim(fshort)
				ARData[(fI)].subsection	:= subsection
				ARData[(fI)].code         	:= A_LoopField "`n"
		}
		else if RegExMatch(A_LoopField, "i)\/\*\s*DESCRIPTION")                                                                                                                                                                     	; description section detected
				exampleFlag:= 0, descFlag:= 1, descKey:= Text:= "", continue
		else if RegExMatch(A_LoopField, "i)\/\*\s*EXAMPLE")                                                                                                                                                                           	; example section detected
				exampleFlag:= 1, descFlag:= 0, descKey:= Text:= "", continue
		else if ( descFlag = 1 || exampleFlag = 1) && (Instr(A_LoopField, "--------------") || Instr(A_LoopField, "========================"))                              	; ignores specific internal layout lines 
				continue
		else if ( descFlag = 1 || exampleFlag = 1) && RegExMatch(A_LoopField, "\*\/")                                                                                                                                    	; end of descriptions or examples section
				exampleFlag:= descFlag:= descKeyFlag:= exampleIndent := 0, descKey:="", continue
		else if (descFlag = 1) && RegExMatch( A_LoopField, "^\s+[\w\(\)-\s]+(?=\s*:\s*)" )                                                                                                                           	; description key is found 
		{
			; the formatting of the AHK-Rare.ahk file creates difficulties in distinguishing the description key from the associated text
				TrailingSpaces:=  countTrailingSpaces(A_LoopField)
				If TrailingSpacesO && (TrailingSpaces >= (TrailingSpacesO + 1))
						ARData[(fi)]["description"][(descKey)] .= Trim(A_LoopField) "`n", continue
				
				descKeyFlagO := descKeyFlag, descKeyFlag ++
				
			; determines the description key
				RegExMatch(A_LoopField, "^\s+[\w\(\)-\s]+(?=\s*:\s*)", descKey)
				descKey:= Trim(descKey)
			
			; collecting available keys for search function
				If !ARData.DescriptionKeys.HasKey(descKey)
						ARData.DescriptionKeys[(descKey)].Push(hashcode "|")   
			
			; determines the corresponding text of the description
				RegExMatch(A_LoopField, "(?<=\:).*", Text)
				ARData[(fi)]["description"][(descKey)] := RTrim(Trim(Text), "`n`r") "`n" 
		
				TrailingSpacesO := TrailingSpaces
		}
		else if (descFlag = 1) && (descKeyFlag > descKeyFlagO)
				ARData[(fi)]["description"][(descKey)] .= Trim(A_LoopField) "`n"
		else if (exampleFlag = 1)                                                                                                                                                                                                                     	; parsing example section
		{
				If !exampleIndent && StrLen(A_LoopField) >= 2
						exampleIndent := countTrailingSpaces(A_LoopField)
				If ((StrLen(A_LoopField) <= 2) && (StrLen(ARData[(fI)].examples) <= 2)) || (StrLen(A_LoopField) >= 2)
						ARData[(fI)].examples 	.= SubStr(A_LoopField, exampleIndent +1, StrLen(A_LoopField) - exampleIndent) "`n"
    	}						
		else                                                                                                                                                                                                                                                       	; if nothing fits then the line is program code
		{
				If NoCode = 0
						ARData[(fI)].code	.= A_LoopField "`n"
		}
	}

	return ARData

}

countTrailingSpaces(str) {
	
	Loop, % StrLen(str)
		If Instr(A_Space "`t", SubStr(str, A_Index, 1))
				TrailingSpaces ++
		else
				Break
	
return TrailingSpaces
}

HighlightAHK(Settings, ByRef Code) {
	static Flow := "break|byref|catch|class|continue|else|exit|exitapp|finally|for|global|gosub|goto|if|ifequal|ifexist|ifgreater|ifgreaterorequal|ifinstring|ifless|iflessorequal|ifmsgbox|ifnotequal|ifnotexist|ifnotinstring|ifwinactive|ifwinexist|ifwinnotactive|ifwinnotexist|local|loop|onexit|pause|return|settimer|sleep|static|suspend|throw|try|until|var|while"
	, Commands := "autotrim|blockinput|clipwait|control|controlclick|controlfocus|controlget|controlgetfocus|controlgetpos|controlgettext|controlmove|controlsend|controlsendraw|controlsettext|coordmode|critical|detecthiddentext|detecthiddenwindows|drive|driveget|drivespacefree|edit|envadd|envdiv|envget|envmult|envset|envsub|envupdate|fileappend|filecopy|filecopydir|filecreatedir|filecreateshortcut|filedelete|fileencoding|filegetattrib|filegetshortcut|filegetsize|filegettime|filegetversion|fileinstall|filemove|filemovedir|fileread|filereadline|filerecycle|filerecycleempty|fileremovedir|fileselectfile|fileselectfolder|filesetattrib|filesettime|formattime|getkeystate|groupactivate|groupadd|groupclose|groupdeactivate|gui|guicontrol|guicontrolget|hotkey|imagesearch|inidelete|iniread|iniwrite|input|inputbox|keyhistory|keywait|listhotkeys|listlines|listvars|menu|mouseclick|mouseclickdrag|mousegetpos|mousemove|msgbox|outputdebug|pixelgetcolor|pixelsearch|postmessage|process|progress|random|regdelete|regread|regwrite|reload|run|runas|runwait|send|sendevent|sendinput|sendlevel|sendmessage|sendmode|sendplay|sendraw|setbatchlines|setcapslockstate|setcontroldelay|setdefaultmousespeed|setenv|setformat|setkeydelay|setmousedelay|setnumlockstate|setregview|setscrolllockstate|setstorecapslockmode|settitlematchmode|setwindelay|setworkingdir|shutdown|sort|soundbeep|soundget|soundgetwavevolume|soundplay|soundset|soundsetwavevolume|splashimage|splashtextoff|splashtexton|splitpath|statusbargettext|statusbarwait|stringcasesense|stringgetpos|stringleft|stringlen|stringlower|stringmid|stringreplace|stringright|stringsplit|stringtrimleft|stringtrimright|stringupper|sysget|thread|tooltip|transform|traytip|urldownloadtofile|winactivate|winactivatebottom|winclose|winget|wingetactivestats|wingetactivetitle|wingetclass|wingetpos|wingettext|wingettitle|winhide|winkill|winmaximize|winmenuselectitem|winminimize|winminimizeall|winminimizeallundo|winmove|winrestore|winset|winsettitle|winshow|winwait|winwaitactive|winwaitclose|winwaitnotactive"
	, Functions := "abs|acos|array|asc|asin|atan|ceil|chr|comobjactive|comobjarray|comobjconnect|comobjcreate|comobject|comobjenwrap|comobjerror|comobjflags|comobjget|comobjmissing|comobjparameter|comobjquery|comobjtype|comobjunwrap|comobjvalue|cos|dllcall|exception|exp|fileexist|fileopen|floor|func|getkeyname|getkeysc|getkeystate|getkeyvk|il_add|il_create|il_destroy|instr|isbyref|isfunc|islabel|isobject|isoptional|ln|log|ltrim|lv_add|lv_delete|lv_deletecol|lv_getcount|lv_getnext|lv_gettext|lv_insert|lv_insertcol|lv_modify|lv_modifycol|lv_setimagelist|mod|numget|numput|objaddref|objclone|object|objgetaddress|objgetcapacity|objhaskey|objinsert|objinsertat|objlength|objmaxindex|objminindex|objnewenum|objpop|objpush|objrawset|objrelease|objremove|objremoveat|objsetcapacity|onmessage|ord|regexmatch|regexreplace|registercallback|round|rtrim|sb_seticon|sb_setparts|sb_settext|sin|sqrt|strget|strlen|strput|strsplit|substr|tan|trim|tv_add|tv_delete|tv_get|tv_getchild|tv_getcount|tv_getnext|tv_getparent|tv_getprev|tv_getselection|tv_gettext|tv_modify|tv_setimagelist|varsetcapacity|winactive|winexist|_addref|_clone|_getaddress|_getcapacity|_haskey|_insert|_maxindex|_minindex|_newenum|_release|_remove|_setcapacity"
	, Keynames := "alt|altdown|altup|appskey|backspace|blind|browser_back|browser_favorites|browser_forward|browser_home|browser_refresh|browser_search|browser_stop|bs|capslock|click|control|ctrl|ctrlbreak|ctrldown|ctrlup|del|delete|down|end|enter|esc|escape|f1|f10|f11|f12|f13|f14|f15|f16|f17|f18|f19|f2|f20|f21|f22|f23|f24|f3|f4|f5|f6|f7|f8|f9|home|ins|insert|joy1|joy10|joy11|joy12|joy13|joy14|joy15|joy16|joy17|joy18|joy19|joy2|joy20|joy21|joy22|joy23|joy24|joy25|joy26|joy27|joy28|joy29|joy3|joy30|joy31|joy32|joy4|joy5|joy6|joy7|joy8|joy9|joyaxes|joybuttons|joyinfo|joyname|joypov|joyr|joyu|joyv|joyx|joyy|joyz|lalt|launch_app1|launch_app2|launch_mail|launch_media|lbutton|lcontrol|lctrl|left|lshift|lwin|lwindown|lwinup|mbutton|media_next|media_play_pause|media_prev|media_stop|numlock|numpad0|numpad1|numpad2|numpad3|numpad4|numpad5|numpad6|numpad7|numpad8|numpad9|numpadadd|numpadclear|numpaddel|numpaddiv|numpaddot|numpaddown|numpadend|numpadenter|numpadhome|numpadins|numpadleft|numpadmult|numpadpgdn|numpadpgup|numpadright|numpadsub|numpadup|pause|pgdn|pgup|printscreen|ralt|raw|rbutton|rcontrol|rctrl|right|rshift|rwin|rwindown|rwinup|scrolllock|shift|shiftdown|shiftup|space|tab|up|volume_down|volume_mute|volume_up|wheeldown|wheelleft|wheelright|wheelup|xbutton1|xbutton2"
	, Builtins := "base|clipboard|clipboardall|comspec|errorlevel|false|programfiles|true"
	, Keywords := "abort|abovenormal|activex|add|ahk_class|ahk_exe|ahk_group|ahk_id|ahk_pid|all|alnum|alpha|altsubmit|alttab|alttabandmenu|alttabmenu|alttabmenudismiss|alwaysontop|and|autosize|background|backgroundtrans|base|belownormal|between|bitand|bitnot|bitor|bitshiftleft|bitshiftright|bitxor|bold|border|bottom|button|buttons|cancel|capacity|caption|center|check|check3|checkbox|checked|checkedgray|choose|choosestring|click|clone|close|color|combobox|contains|controllist|controllisthwnd|count|custom|date|datetime|days|ddl|default|delete|deleteall|delimiter|deref|destroy|digit|disable|disabled|dpiscale|dropdownlist|edit|eject|enable|enabled|error|exit|expand|exstyle|extends|filesystem|first|flash|float|floatfast|focus|font|force|fromcodepage|getaddress|getcapacity|grid|group|groupbox|guiclose|guicontextmenu|guidropfiles|guiescape|guisize|haskey|hdr|hidden|hide|high|hkcc|hkcr|hkcu|hkey_classes_root|hkey_current_config|hkey_current_user|hkey_local_machine|hkey_users|hklm|hku|hotkey|hours|hscroll|hwnd|icon|iconsmall|id|idlast|ignore|imagelist|in|insert|integer|integerfast|interrupt|is|italic|join|label|lastfound|lastfoundexist|left|limit|lines|link|list|listbox|listview|localsameasglobal|lock|logoff|low|lower|lowercase|ltrim|mainwindow|margin|maximize|maximizebox|maxindex|menu|minimize|minimizebox|minmax|minutes|monitorcount|monitorname|monitorprimary|monitorworkarea|monthcal|mouse|mousemove|mousemoveoff|move|multi|na|new|no|noactivate|nodefault|nohide|noicon|nomainwindow|norm|normal|nosort|nosorthdr|nostandard|not|notab|notimers|number|off|ok|on|or|owndialogs|owner|parse|password|pic|picture|pid|pixel|pos|pow|priority|processname|processpath|progress|radio|range|rawread|rawwrite|read|readchar|readdouble|readfloat|readint|readint64|readline|readnum|readonly|readshort|readuchar|readuint|readushort|realtime|redraw|regex|region|reg_binary|reg_dword|reg_dword_big_endian|reg_expand_sz|reg_full_resource_descriptor|reg_link|reg_multi_sz|reg_qword|reg_resource_list|reg_resource_requirements_list|reg_sz|relative|reload|remove|rename|report|resize|restore|retry|rgb|right|rtrim|screen|seconds|section|seek|send|sendandmouse|serial|setcapacity|setlabel|shiftalttab|show|shutdown|single|slider|sortdesc|standard|status|statusbar|statuscd|strike|style|submit|sysmenu|tab|tab2|tabstop|tell|text|theme|this|tile|time|tip|tocodepage|togglecheck|toggleenable|toolwindow|top|topmost|transcolor|transparent|tray|treeview|type|uncheck|underline|unicode|unlock|updown|upper|uppercase|useenv|useerrorlevel|useunsetglobal|useunsetlocal|vis|visfirst|visible|vscroll|waitclose|wantctrla|wantf2|wantreturn|wanttab|wrap|write|writechar|writedouble|writefloat|writeint|writeint64|writeline|writenum|writeshort|writeuchar|writeuint|writeushort|xdigit|xm|xp|xs|yes|ym|yp|ys|__call|__delete|__get|__handle|__new|__set"
	, Needle := "
	( LTrim Join Comments
		ODims)
		((?:^|\s);[^\n]+)                	; Comments
		|(^\s*\/\*.+?\n\s*\*\/)       	; Multiline comments
		|((?:^|\s)#[^ \t\r\n,]+)       	; Directives
		|([+*!~&\/\\<>^|=?:
			,().```%{}\[\]\-]+)           	; Punctuation
		|\b(0x[0-9a-fA-F]+|[0-9]+) 	; Numbers
		|(""[^""\r\n]*"")                	; Strings
		|\b(A_\w*|" Builtins ")\b    	; A_Builtins
		|\b(" Flow ")\b                  	; Flow
		|\b(" Commands ")\b        	; Commands
		|\b(" Functions ")\b          	; Functions (builtin)
		|\b(" Keynames ")\b         	; Keynames
		|\b(" Keywords ")\b          	; Other keywords
		|(([a-zA-Z_$]+)(?=\())       	; Functions
	)"
	
	GenHighlighterCache(Settings)
	Map := Settings.Cache.ColorMap
	
	Pos := 1
	while (FoundPos := RegExMatch(Code, Needle, Match, Pos)) 
	{
		RTF .= "\cf" Map.Plain " "
		RTF .= EscapeRTF(SubStr(Code, Pos, FoundPos-Pos))
		
		; Flat block of if statements for performance
		if (Match.Value(1) != "")
			RTF .= "\cf" Map.Comments
		else if (Match.Value(2) != "")
			RTF .= "\cf" Map.Multiline
		else if (Match.Value(3) != "")
			RTF .= "\cf" Map.Directives
		else if (Match.Value(4) != "")
			RTF .= "\cf" Map.Punctuation
		else if (Match.Value(5) != "")
			RTF .= "\cf" Map.Numbers
		else if (Match.Value(6) != "")
			RTF .= "\cf" Map.Strings
		else if (Match.Value(7) != "")
			RTF .= "\cf" Map.A_Builtins
		else if (Match.Value(8) != "")
			RTF .= "\cf" Map.Flow
		else if (Match.Value(9) != "")
			RTF .= "\cf" Map.Commands
		else if (Match.Value(10) != "")
			RTF .= "\cf" Map.Functions
		else if (Match.Value(11) != "")
			RTF .= "\cf" Map.Keynames
		else if (Match.Value(12) != "")
			RTF .= "\cf" Map.Keywords
		else if (Match.Value(13) != "")
			RTF .= "\cf" Map.Functions
		else
			RTF .= "\cf" Map.Plain
		
		RTF .= " " EscapeRTF(Match.Value())
		Pos := FoundPos + Match.Len()
	}
	
	return Settings.Cache.RTFHeader . RTF . "\cf" Map.Plain " " EscapeRTF(SubStr(Code, Pos)) "\`n}"
}

GenHighlighterCache(Settings) {
	
	if Settings.HasKey("Cache")
		return
	Cache := Settings.Cache := {}
	
	
	; --- Process Colors ---
	Cache.Colors := Settings.Colors.Clone()
	
	; Inherit from the Settings array's base
	BaseSettings := Settings
	while (BaseSettings := BaseSettings.Base)
		for Name, Color in BaseSettings.Colors
			if !Cache.Colors.HasKey(Name)
				Cache.Colors[Name] := Color
	
	; Include the color of plain text
	if !Cache.Colors.HasKey("Plain")
		Cache.Colors.Plain := Settings.FGColor
	
	; Create a Name->Index map of the colors
	Cache.ColorMap := {}
	for Name, Color in Cache.Colors
		Cache.ColorMap[Name] := A_Index
	
	
	; --- Generate the RTF headers ---
	RTF := "{\urtf"
	
	; Color Table
	RTF .= "{\colortbl;"
	for Name, Color in Cache.Colors
	{
		RTF .= "\red"   Color>>16 & 0xFF
		RTF .= "\green" Color>>8  & 0xFF
		RTF .= "\blue"  Color     & 0xFF ";"
	}
	RTF .= "}"
	
	; Font Table
	if Settings.Font
	{
		FontTable .= "{\fonttbl{\f0\fmodern\fcharset0 "
		FontTable .= Settings.Font.Typeface
		FontTable .= ";}}"
		RTF .= "\fs" Settings.Font.Size * 2 ; Font size (half-points)
		if Settings.Font.Bold
			RTF .= "\b"
	}
	
	; Tab size (twips)
	RTF .= "\deftab" GetCharWidthTwips(Settings.Font) * Settings.TabSize
	
	Cache.RTFHeader := RTF
}

GetCharWidthTwips(Font) {
	static Cache := {}
	
	if Cache.HasKey(Font.Typeface "_" Font.Size "_" Font.Bold)
		return Cache[Font.Typeface "_" font.Size "_" Font.Bold]
	
	; Calculate parameters of CreateFont
	Height := -Round(Font.Size*A_ScreenDPI/72)
	Weight := 400+300*(!!Font.Bold)
	Face := Font.Typeface
	
	; Get the width of "x"
	hDC := DllCall("GetDC", "UPtr", 0)
	hFont := DllCall("CreateFont"
	, "Int", Height ; _In_ int     nHeight,
	, "Int", 0      ; _In_ int     nWidth,
	, "Int", 0      ; _In_ int     nEscapement,
	, "Int", 0      ; _In_ int     nOrientation,
	, "Int", Weight ; _In_ int     fnWeight,
	, "UInt", 0     ; _In_ DWORD   fdwItalic,
	, "UInt", 0     ; _In_ DWORD   fdwUnderline,
	, "UInt", 0     ; _In_ DWORD   fdwStrikeOut,
	, "UInt", 0     ; _In_ DWORD   fdwCharSet, (ANSI_CHARSET)
	, "UInt", 0     ; _In_ DWORD   fdwOutputPrecision, (OUT_DEFAULT_PRECIS)
	, "UInt", 0     ; _In_ DWORD   fdwClipPrecision, (CLIP_DEFAULT_PRECIS)
	, "UInt", 0     ; _In_ DWORD   fdwQuality, (DEFAULT_QUALITY)
	, "UInt", 0     ; _In_ DWORD   fdwPitchAndFamily, (FF_DONTCARE|DEFAULT_PITCH)
	, "Str", Face   ; _In_ LPCTSTR lpszFace
	, "UPtr")
	hObj := DllCall("SelectObject", "UPtr", hDC, "UPtr", hFont, "UPtr")
	VarSetCapacity(SIZE, 8, 0)
	DllCall("GetTextExtentPoint32", "UPtr", hDC, "Str", "x", "Int", 1, "UPtr", &SIZE)
	DllCall("SelectObject", "UPtr", hDC, "UPtr", hObj, "UPtr")
	DllCall("DeleteObject", "UPtr", hFont)
	DllCall("ReleaseDC", "UPtr", 0, "UPtr", hDC)
	
	; Convert to twpis
	Twips := Round(NumGet(SIZE, 0, "UInt")*1440/A_ScreenDPI)
	Cache[Font.Typeface "_" Font.Size "_" Font.Bold] := Twips
	return Twips
}

EscapeRTF(Code) {
	for each, Char in ["\", "{", "}", "`n"]
		Code := StrReplace(Code, Char, "\" Char)
	return StrReplace(StrReplace(Code, "`t", "\tab "), "`r")
}

LV_AutoColumSizer(hLV, Sizes, Options:="") {                                         	;-- computes and changes the pixel width of the columns across the full width of a listview   
	
	; PARAMETERS:
	; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	; Sizes   	- 	this example is for a 4 column listview, for a better understanding it is possible to use a different syntax
	;               	Sizes:= "15%, 18%, 60%" or "15, 18, 60" or "15,18,60" or "15|18|60" or "15% 18% 60%"
	;               	It does not matter which characters or strings you use for subdivision, the little RegEx algorithm recognizes the dividers  
	;               	REMARK: !avoid specifying the last column width, this size will be computed!
	;                 	    *		*		*		*		*		*		*		*		*		*		*		*		*		*		* 
	; ** todo **	there is also an automatic mode which calculates the column width of the listview over the maximum pixel width of the content of the columns
	;                	you have to use Sizes:= "AutoColumnWidth"
	;
	; ** todo ** Options 	-	can be passed to limit the maximum column width to the maximum pixel width of the column contents
	;                  	or to prevent undersizing of columns
	
	static hHeader, LVP, hLVO, SizesO
	w:= LVP:= []
	
	If hLVO <> hLV
			hHeader:= LV_EX_GetHeader(hLV), hLVO:= hLV
	If SizesO <> Sizes
	{
			If !Instr(Sizes, "AutoColumnWidth")
			{
					pos := 1
					While pos:= RegExMatch(Sizes, "\d+", num, StrLen(num)+pos)
							LVP[A_Index] := num
			}
			else
			{
					nin:=1
			}
			
			LVP_Last := 100
			
			Loop, % LVP.MaxIndex()
			{
					LVP[A_Index]	:= 	"0" . LVP[A_Index]
					LVP[A_Index]	+=	0
					LVP_Last      	-=	LVP[A_Index]
					LVP[A_Index]	:= 	Round(LVP[A_Index]/100, 2)
			}
			LVP.Push(Round((LVP_Last-1)/100, 2))
			SizesO:= Sizes
	}

	ControlGetPos,,, LV_Width,,, % "ahk_id " hLV
	LV_Width -= DllCall("GetScrollPos", "UInt", hLV, "Int", 1)	;subtracts the width of the vertical scrollbar to get the client size of the listview
	
	Loop, % LVP.MaxIndex()
		DllCall("SendMessage", "uint", hLV, "uint", 4126, "uint", A_Index-1, "int", Ceil(LV_Width * LVP[A_Index])) 	;sets the column width

}

LV_EX_GetHeader(HLV) {                                                                            	;-- - Retrieves the handle of the header control used by the list-view control.
   ; LVM_GETHEADER = 0x101F -> http://msdn.microsoft.com/en-us/library/bb774937(v=vs.85).aspx
   SendMessage, 0x101F, 0, 0, , % "ahk_id " . HLV
   Return ErrorLevel
}

LV_EX_GetColumnWidth(HLV, Column) {                                                   	;-- gets the width of a column in report or list view.
   ; LVM_GETCOLUMNWIDTH = 0x101D -> http://msdn.microsoft.com/en-us/library/bb774915(v=vs.85).aspx
   SendMessage, 0x101D, % (Column - 1), 0, , % "ahk_id " . HLV
   Return ErrorLevel
}

OnMouseHover(wparam, lparam, msg, hwnd) {                                     	;-- Autofocus for Listview, Edit and RichEdit controls ;{
	
	static lastFocusedControl
	
	MouseGetPos,mx, my,, hControlOver
	WinGetClass, cclass, % "ahk_id " hwnd
	
	;ToolTip, % hControlOver "`n" hWinOver "`n" GetHex(wparam) "`n" GetHex(lparam) "`n" GetHex(msg) "`n" GetHex(hwnd) "`n" cclass
	If RegExMatch(hControlOver, "(Edit)|(SysListView32)|(RichEdit)") 
	{
			If lastFocusedControl != hControlOver
			{
					ControlFocus, % hControlOver 	, % "ahk_id " hARG
					ControlGetText, SText, Edit1    	, % "ahk_id " hArg
					If (Trim(SText) = "type your search pattern here") && (hControlOver = "Edit1")
							gosub NormalEditFont
					else If (Trim(SText) = "") && (hControlOver <> "Edit1")
							gosub ItalicEditFont
			}
			lastFocusedControl := hControlOver
	}
	else if Instr(cclass, "RichEdit") 
	{
			If !Instr(lastFocusedControl, cclass)
			{	
					ControlFocus,, % "ahk_id " hwnd
					WinGetPos, wx, wy, ww, wh, % "ahk_id " hARG
					ControlGetPos, tx, ty, tw, th,, % "ahk_id " hTabs
					ToolTip, % "Press the right`nmouse button`nto copy the text.",% (wx + tx + tw - 195), % (wy + ty + 40), 2
					SetTimer, TTOff, -4000
			}
			
			ControlGetText, SText, Edit1, % "ahk_id " hArg
			If Trim(SText) = "" 
					gosub ItalicEditFont
			
			lastFocusedControl := cclass
	}

}
NormalEditFont: 
	Gui, Arg: Font, S11 Normal C000000
	GuiControl, ARG:Font, Search
	GuiControl, ARG:, Search, % ""
return
ItalicEditFont:
	Gui, Arg: Font, S11 Italic CAAAAAA
	GuiControl, ARG: Font, Search
	GuiControl, ARG:, Search, % "type your search pattern here"
return ;}

GetHex(hwnd) {
return Format("0x{:x}", hwnd)
}

GetDec(hwnd) {
return Format("{:u}", hwnd)
}

Edit_SetFont(hEdit,hFont,p_Redraw=False) {
	
	;{------------------------------
	;
	; Function: Edit_SetFont
	;
	; Description:
	;
	;   Sets the font that the Edit control is to use when drawing text.
	;
	; Parameters:
	;
	;   hEdit - Handle to the Edit control.
	;
	;   hFont - Handle to the font (HFONT).  Set to 0 to use the default system
	;       font.
	;
	;   p_Redraw - Specifies whether the control should be redrawn immediately upon
	;       setting the font.  If set to TRUE, the control redraws itself.
	;
	; Remarks:
	;
	; * This function can be used to set the font on any control.  Just specify
	;   the handle to the desired control as the first parameter.
	;   Ex: Edit_SetFont(hLV,hFont) where "hLV" is the handle to ListView control.
	;
	; * The size of the control does not change as a result of receiving this
	;   message.  To avoid clipping text that does not fit within the boundaries of
	;   the control, the program should set/correct the size of the control before
	;   the font is set.
	;
	;-------------------------------------------------------------------------------;}
    Static WM_SETFONT:=0x30
    SendMessage WM_SETFONT,hFont,p_Redraw,,ahk_id %hEdit%
    }

Edit_SetMargins(hEdit, p_LeftMargin:="",p_RightMargin:="")  {
	
    Static 	 EM_SETMARGINS 	:=0xD3
		    	,EC_LEFTMARGIN 	:=0x1
		    	,EC_RIGHTMARGIN	:=0x2
	    		,EC_USEFONTINFO	:=0xFFFF

    l_Flags  	:= 0
    l_Margins	:= 0
	
    if p_LeftMargin is Integer
	{
        l_Flags  	|= EC_LEFTMARGIN
        l_Margins	|= p_LeftMargin           	;-- LOWORD
    }

    if p_RightMargin is Integer
    {
        l_Flags  	|=EC_RIGHTMARGIN
        l_Margins	|=p_RightMargin<<16	;-- HIWORD
    }

    if l_Flags
        SendMessage EM_SETMARGINS, l_Flags, l_Margins,, % "ahk_id " %hEdit%
}

TheEnd(ExitReason, ExitCode) {
	;OnExit("")
	ExitApp
}

;}

;{ Include(s)

#Include %A_ScriptDir%\lib\RichCode.ahk
;#Include %A_ScriptDir%\lib\class_CtlColors.ahk

;}



