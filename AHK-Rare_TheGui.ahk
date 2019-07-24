;*** AHK-RARE GUI *** V0.2

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



	;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	; Script Prozess ID feststellen
	;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		scriptPID:= DllCall("GetCurrentProcessId")

;}

;{02. declaring variables
ARData:= Object()
;}

;{03. gui
Gui, ARG: NEW
Gui, ARG: +LastFound +HwndhARG
Gui, ARG: Margin, 5, 5
Gui, ARG: Font, S20 CDefault, Bold
Gui, ARG: Add, Text, % "xm ym w800 Center Section"  	, % "AHK-RARE 'THE SEARCH GUI'"
Gui, ARG: Font, S6 CDefault, Bold
Gui, ARG: Add, Text, % "xCenter xs"	, % "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
Gui, ARG: Font, S10 CDefault, Normal
Gui, ARG: Add, Text, % "yp+" 40 " Section vField1", % "  . . . . . create index: "
Gui, ARG: Add, Text, % "ys vField2 w400", % "00001"
Gui, ARG: Show
;}

If FileExist(A_ScriptDir . "\AHK-Rare.ahk")
	ARData:= RarefuncIndexer(A_ScriptDir . "\AHK-Rare.ahk")

json_str:= JXON_Dump(ARData, "", 3)
FileDelete, % A_ScriptDir "\AHK-RARE.json"
FileAppend, % json_str, % A_ScriptDir "\AHK-RARE.json"

GuiControl, ARG: Hide, Field1
GuiControl, ARG: Hide, Field2

Gui, ARG: Font, S7 CDefault, Normal
Gui, ARG: Add, Listview, % "xm y60 w800 r20 HWNDhLVFunc vLVFunc gShowFunction Section", main section|function name|short description|function nr 
Gui, ARG: Font, S8 CDefault, Normal
Gui, ARG: Add, Edit, % "x820 y60 w500 r20 t8 HWNDhShowRoom1 vShowRoom1"
Gui, ARG: Add, Edit, % "xs w1400 r30 t8 HWNDhShowRoom2 vShowRoom2"
Gui, ARG: Show, AutoSize xCenter yCenter, AHK-Rare 'the search gui'

Hotkey, IfWinActive, AHK-Rare
Hotkey, Enter, ShowFunction



For i, function in ARData
		LV_Add("", function.mainsection, function.name, function.short, function.hash)

LV_ModifyCol()

return


ShowFunction: ;{

	selRow:= LV_GetNext(1)
	LV_GetText(fnr, selRow , 4)
	
	For i, function in ARData
		If Instr(function.hash, fnr)
				break
				
	toshow:= "Function name       `t: "	ARData[i].name "`n"
	toshow.= "short description    `t: "	ARData[i].short "`n"
	toshow.= "main section           `t: "	ARData[i].mainsection "`n"
	toshow.= "main section desc.`t: "  	ARData[i].mainsectionDescription "`n"
	toshow.= "sub section             `t: "	ARData[i].subsection "`n"
	toshow.= "------------------------------------------------------------------------------------------------------------------------------`n"
	
	If IsObject(ARData[i]["Description"])
	{
		 toshow.= "DESCRIPTION - included in this function: `n"
		 toshow.= "--------------------------------------------------------------------------------------------------------------------------`n"
		 rr:= ""
		 For tag in ARData[i]["Description"] 
		{
				rr++
				If Instr(toshow, Trim(tag) ": ")
					continue
				toshow.= Trim(tag) SubStr("`t`t`t`t`t`t`t`t`t`t`t", (21 - StrLen(Tag))//-4) ": "
				text		:= Trim(ARData[i]["Description"][(Tag)])
				If Instr(text, "`n")
				{
						Loop, Parse, text, `n 
						{
								ALoopF:= StrReplace(A_LoopField, A_Tab A_Tab A_Tab, A_Tab)
								ALoopF:= StrReplace(ALoopF, A_Tab A_Tab, A_Tab)
								ALoopF:= Rtrim(ALoopF, ",")
								If A_Index = 1
									toshow.= ALoopF "`n"
								else
									toshow.= "`t`t`t`t`t`t`t  " ALoopF "`n"
						}
				}
				else
				{
						toshow.= text "`n"
				}
		}	

	}
	GuiControl, ARG:, ShowRoom1, % toshow

	funcStart	:= ARData[i].start
	funcEnd	:= ARData[i].end

	GuiControl, ARG:, ShowRoom2, % ARData[i].code

return
;}

ARGGuiClose:
ARGEscape:
ExitApp


