; =====================================================
; 						*** AHK-RARE_TheGUI ***      	   V0.66 alpha August 09, 2019 by Ixiko
; =====================================================
; -------------------------------------------------------------------------------------------
; 		MISSING THINGS:
; -------------------------------------------------------------------------------------------
;	
;	1. The search function should have two options, Basic and RegEx
;		At the moment only RegEx is activated. In future, however, it should be possible 
;		to combine several terms by logical 'and' and / or logical 'or' (Basic-Mode).
;	2. Highlighting the search term(s) in the RichEdit controls
;	3. Keywords should be displayed in the description with a larger font
;	4. Tabs without content should be disabled

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

		SetTitleMatchMode     	, 2                    
		SetTitleMatchMode     	, Fast               
		DetectHiddenWindows	, Off                
		CoordMode                 	, Mouse, Screen
		CoordMode                 	, Pixel, Screen
		CoordMode                 	, ToolTip, Screen
		CoordMode                 	, Caret, Screen
		CoordMode                 	, Menu, Screen
		SetKeyDelay                	, -1, -1
		SetBatchLines           		, -1
		SetWinDelay                	, -1
		SetControlDelay          	, -1
		SendMode                   	, Input
		AutoTrim                     	, On
		FileEncoding                	, UTF-8

		OnExit("TheEnd")
		;OnError("FehlerProtokoll")

		hIBitmap:= Create_GemSmall_png(true)
		Menu, Tray, Icon				, % "hIcon: " hIBitmap
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
		
	; ------------------------------------------------------------------------------------------------------------------------------------------------------------
	;	loading AHK-Rare.ahk
	; ------------------------------------------------------------------------------------------------------------------------------------------------------------;{
		If FileExist(A_ScriptDir . "\AHK-Rare.ahk")
			FileRead, AhkRare, % A_ScriptDir "\AHK-Rare.ahk"
		else
		{
				IniRead, filepattern, % A_ScriptDir "\AHK-Rare_TheGui.ini", Properties, RareFolder
				If Instr(filepattern, "ERROR")
				{
						FileSelectFile, filepattern,, % A_ScriptDir, % "Please enter the location of the AHK-Rare.ahk file here!", % "AHK-Rare.ahk"
						If (filepattern = "") || !FileExist(filepattern)
								ExitApp
						IniWrite, % filepattern, % A_ScriptDir "\AHK-Rare_TheGui.ini", Properties, RareFolder
				}
				FileRead, AhkRare, % filepattern
		}
	;}
		
	; ------------------------------------------------------------------------------------------------------------------------------------------------------------
	;	get the last gui size
	; ------------------------------------------------------------------------------------------------------------------------------------------------------------;{
		IniRead, GuiOptions, % A_ScriptDir "\AHK-Rare_TheGui.ini", Properties, GuiOptions
		If !Instr(GuiOptions, "Error") && !(GuiOptions = "")
		{
			GuiOptions	:= StrSplit(GuiOptions, "|")
			LogoW     	:= GuiOptions.3 
		}
		
		IniRead, SearchMode, % A_ScriptDir "\AHK-Rare_TheGui.ini", Properties, SearchMode
			If Instr(SearchMode, "Error") || (SearchMode = "")
				SearchMode:= "Basic"
	;}
	
	; ------------------------------------------------------------------------------------------------------------------------------------------------------------
	;	Settings array for the RichCode control (code & examples)
	; ------------------------------------------------------------------------------------------------------------------------------------------------------------;{
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
;}