RarefuncIndexer(file){																;--list all functions inside AHK-RARE script 
	
	ARData:= Object()
	s:=fI:=descFlag:=tagFlag:=tagFlagO :=0

	FileRead, z, % file
	
	Loop, Parse, z, `n, `r
	{
		
		If RegExMatch(A_LoopField, "(?<=\{\s;)[\w\s-\+\/\(\)]+(?=\(\d+\))")                                                                                                                                                    	; recognize name of mainsection
		{
					RegExMatch(A_LoopField, "(?<=\{\s;)[\w\s-\+\/\(\)]+(?=\(\d+\))", mainsection)
					mainsection	:= Trim(mainsection)
					subsection	:= ""
					RegExMatch(A_LoopField, "(?<=--\s)[\w\s]+(?=\s--)", MainSectionDescription)
					descFlag:=tagFlag:=tagFlagO := 0
					TrailingSpacesO:= TrailingSpaces 	:= 0
					continue
		}
		else If RegExMatch(A_LoopField, "(?<=\{\s;)\<\d\d\.\d\d[\d\.]*\>:\s[\w\-\_\+\/\(\)]+")                                                                                                                        	; recognize name of subsection
		{
					RegExMatch(A_LoopField, "(?<=\>:\s)[\w\-\_\s\+\/]+", subsection)
					subsection:= Trim(subsection)
					continue
		}
		else If RegExMatch(A_LoopField, "(;\s*\<\d\d\.\d\d\.\d\d\d\d\d)|(;\s*\<\d\d\.\d\d\.\d\d.\d\d\d\d\d)")                                                                                                 	; recognize new function nr.
		{
				If ARData[(fI)].end = ""
						ARData[(fI)].end := A_Index - 1
				
				If Tag <> ""
						ARData[(fi)]["description"][(Tag)] := RTrim(ARData[(fi)]["description"][(Tag)], "`n")
				
				If ARData[(fI)].code <> ""
						ARData[(fI)].code := RTrim(ARData[(fI)].code, "}") "}" 
				
				descFlag:= tagFlag:= tagFlagO   	:= 0                                                 	; re-initialize flags
				TrailingSpacesO:= TrailingSpaces 	:= 0
				NoCode                                       	:= 0
				
				fi ++                                                                                                    	; enumerator
				RegExMatch(A_LoopField, "[\d\.]+", hashCode)                                   	; reads the functions numbers (e.g. 04.01.00011)
				ARData[(fI)] := Object()
				ARData[(fI)].hash                             	:= hashCode
				ARData[(fI)].start                              	:= A_Index+1
				ARData[(fI)].mainsection                 	:= mainsection
				ARData[(fI)].mainsectionDescription	:= mainsectionDescription
				ARData[(fI)].subsection                    	:= subsection
								
				GuiControl, Text, Field2, % fI "," fname
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
		else if RegExMatch(A_LoopField, "\/\*\s*DESCRIPTION")
				descFlag:= 1, continue
		else if (descFlag = 1) && (Instr(A_LoopField, "--------------") || Instr(A_LoopField, "========================"))
				continue
		else if (descFlag = 1) && RegExMatch(A_LoopField, "\*\/") 
				descFlag:= tagFlag:= 0, continue
		else if (descFlag = 1) && RegExMatch(A_LoopField, "((^\s*\w+\s\w+\s*)(?=:\s*\w+))|((^\s*\w+\s*)(?=:\s*\w+))")
		{
				TrailingSpaces:=  countTrailingSpaces(A_LoopField)
				If TrailingSpacesO
				{
						If (TrailingSpaces >= (TrailingSpacesO + 1))
						{
								ARData[(fi)]["description"][(Tag)] .= Trim(A_LoopField) "`n"
				 				continue
						}
				} 
				
				tagFlagO := tagFlag, tagFlag ++
				
				RegExMatch(A_LoopField, "((^\s*\w+\s\w+\s*)(?=:\s*\w+))|((^\s*\w+\s*)(?=:\s*\w+))", Tag)
				RegExMatch(A_LoopField, "(?<=\:).*", Text)
				Tag:= Trim(Tag)
				
				ARData[(fi)]["description"]           	:= Object()
				ARData[(fi)]["description"][(Tag)] 	:= Trim(Text) "`n" 
		
				TrailingSpacesO := TrailingSpaces
		}
		else if (descFlag = 1) && (tagFlag > tagFlagO)
				ARData[(fi)]["description"][(Tag)] .= Trim(A_LoopField) "`n"
		else 
		{
				If NoCode = 0
						ARData[(fI)].code .= A_LoopField "`n"
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

TheEnd(ExitReason, ExitCode) {
	;OnExit("")
	ExitApp
}