;{03. draw primary gui 

		global hArg, ARG, hSearch, hTabs
		Gui, ARG: NEW
		Gui, ARG: +LastFound +HwndhARG +Resize 
		Gui, ARG: Margin, 0, 0
		;Gui, ARG: Color, 172842
	;-: --------------------------------------
	;-: Logo and Backgroundcolouring
	;-: --------------------------------------
		Gui, ARG: Add, Progress        	, % "x0 y0   w" (LogoW + 10) " h85 c172842 Disabled vBGColorLogo" , 100
		Gui, ARG: Add, Pic               	, % "x12 y10 BackgroundTrans"  	, % A_ScriptDir "\assets\AHK-Rare-GuiLogo.png" ;(LW//4.37) w" (LW:= 450) " h" (LogoH:= 71) "
		Gui, ARG: Add, Progress        	, % "x0 y85 w" (LogoW + 10 ) " h2 vDevider" , 100
		Gui, ARG: Add, Progress        	, % "x" (LW + 7) " y0 w2 h85" , 100
		Gui, ARG: Font, S7 CWhite q5, Normal
		Gui, ARG: Add, Text	                , % "x" (LW - 300) " y6 w300 Right vStats BackgroundTrans"                                   	, % ""
	;-: --------------------------------------
	;-: temp. text controls
	;-: --------------------------------------
		Gui, ARG: Font, S12 CWhite q5, Normal
		Gui, ARG: Add, Text	                , % "x" (LW + 30) " y20 vField1 BackgroundTrans"                                                 	, % "  . . . . . create index: "
		GuiControlGet, Field_, ARG: Pos, Field1
		Gui, ARG: Add, Text              	, % "x" (Field_X + Field_W + 3) " y20 w300 vField2 Center BackgroundTrans "        	, % "00.00.000001"
	;-: --------------------------------------
	;-: Edit control for search patterns
	;-: --------------------------------------
		SW:= LW + 20 
		Gui, ARG: Font, S10 Normal CBlack q5, Normal
		Gui, ARG: Add, DDL                	, % "x" (SW) " y50 w65 vSearchAlgo HWNDhSAlgo E0x4000"                                   	, Basic|RegEx
		PostMessage, 0x153, -1, 33,, ahk_id %hSAlgo%  ; Setzt die Höhe des Auswahlfeldes.
		GuiControl, ChooseString, SearchAlgo, % SearchMode
		Gui, ARG: Font, S11 Italic CAAAAAA q5, Normal
		GuiControlGet, SA_, ARG: Pos, SearchAlgo
		Gui, ARG: Add, Edit              	, % "x" (SW+SA_W+1) " y50 w500 r1 vLVExpression HWNDhSearch -Theme"            	, % "type your search pattern here"
		Gui, ARG: Font, S16 Normal CWhite q5, Normal
		Gui, ARG: Add, Text             	, % "x" (SW) " y5   w300 h40 vGB1    HWNDhGB1 Border BackgroundTrans"        	, % ""
		Gui, ARG: Add, Text             	, % "x" (SW + 10) " y12 w300 h30 vField3 HWNDhField3 -Wrap BackgroundTrans"	, % ""
		Edit_SetMargins(hField3, 40, 20)
		Edit_SetMargins(hSearch, 20, 20)
		;CTLCOLORS.Attach(hSAlgo, "677892")
	;-: --------------------------------------
	;-: Functions Listview
	;-: --------------------------------------
		Gui, ARG: Font, S9 Normal CDefault q5, Normal
		Gui, ARG: Add, Listview        	, % "xm y" (LogoH + 15) " w" LogoW+5 " r25 HWNDhLVFunc vLVFunc gShowFunction AltSubmit Section", main section|function name|short description|function nr.
		Gui, ARG: Font, S8 CDefault q5, Normal
		GuiControlGet, LV_, ARG: Pos, LVFunc
	;-: --------------------------------------
	;-: Short description section
	;-: --------------------------------------
		Gui, ARG: Add, Edit                	, % "xm y" (LV_Y + LV_H + 10) " w" LogoW//4 " r20 t8 HWNDhShowRoom1 vShowRoom1"
		GuiControlGet, SR_, ARG: Pos, ShowRoom1
	;-: --------------------------------------
	;-: Code highlighted RichEdit control
	;-: --------------------------------------
		Gui, ARG: Add, Tab                	, % "x" (LogoW//4+5) " y" (LV_Y+LV_H+10) " w" (LogoW//4*3) " h" SR_H-10 " HWNDhTabs vShowRoom2", FUNCTION CODE|EXAMPLE(s)|DESCRIPTION
		Gui, ARG: Tab, 1
		RC[1] := new RichCode(Settings, "ARG", "x" (LogoW//4+5) " y" (LV_Y+LV_H+30) " w" (LogoW//4*3) " h" SR_H-30, 0)
		Gui, ARG: Tab, 2
		RC[2] := new RichCode(Settings, "ARG", "x" (LogoW//4+5) " y" (LV_Y+LV_H+30) " w" (LogoW//4*3) " h" SR_H-30, 0)
		Gui, ARG: Tab, 3
		RC[3] := new RichCode(Settings, "ARG", "x" (LogoW//4+5) " y" (LV_Y+LV_H+30) " w" (LogoW//4*3) " h" SR_H-30, 0)
		WinRC := GetWindowInfo(RC[1].Hwnd)
	;-: --------------------------------------
	;-: Create a ToolTip control
	;-: --------------------------------------
		TT := New GuiControlTips(HARG)
		TT.SetDelayTimes(500, 3000, -1)
		Loop, 3
			TT.Attach(RC[A_Index].Hwnd, "Press the right`nmouse button`nto copy the text.", True)
	;-: --------------------------------------
	;-: Show the gui
	;-: --------------------------------------
		Gui, ARG: Show, AutoSize xCenter yCenter Hide, , AHK-Rare_TheGui
		If !Instr(GuiOptions, "Error") && !(GuiOptions = "")
		{
			DPIFactor:= screenDims().DPI / 96
			Gui, ARG: Show, % "x" GuiOptions.1 " y" GuiOptions.2 " w" (GuiOptions.3 // DPIFactor) " h" (GuiOptions.4 // DPIFactor), AHK-Rare_TheGui
		}
		else 
			Gui, ARG: Show,, , AHK-Rare_TheGui
	;-: --------------------------------------
	;-: Resizing now
	;-: --------------------------------------
		WinMove, % "ahk_id " hARG,,,, % A_GuiWidth - 1, % A_GuiHeight -1
		gosub ARGGuiSize
		WinSet, Redraw,, % "ahk_id " hArg
		OnMessage(0x200, "OnMouseHover")
		OnMessage(0x03, "ChangeStats")
		SetTimer, ShowStats, -500

;}

;{04. generate and fill listview with data

	; indexing AHK-Rare
		ARData:= RarefuncIndexer(AHKRare)
	; remove text controls
		GuiControl, ARG: Hide 	, Field1
		GuiControl, ARG: Hide 	, Field2			
		GuiControl, ARG: Show	, Field3			
	; populate listview with data from AHK-Rare.ahk
		GuiControl, +Default, ARG: LVFunc
		For i, function in ARData
			LV_Add("", function.mainsection, function.name, function.short, function.FnIndex), fc:= A_Index
	; show's the sum of functions
		GuiControl, Text, Field3, % "displayed functions: " fc
;}

;{05. Hotkey(s)
		
	; RButton for getting text to clipboard
		Hotkey, IfWinActive, % "ahk_id " hARG
		Hotkey, ~RButton	, CopyTextToClipboard
		Hotkey, ^f           	, FocusSearchField
		Hotkey, ^s           	, FocusSearchField
		
	; Listview Hotkey's
		CisF:= Func("ControlIsFocused").Bind("LVExpression")
		Hotkey, If             	, % CiF
		Hotkey, ~Up           	, ListViewUp
		Hotkey, ~Down      	, ListViewDown
		Hotkey, ~Enter    	, GoSearch
return
;}

;--------------------------------------------------------------------------------------------------------------------------------------
;{06. Labels
;--------------------------------------------------------------------------------------------------------------
ShowFunction:                 	;{

	toshow  	 := []
	toshow[1] := ""
	toshow[2] := ""
	
	selRow:= LV_GetNext(0)
	ShowFunctionsOnUpDown:
	LV_GetText(fnr, selRow , 4)
	
	For i, function in ARData
		If Instr(function.FnIndex, fnr)
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
;--------------------------------------------------------------------------------------------------------------
GoSearch:                         	;{

		Gui, Arg: Submit, NoHide
		If StrLen(LVExpression) = 0
				return
				
		foundIndex:= 0
		GuiControl, ARG:Focus, LVFunc
		
		results:= RareSearch(LVExpression, ARData, AHKRare, SearchAlgo)
		If results.MaxIndex() > 0
		{
			; fill listview with collection
				Gui, ARG: Default
				LV_Delete()
				GuiControl, ARG: -Redraw, LVFunc
				Loop, % results.MaxIndex()
				{
					foundIndex:= Results[A_Index]
					For i, function in ARData
						If Instr(function.FnIndex, foundIndex)
							LV_Add("", function.mainsection, function.name, function.short, function.FnIndex)
				}
				GuiControl, ARG: +Redraw, LVFunc
				GuiControl, Text, Field3, % "Search result: " results.MaxIndex() " functions"
		} else {
				GuiControl, Text, Field3, % "Search result: nothing matched"
		}
return ;}
;--------------------------------------------------------------------------------------------------------------
ARGGuiSize:                      	;{

	Critical, Off
	Critical
	GuiControl, ARG: Move, Devider        	, % "w" (A_GuiWidth) 
	GuiControl, ARG: Move, BGColorLogo, % "w" (A_GuiWidth) 
	GuiControl, ARG: Move, LVExpression, % "w" (A_GuiWidth - LW - 32 - SA_W)
	GuiControl, ARG: Move, GB1           	, % "w" (A_GuiWidth - LW - 30) " h40 y5"
	GuiControl, ARG: Move, Field3           	, % "w" (A_GuiWidth - LW - 40) " h30"
	GuiControl, ARG: Move, LVFunc         	, % "w" (A_GuiWidth) " h"(A_GuiHeight//3)
	GuiControlGet, LV_, ARG: Pos, LVFunc
	LV_AutoColumSizer(hLVFunc, "16% 15% 60%")
	GuiControl, ARG: Move, ShowRoom1 	, % "y" (LV_Y+LV_H+10)    " w" (A_GuiWidth//4)  " h" (A_GuiHeight-LV_Y-LV_H-10)
	GuiControl, ARG: Move, ShowRoom2 	, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+10) " w" (A_GuiWidth//4*3-5) " h" (A_GuiHeight-LV_Y-LV_H-10)
	GuiControl, ARG: Move, % RC[1].hwnd	, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+30) " w" (A_GuiWidth//4*3-5) " h" (A_GuiHeight-LV_Y-LV_H-30)
	GuiControl, ARG: Move, % RC[2].hwnd	, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+30) " w" (A_GuiWidth//4*3-5) " h" (A_GuiHeight-LV_Y-LV_H-30)
	GuiControl, ARG: Move, % RC[3].hwnd	, % "x" (A_GuiWidth//4+5) " y" (LV_Y+LV_H+30) " w" (A_GuiWidth//4*3-5) " h" (A_GuiHeight-LV_Y-LV_H-30)
	Critical, Off
	SetTimer, ShowStats, -200
	
return ;}
;--------------------------------------------------------------------------------------------------------------
ARGGuiClose:                  	;{
ARGEscape:

	Gui, Arg: Submit, NoHide
	win := GetWindowInfo(hARG)
	IniWrite, % SearchAlgo, % A_ScriptDir "\AHK-Rare_TheGui.ini", Properties, SearchMode
	IniWrite, % win.WindowX "|" win.WindowY "|" (win.ClientW) "|" (win.ClientH), % A_ScriptDir "\AHK-Rare_TheGui.ini", Properties, GuiOptions
	
ExitApp ;}
;--------------------------------------------------------------------------------------------------------------
ShowStats:                       	;{

	WinGetPos, wx, wy, ww, wh, % "ahk_id " hARG
	GuiControl, ARG:, Stats, % "x" wx "  y" wy "  w" ww "  h" wh
	
return
ChangeStats() {
	
	WinGetPos, wx, wy, ww, wh, % "ahk_id " hARG
	GuiControl, ARG:, Stats, % "x" wx "  y" wy "  w" ww "  h" wh
	
}
;}
;--------------------------------------------------------------------------------------------------------------
CopyTextToClipboard:     	;{

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
return ;}
;--------------------------------------------------------------------------------------------------------------
FocusSearchField:            	;{
	GuiControl, ARG: Focus, LVExpression
return ;}
;--------------------------------------------------------------------------------------------------------------
ListViewUp:
ListViewDown:                 	;{

	If !WinActive("AHK-Rare_TheGui ahk_class AutoHotkeyGUI")
			return
	If Instr(A_ThisLabel, "ListViewUp")
	{
			Send, {Up}
	} else {
			Send, {Down}
	}

	selRow:= LV_GetNext("F")
	gosub ShowFunctionsOnUpDown
	
return ;}
;--------------------------------------------------------------------------------------------------------------

;}

;{07. Functions

RareSearch(LVExpression, ARData, file, mode:="RegEx") {

		results:= Array()
		 
	; collecting all results first
		Loop, Parse, file, `n, `r
		{
				If RegExMatch(A_LoopField, "(;\s*\<\d\d\.\d\d\.\d\d\d\d\d)|(;\s*\<\d\d\.\d\d\.\d\d.\d\d\d\d\d)")
						RegExMatch(A_LoopField, "[\d\.]+", FnIndex), found:= 0, continue
						
				If (found = 0) && RegExMatch(A_LoopField, LVExpression) 
						results.Push(FnIndex), found:= 1
						
		}
		
return results
}

RarefuncIndexer(file) {												                     			;-- list all functions inside AHK-RARE script 
	
	ARData:= Object(), ARData.DescriptionKeys := Object()
	s:=fI:=descFlag:=descKeyFlag:=descKeyFlagO :=0
		
	Loop, Parse, file, `n, `r
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
					RegExMatch(A_LoopField, "[\d\.]+", FnIndex)                                   	; reads the functions numbers (e.g. 04.01.00011)
					ARData[(fI)]                                                   	:= Object()
					ARData[(fi)].description                                	:= Object()
					ARData[(fI)].FnIndex                                       	:= FnIndex
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
							ARData.DescriptionKeys[(descKey)].Push(FnIndex "|")   
				
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

ControlIsFocused(ControlID) { ;-- true or false if specified gui control is active or not

	GuiControlGet, FControlID, ARG:FocusV
	If ControlID = FControlID
			return 1
	
return 0
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

LV_EX_GetHeader(HLV) {                                                                            	;-- Retrieves the handle of the header control used by the list-view control.
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
	If RegExMatch(hControlOver, "(Edit)|(SysListView32)|(RichEdit)|(ComboBox)") 
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
	GuiControl, ARG:Font	, Edit1
	GuiControl, ARG:     	, Edit1, % ""
return
ItalicEditFont:
	Gui, Arg: Font, S11 Italic CAAAAAA
	GuiControl, ARG:Font	, Edit1
	GuiControl, ARG:     	, Edit1, % "type your search pattern here"
	; restore all functions
	If foundIndex
	{
			LV_Delete()
			For i, function in ARData
					LV_Add("", function.mainsection, function.name, function.short, function.FnIndex)
			GuiControl, Text, Field3, % "displayed functions: " fc
			foundIndex:= 0
	}
	
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

screenDims() {								                       						        			;--returns a key:value pair of width screen dimensions (only for primary monitor)

	W := A_ScreenWidth
	H := A_ScreenHeight
	DPI := A_ScreenDPI
	Orient := (W>H)?"L":"P"
	yEdge := DllCall("GetSystemMetrics", "Int", SM_CYEDGE)
	yBorder := DllCall("GetSystemMetrics", "Int", SM_CYBORDER)

 return {W:W, H:H, DPI:DPI, OR:Orient, yEdge:yEdge, yBorder:yBorder}
}

GetWindowInfo(hWnd) {                                                      					 	;-- returns an Key:Val Object with the most informations about a window (Pos, Client Size, Style, ExStyle, Border size...)
    NumPut(VarSetCapacity(WINDOWINFO, 60, 0), WINDOWINFO)
    DllCall("GetWindowInfo", "Ptr", hWnd, "Ptr", &WINDOWINFO)
    wi := Object()
    wi.WindowX 	:= NumGet(WINDOWINFO, 4	, "Int")
    wi.WindowY		:= NumGet(WINDOWINFO, 8	, "Int")
    wi.WindowW 	:= NumGet(WINDOWINFO, 12, "Int") 	- wi.WindowX
    wi.WindowH 	:= NumGet(WINDOWINFO, 16, "Int") 	- wi.WindowY
    wi.ClientX 		:= NumGet(WINDOWINFO, 20, "Int")
    wi.ClientY 		:= NumGet(WINDOWINFO, 24, "Int")
    wi.ClientW   	:= NumGet(WINDOWINFO, 28, "Int") 	- wi.ClientX
    wi.ClientH    	:= NumGet(WINDOWINFO, 32, "Int") 	- wi.ClientY
    wi.Style   	    	:= NumGet(WINDOWINFO, 36, "UInt")
    wi.ExStyle 		:= NumGet(WINDOWINFO, 40, "UInt")
    wi.Active  		:= NumGet(WINDOWINFO, 44, "UInt")
    wi.BorderW  	:= NumGet(WINDOWINFO, 48, "UInt")
    wi.BorderH   	:= NumGet(WINDOWINFO, 52, "UInt")
    wi.Atom        	:= NumGet(WINDOWINFO, 56, "UShort")
    wi.Version    	:= NumGet(WINDOWINFO, 58, "UShort")
    Return wi
}

TheEnd(ExitReason, ExitCode) {
	;OnExit("")
	ExitApp
}

;}

;{08. Include(s) and TrayIcon

Create_GemSmall_png(NewHandle := False) {
Static hBitmap := 0
If (NewHandle)
   hBitmap := 0
If (hBitmap)
   Return hBitmap
VarSetCapacity(B64, 31464 << !!A_IsUnicode)
B64 := "iVBORw0KGgoAAAANSUhEUgAAADAAAAAyCAYAAAFtzWgaAAAACXBIWXMAAA7EAAAOxAGVKw4bAABB82lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMwNjcgNzkuMTU3NzQ3LCAyMDE1LzAzLzMwLTIzOjQwOjQyICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgICAgICAgICAgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiCiAgICAgICAgICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIgogICAgICAgICAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyI+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+QWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4bXA6Q3JlYXRlRGF0ZT4yMDE4LTEyLTE1VDE2OjE1OjM2KzAxOjAwPC94bXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhtcDpNb2RpZnlEYXRlPjIwMTgtMTItMTVUMTY6NDI6MzErMDE6MDA8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDE4LTEyLTE1VDE2OjQyOjMxKzAxOjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICAgICA8cGhvdG9zaG9wOkNvbG9yTW9kZT4zPC9waG90b3Nob3A6Q29sb3JNb2RlPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOmU5ZjdkMGIwLTdmMDctMTY0MC05ZmU3LWI1YmEzYTNiNzU3YTwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmZiNzY3NDhlLTAwN2YtMTFlOS04YWQ0LWYwZGEyMWYxNDhhYTwveG1wTU06RG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjI0YmE4NTQ1LTdhMjEtYmQ0OC05M2JkLWYzMDVhMDkzYjhiZDwveG1wTU06T3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06SGlzdG9yeT4KICAgICAgICAgICAgPHJkZjpTZXE+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmNyZWF0ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDoyNGJhODU0NS03YTIxLWJkNDgtOTNiZC1mMzA1YTA5M2I4YmQ8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTgtMTItMTVUMTY6MTU6MzYrMDE6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmNvbnZlcnRlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6cGFyYW1ldGVycz5mcm9tIGltYWdlL3BuZyB0byBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wPC9zdEV2dDpwYXJhbWV0ZXJzPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo2OWZlNzMzZS0wOTM0LTkyNGYtODA4OS1mZjY2OTBlY2ZhMTE8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTgtMTItMTVUMTY6NDA6NDErMDE6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmNoYW5nZWQ+Lzwvc3RFdnQ6Y2hhbmdlZD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPnNhdmVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDppbnN0YW5jZUlEPnhtcC5paWQ6ZWM3YzY4ZTMtNzY5Ny1iMjQ1LThmZTMtMzYzZWY4NWJhZjI2PC9zdEV2dDppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6d2hlbj4yMDE4LTEyLTE1VDE2OjQyOjMxKzAxOjAwPC9zdEV2dDp3aGVuPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgQ0MgMjAxNSAoV2luZG93cyk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpjaGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5jb252ZXJ0ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OnBhcmFtZXRlcnM+ZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL3BuZzwvc3RFdnQ6cGFyYW1ldGVycz4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPmRlcml2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OnBhcmFtZXRlcnM+Y29udmVydGVkIGZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmc8L3N0RXZ0OnBhcmFtZXRlcnM+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5zYXZlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6aW5zdGFuY2VJRD54bXAuaWlkOmU5ZjdkMGIwLTdmMDctMTY0MC05ZmU3LWI1YmEzYTNiNzU3YTwvc3RFdnQ6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OndoZW4+MjAxOC0xMi0xNVQxNjo0MjozMSswMTowMDwvc3RFdnQ6d2hlbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OnNvZnR3YXJlQWdlbnQ+QWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICAgICA8c3RFdnQ6Y2hhbmdlZD4vPC9zdEV2dDpjaGFuZ2VkPgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgPC9yZGY6U2VxPgogICAgICAgICA8L3htcE1NOkhpc3Rvcnk+CiAgICAgICAgIDx4bXBNTTpEZXJpdmVkRnJvbSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6ZWM3YzY4ZTMtNzY5Ny1iMjQ1LThmZTMtMzYzZWY4NWJhZjI2PC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICA8c3RSZWY6ZG9jdW1lbnRJRD54bXAuZGlkOjI0YmE4NTQ1LTdhMjEtYmQ0OC05M2JkLWYzMDVhMDkzYjhiZDwvc3RSZWY6ZG9jdW1lbnRJRD4KICAgICAgICAgICAgPHN0UmVmOm9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjI0YmE4NTQ1LTdhMjEtYmQ0OC05M2JkLWYzMDVhMDkzYjhiZDwvc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICA8L3htcE1NOkRlcml2ZWRGcm9tPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpYUmVzb2x1dGlvbj45NjAwMDAvMTAwMDA8L3RpZmY6WFJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOllSZXNvbHV0aW9uPjk2MDAwMC8xMDAwMDwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPGV4aWY6Q29sb3JTcGFjZT42NTUzNTwvZXhpZjpDb2xvclNwYWNlPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24+NDg8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpQaXhlbFlEaW1lbnNpb24+NTA8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg"
B64 .= "ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVuZD0idyI/Plszt9AAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAGbNJREFUeNpiZIAARgYGBj4GBgY2BgaGXwwMDJ8YGRgYGHMdPP9Zf9ZiYGG+zWCYX89wdOc+BhYGBgYmtXJ+hh3ZGxiYdQwZ/j+azvDp/V0Ghk2LlzOEePnWJ7ma/N9pIv//yvZd/xkYGDgZZ+9cy8DAwMDgG5X6392Vg8H3je1z7QQfKSa5NyIMGi//MUi8fcfywpuHoWXPShk2Li4GdMABYwAAAAD//2JGEuBjYGDgYWBg+M/AwPCHMZ4t+f8fqysMYb+EGa6XOzAUWWcwOLk7lzAJsN9i+H/5JcMMCQGG38f5GdYn9jAcOXt6IdPEz4eZ+PSFGJIef2cIUeZiOHj3GMOm9aveMECdK5rnKPY/zz/wPwMDA+vyJYsZmDRe/GY4vGj164D9fxi2nr8wc+26tb85eLlRnMoIxQwMDAwMAAAAAP//Yty1dRaDm3ca8xJm5T/lUXwMmRd/M7CwsTPw/+FmeKUsx6DCycbwmKWQgVWi/HFxxzYFZlcbuypLLfODPF8eMiR/EGFg/+vO4PTrM8PkXBUG+XBrBqVblgz6uv8ZOJ+951966uhXJlEembay7haR88/ZGZ66uTLc/7mG4aodB8OzpUwMj9b/Ynj08iDDwXULGbymdKUzMDD0MM7dBImMZL9gZnk/zz/6TNcY7nIxMdjfZ2JwicpiYGEQYvDLTfRhYGDYtnrL2v+Mu1YcZPj/F+Ih92h7xozggml/9shlMPHsYBDU+MnQufeg4YZNay/APb1z6UEGHqZvDO9/PocHi09CksQMLsvnGd+OS69btv4ZAwMDA8P//wyMvP8ZAHzTT0jTcRjH8ffvt9XaH7fphksdSUZJlgxbFEEhEiRhXUo9lEWHLpF1MC9dokO3oBQ6JCREyyRsVtMIKaQRDKfTbVSGA4uiZG2TnOmcut/v28GFQdDn9DzP8cPrkf6qTwMYYE1Zfs/lTWbz81qt4Uj45LXEmycm7TznA4VU/DSRtFsxl5axydxM3eYOtt946QS+S0DRhYN1s2lFcIxqFhUZ/YYYn8uN1Ozez9HLFxl//JXgizNc6h8zyk87WmeN1fU0/lKRjFZEUqLrRAGvXIKJWoVod4jcJw8i5QYwSEBVKBL6ELx/jlFfluwOFYPkQlnJ0dxSymrIgkHroL7zSjtwSwOkLJF429ZRp67AkiEWm6ehxMSU8wDOaQNzaZWZxABDsZlGYFn2eXrFzRFf8XDhJB+LVCpsWhyZOFd/eNnZsBdr/Bttg2OngAUAOWnZSLfPm70XjboqF0343RLpJQfXj1fyZXKaYGJyFejvG/QKAFnVgaoD4F3nkV0rPcPwSOyjZlsVgdcD3J6aONz70LOcm8sAoN2SsgMw1OMX9adrrV3FdzP2Pc8p6SvjvdUYBAJ68/o/ayVVoBdJAN4+6Fs6dLbJPeIvH28N6AjZBlq8/V5Fya1z0ApVJS0vgCL+3MJ3hF4N2Z61A9NSVl5DJ8n8L5q8qX/ym6zy/Ym6DuD463M/uO9x3Blw8eMECVEKG7Fa+XMh01lGqTuwpoCDrQfypCZrjVprbT4pH1D2Y5m1IuVHzPglhWIuOiCcTkqCLocSishxwMF1wB13fO97356gi3zw+gfee7/eb9FR9wkAu4tfF4Dm0HM5a1OSrW2j6tRjk4E0/toike00YxFBDBoFWZKJXx8iLSGGBH8A84IB6/WwKkWU8BW/958jdb0bAO8Vxw/Kprw9iM6mZnYUFmiARLsh3fVwTjKmRcEvBRIZw0FSZwUZc+kYFl0IKYIkGTFqtfiTUjHFm0hJW0diZh5KeImrvwaIU07Q6Z3/+Vh100HAIwDDflEUDGbNYNR6yRJadikaVGWRfnUzeo2CjJ5t2luUvCSIS7UiuaYp2GPHEgyx9fYWbNtTiMgKrr5Zrl6vJiprB56+k5R/eHa1AEzHy0rGNhbnxYYsqQw2VjDQtsBCEEQoyJIVxs+vY7FyL8kzblYHboBvifJ38pi5PYaIkTEaLChRMrqgwD1so3PC6T9RU1cAOLRAuKN/4PjosNc99N7X+S/nfok1MxpjeBSLT8dCUI/tYw+6py2s8k4g6yTkjGeYjiThd+pRxsz4RnS4f9NgMMq03fz9768aWvcBlwBZtH9bD8CLZUVaIKuERwY3ZK1n2DqO3hxLxngQWSyRnZSKLuDCppepMW2lSzFzYMqLPxwhPs7CxUcDBPqdP168dLkSGOpo+U7ZbT+IqL1w9n6lSp7fJwBrbkX5HfPYpJQ4M4JR1uFMnkev1/LKQAzCN487P5OdOYeYmBwndm0S/aUVVDBxFKgG7jSda4wAFObvR7MUVrnHN+2tKuDp/uiLOCVaen/YkMabN2ZYMxdmUDeH/4kEqrYHmctN51XP2zyu2Igr/Z4KJt4CPgdG6+tOR0LeACHvssuxdx9aIUbLSYcKLNoP570LnPmUY9d2OR1ssvXRPZaB1ZnNmqwIO28+xeHeIzhwvQbUAr6Wlmb1/6JpomMEkgGiJO0K2k/1KMAfVVQm9ZsOhO92vUGax8/sB+eR66+h/tSDY8RVthyLr7WtURXaCP+F5btAIyKskuYxM72C7lPNKjBVNVRqUTa6zhy9dY6IbKJ3WyDy2eSEHWgAAo01TWrYJ7jPnIZ7DyUu1HVBWCEmKoRXdqPVRIEQD2zKC8VFOmBNyeZn/6y93PMkMNLccFp+cHy0qGETGrOCfW8h/zJeZrFxVXcY/91t7qwe2+MFO06M4yUlhJKtCcIqhYCSFlLUkgpVbdqHUmhRg0h5qAiVqkIVKlRaaBvEokYizkbjJE5McBaVhDTxEsvURN5iG+M1nvEWe2Y8nhnf5fTBY8cJPHCln87DvedK5zvn/L/vf/uf5rOEAmiLTFFKjfKirGEBdsogrUWjnUpIX1nsHLt+uWH34IznOcUYdVxYtw7XaIyVkz4yck2mOmP4H/CyxB8lR5fICs/iCaaTPRa2+r+Q7FdHustbrl5rAZJXPvlQbHzw+wuBRwKcZwvUmb15D/LfNeMoScGm0CRLIn6iusT6ASemVyMJ9K1dR97kGF6nl4BPZ0R+irL0GgaHDvCLQx0PAQ1AEhDzkjheXrNzsotaV4bspGO1xFCOxZONKhIuyqZKiKpNOJ1+dM1BuqYzumIlBe4ogbueIitXY6AniR48Q33H+zxX2V4ONAGGDKhvPvNm47DW4Mr0Z2F6XBR8Ct/tcnNPeAPFkTI8qsWs5sE/oxGXNM6v9xMrV8hwb6Z4lZe8TSWU3JtGb1jDU/Ikb5cvuQwUArLytx1/2t18/Oq2cT2BnYiyecbgEcMic0RnbNaFaVjo5g1sTfDaT9MZKNFR0xwUlNxJ+kgGgfxMNBWS41FEXKc7GCd7651SUZZ/VV1z9yG1+J7oi5lZObRH72dV/R6k6UymnG6yMtwkjGU4OmbIzB/Gr2hke5w4TAdqTjp9MzHEN3pRPtLxFfpIjLYRvdHJHZExGs9nmW/sr3kFsCVg5YV9L7Y5cr5Fv/kxre+e5It6lVnNxhWN0dnpRt/5a6YR3D3eis+IUlJayIaNLuLhMI6AE0kSJAwHAS2PxnPt7Diy7yXgfSAkAwP/fqe9VphFuBxlLPtBPvkrNDwOFT2QwZoCDbmwnjVWHU6fxaxXMJ2zijFDI+KzmepVmLyQwcRJL5FQjCYlMgbUAuOAUACzaajznHrik9/SDHf7nkW/vxn3Z05EMkokoKBP6agOL5aVZNIuYvnaFTRcMym95mcmqpG0BJIrSVfrKV7/8OIu4D/ADIB8uuKwDYTei3eWt7Y10vevPfj3bSFvYwkFS5fgmjXITdzgMTmBI+xhxFaJSzJp5ixhOU7CmGU6YSHcgzQ5Mq8Al4DI2aqDAkC1bUHqmrfkbL2vqbO+d3049xTx3jj5sptvLl3K56M2ubkT/EQb5sZUNweuLaegtYfBhImqaoyroBbrVO69+A7QDdhiro4iW4pE9f7DAoi9XrX/R32qic9I4NKcTGoWjZ443okZHC6wknH08ADvyhf41a7tfO+FH/LESz+jeLiZMzWNe1Pax6urjojZVBMnR3LcRHLcpArUcOVQwwNHfHehWRZJWSWhJXh7+wTBwQx6Jt2E+h30PrqD3pZ2gn2DtJ06z7iu2W0d12qAQUAYuoyhp1aQTJokkyZ7q4+JlFSfrS3NaTlReh+7r/ZzZnmcvLDK9UyLO0wXrz7j5vnLOynKLkJ3Oxg4cJRXuhr/CFwBkpWnjgnblrDtuaIrS4rCPClPjp38y1uPm3KUAa+Hzg8kuv0SQT3Gn7cplCpZFGaXUhutw3VuAG3t6hhQD4weOlghjHCMeeb2QLVYTEqq6yPvHXzokjNKj0+i/7DMfmTyuvLxLfeRN+WlpuY8y2qDPF9/+A9AM2BKQmIxAHJWX4DFpEzfBP43uPSNni5pHW1ygCceDmF9Xszyy4/jndAJuNP43aaxTuAyMFVVdVw4PR4Ws2D6t3P24EUBTO/5ePvm5uGtVGg/RkwYuEIeytx1+K9PYDW0cKz6o78CHYAtKYLbmetZDBvTlL9ESqqhfxg/f1gNF5H292fpf+0kwXSJ6dZ++koKj6eO5cyJ6qNi7vObSClfl21bxi8HSZNCt3CpolIABvDp6u+c6H/a+U9CU0Faf+Pl7Atwqb6hEugFbMuUuB2RsmUZCdA82JZACOUWUrEluuPMvke6Ynl8+1KcjJpRmnZcfTl1chJH9x8TIgYLTINI2AvRQJ3vtU3FIm5FvyqyCGBgm9S95enT2WcDITVh23YdEASQlVt7K0mSsG6GChbeClugajqK5ryF0wcPCcCITk/XK/cui/y+4fgWoBEwjn9QIZCj3CSCpHw5B33dR0plJSm1N/bXmfR/Vs08Nsr7zOOf95h3Zjwen4xvG2O83MFxICRNglpCQ1iggSREzdVk20grZUu0Jd2sNnsoUlNlk7TZEiXb3SqBLCScXsAccSCtk7SEUDDGHCUc5rAxtvGM5/Dc7/nbPxgToNlCpb7SI41Gmp+e5/k9z/f5fp93pF3r3vqjL+c//px01aFy7mBtxvT7xy+cWLvwd9GuAv22mLdpUrV3W0+3e1HZFLfentQ8RxStfnyFt+fYsFZWUeIO6S53wufRxtSYWjopqa7CgC5r2XiVt3fEayRHTN0VdywpZo1YUSNhDgvLisSy2VBvODi4Ixjsz20+jByhE7//bPuV3N/5rQdyAWx4+1rnH1026rT24Us/fH7qz3710/2eJWyZdZrO5tPIJV6KpSL0E/cQ6BlHk+4lXZ4iryGDt1bHV5gm35shnbHQY5DJQNYowPBV4tZkChNZCk2JQiOJKgxURcGtOiTtOlLZOjQ5hs/pYuDccdwN7tjfvb5nIdADRHPBOJ172sSM2QsuB9C+/bJCm/vA46Mcz73wvnvHzUkOHtnXHVSNygaKnDRDU/Ppm6jhTtjoqqAoJZh7Kg9DctBlHVsCv1VIdTSL28mAS0N1abhVBU1RcRsGl8rKSdWNIy8ZxqvJFPjzyXdlEHm3I/um45ITpNMKobDC1KJfQ3o/B86fJVQ14dC/vrH1eeA0EMmVmLiamJIrk8LXFr3S1fHh1mpfcwyPEkBWFIQs4U5ZZFWT382SCBcaPHY4j/pkGXmmH7+ej8txY8lxRpTjOKqMW9FQFBWXopInFPINkF0aF0tcZAsLqS4uxVeokV95P+UT6ymuUlG9LvQRndiFGOdOpxk+exFfcTf9w13YZzrZo479r3UffbwSOJdbF1mjQsP3n8vfWNu14uKiwumHyPpCCLmKBCoJ28bj2Iy1oUFITLEMZLOSL9UGTCmFJMlIEpi4CMhxalwxzlgp+mSLcJ2PSHUe4UqNqJphbHkF82bNRtGy+M+4aThaR9l0HwV1hXjqSkDTEIk0ybMRgucMes/tY7DnJE7hJJyyM2T3fYzQbfu8q6bl55u3LgNGlJ+/8NKb5b0VW48cODMhWmHQmn6IveH7GB5U+Tf9DI8Iwe2moF44FNk2DiYJIRgRfpAECAscB9W2KSFEUVanr0xj5cN+kjV5GD4ZRQZpJE5FQRFFfj/xgTB6QQQ7kkU57sG0dMywQeZClJHuCJHeDMn+C6jRsyh6iN7eTrzRJpLjqtnv6Md+tW7zm0AIyEhA0S//+W/fmVYnLdVKx6Bmo5TWNmFUFbBz9wp627oxI3lk+zy4PRL5shtXpRfNLsEXzEe6248z3kP6c5uaYIoCl0TI52bLN4qQ8yRKElFUXScTjTN+YiPTb6nFSYSQdZM8WaYg7CVPdePygqwIZI+fTLIXyZtAF830dnvJphOc7O3gnBncs2P7rtU5ctQzGoAGlM6YOvP+B/Or3pv9o2cIzJzMxeARLqWPYV86hH64l55jcYaOSKBK4FauSFT1goMxTnB2UwHGulvxDQQoyfTjj4ZRPRqO4kGyHexMgropM2huDlBSMMzwYAJhGSguUD0yKhIiAdYQGIMaxYEmFN8QVrSDjv4EO6KpzV/8dt92oAO4kINYZ7SJ1dzrhYnLpsxuy345WPjNZ5cxedYdhL2nOZnehE/uZ6QzTe/nbuLBDI5qI0syOAIkCTWSIXRPMzRWU9IXwjYkZAUkx0DPKghvPU2zbycey5AaHuTWijAFCQV9yItkehAIhGxjGhlUxU3xeJ105AzHUpJ49/Mv3hroG/wip1gHRqUxIKSdK99n0TPfG8V+L1D3jw89tWp4y947LLfNbWVTmDJhDo5dgWuyTjCyi/4T3ciaBysWoz+TZUhW8GZ1kvWVpCb/Fd6+GFnhYIoi3K5STI9GcWWAW6Y3EonESQ9HaU5n8RgWlhAI20EIgXAEmYhBYXUKydVP93DM/knrnpeBwzlWOpSbBaMcBKlt9VoAFjz9hHTVOC9/8NvzH63sHHotJZlM8dXQmMhnf+kZQk0eGisn4z13CddgBNnnIRmLcngogr/Eyw/vasSKZsDKkjYdDlhj2JwqR6lvYOa0KgYHLlEbTTLVFiRMCySBEAJbgCstUI1ujKIw/bIv+9rW37wMHAKOAGHA3JUTZPMffOLyIGtb9cE1k3jBD54cLalCYNKPm+ftHuk6mee+I4A1RkbOCBzhYAkH0yXjTVmMCeuUKJASE5hYplLhOUsqboNt4QgHb3qE8dMm0UkZu8L5zBw3jYAiMGUJj99LfkEx9v4OWs8fZ1dFCfMq1ch/r/ng1VzJ/AGIAdbOLeuvUIlFDz12uQcTFf5rAtjYtk18d8FiKze6j7zR9fGdj/3T8vf2Hj0xo9kxKDOHMCUFR3GhWQJbVYmX5RHSLE5ZR7FFDXVWMTErhm04OIZJJmhQVa5xy7PPUIZMdqAPPWPiEoKi6jFke2N0H+9kwkAf8timvrfXtL6Ra9aTQBywW3e0COtryJysyzLX25pdO0SODaaA7vWv/mLp+EDJK11jAuyumsmR6qmUZWxkx+BgdYL28f18Xh1isE7QXh3ijK0RFfnE7DzksJePJhTx4OI4G3pbCYzYmKZNJpnFNk0yWYv+T/cSPPsFv79/+pdv72z995zUOA6MAHZLW4swFbjargRgGAZfZ+9eFrIi1/H9O1evW3Hi/Y3fLKrW9KOORU9JDa91RdnW7tB8SWXILeNxZC6oaXo8Wcbpfk7XqCx/IMHRmX7m+2+jNdXBy70raAyMpXhCJa76Uuz9PaQ/6WDvnLvaN7Ru+4+cyjuVowrOuo3vCzOR5Xq7Qqffa2u9Ief+/oIloyjlA+rn/8uPNnYcPTVp7R/OU5dNIaGRZwlemS5YOS7LPZk6ymorGPEMEjx7ieqqBprv+gYXYhcIdvehHEjy4vlZNAw7nNJiPF/TveFQZ1fbdRgv1q1dI/4/nx5/4qnLAazevOOm1MbTD3/nClsFKuY+9cxz0/Zmli8Lf4JcEMeS3Ph0FdVSefHeAH0XluALSYTs00x9pJBb6koJHRggbiaJZ+Oc6znNvel63kmeevPiwMBeoDMnw3RAtGxYL/6UP488mmviwpj/6zbTf/RsW/WZWPyDb5HLzsX2NStfbYft1tRNu6PdquaUB1FTCsqSForv/YT0+jsZCFfhsmqojyhI3gSGx0G3LPoG+qgtqLVeOvzp1RgfHMX41m1bxE3LuN1rf4ujOzkdfnO/m//9OaMllQ80vPjXb20Z+aigXh0bIxgtQG/8klsbO7BOjCGq76O59m7SAYVEJEzwyFG0hknp1/d99tNc1o/mMN5q3bH55hwQgiUPLP0qANsQKKqEppg4zk1JUeY+Oe/qkqr6++8uf6ngw/LvLQy0MS4e5DfNZTz/XBqPojJr1h3ktwxgvbgbf9Pt0V/uaX8lh/HHRzF+S2uLuHn1LPHQ4qVfrQ0EEggbVSRRvPkI58Zn7W35tbj7kftGS6rvzY2/eAFYPbHu4d1a/2HlzsMmpQdDdH+nllS+zoFvn6epd97591//3xVXYXwCsDd90CKs5A2S7oCsSrjyZZDFtSVkGaDKNj4tDUiYehJU+aaXCnOeXHpFGAGNP1v0N1saP9tel7QCRIonkjc0zL7bSg+uOrjj3ZzzZ0dhcsv61htmSziX6QaqQMkDSYYlix6+dq/y1W5DxpEdEuYIKX2ElBm/oe18b5XIbQ4SwIkXdv7PnPZFczcdzIYYCV/k4wWBzasO7vgJ8OnVGN+6cauQZcGfNgdZFpdfvgvx9U189Q1IKGSMKFnJQBZgpsMg7Mth3+BZ/Ow/jF6ZCrh//PTShVEh+1at2fRRbqqP/kFErF79zg0z7wgHj+rGpxVjmQJHtlB80jU38Ocsnvgzl1TXfxbXreP+Is//DQBZ48+Fizw2hAAAAABJRU5ErkJggg=="
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", 0, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
VarSetCapacity(Dec, DecLen, 0)
If !DllCall("Crypt32.dll\CryptStringToBinary", "Ptr", &B64, "UInt", 0, "UInt", 0x01, "Ptr", &Dec, "UIntP", DecLen, "Ptr", 0, "Ptr", 0)
   Return False
; Bitmap creation adopted from "How to convert Image data (JPEG/PNG/GIF) to hBITMAP?" by SKAN
; -> http://www.autohotkey.com/board/topic/21213-how-to-convert-image-data-jpegpnggif-to-hbitmap/?p=139257
hData := DllCall("Kernel32.dll\GlobalAlloc", "UInt", 2, "UPtr", DecLen, "UPtr")
pData := DllCall("Kernel32.dll\GlobalLock", "Ptr", hData, "UPtr")
DllCall("Kernel32.dll\RtlMoveMemory", "Ptr", pData, "Ptr", &Dec, "UPtr", DecLen)
DllCall("Kernel32.dll\GlobalUnlock", "Ptr", hData)
DllCall("Ole32.dll\CreateStreamOnHGlobal", "Ptr", hData, "Int", True, "PtrP", pStream)
hGdip := DllCall("Kernel32.dll\LoadLibrary", "Str", "Gdiplus.dll", "UPtr")
VarSetCapacity(SI, 16, 0), NumPut(1, SI, 0, "UChar")
DllCall("Gdiplus.dll\GdiplusStartup", "PtrP", pToken, "Ptr", &SI, "Ptr", 0)
DllCall("Gdiplus.dll\GdipCreateBitmapFromStream",  "Ptr", pStream, "PtrP", pBitmap)
DllCall("Gdiplus.dll\GdipCreateHICONFromBitmap", "Ptr", pBitmap, "PtrP", hBitmap, "UInt", 0)
DllCall("Gdiplus.dll\GdipDisposeImage", "Ptr", pBitmap)
DllCall("Gdiplus.dll\GdiplusShutdown", "Ptr", pToken)
DllCall("Kernel32.dll\FreeLibrary", "Ptr", hGdip)
DllCall(NumGet(NumGet(pStream + 0, 0, "UPtr") + (A_PtrSize * 2), 0, "UPtr"), "Ptr", pStream)
Return hBitmap
}

#Include %A_ScriptDir%\lib\RichCode.ahk

;}




