#NoEnv
#Persistent
#SingleInstance, Force
;#KeyHistory 0
SetTitleMatchMode, 2		;Fast is default
DetectHiddenWindows, On	;Off is default
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen
CoordMode, Caret, Screen
CoordMode, Menu, Screen
SetKeyDelay, 0, 0
SetBatchLines, -1
SetWinDelay, -1
FileEncoding, UTF-8
OnExit, DasEnde



descriptionstring = 
(
		/*			DESCRIPTION of function ***
			-----------------------------------------------------------------------------------------------------------------------------------------------------------
				Function: 						***
				Description:					***
				Author: 	 					***
				date:							***
				Link: 							***
				Requirements:				***
				History:						***
				License:						***
				Parameters:					***
				Returns:						***
				Remarks:						***
				Related:						***
				
				Examples:					***
			-----------------------------------------------------------------------------------------------------------------------------------------------------------	
		*/
)

idxfile = D:\Eigene Dateien\Eigene Dokumente\AutoIt Scripte\GitHub\AHK-Rare\AHK-Rare.ini
	If !RareCr
	{
			RareCr:= 0
			FileRead, AHKRareIdxVar, % idxfile
			Loop, Parse, AHKRareIdxVar, `n
			{
					If RegExMatch(A_LoopField, "O)(?<=\[)\d+(?=\])", Match)									;finds only digits between "[" and "]"
							RareCr:= (Match.Value>RareCr) ? Match.Value() : RareCr
			}
			VarSetCapacity(AHKRareIdxVar, 0)
	}
	
	oScite	:= GetSciTEInstance()
	scitehwnd  	:= oSciTE.SciTEHandle
	ControlGet, hSci, Hwnd,, Scintilla1, ahk_id %scitehwnd%			; Get the HWND of its Scintilla control
	fdIdx:=0, set_break:=0
	
	curLine:= Sci_CurrentLine()
	
	Loop {
			
			Sci_SelectWholeLine(curline)
			thisline:=Sci_GetLine(curline)
			If Instr(thisline, "`;functions end") {
					fdIdx:=0
					break
			} 
			
			If Instr(thisline, "sub end")
					subctgry:=subctgrydsc:=""
			
			If RegExMatch(thisline, "O)(?<=\{\s\;)(\w|\s)+(?=\()", Match) {			;finds all between "{ ;" and "("  - Category or sub category
						If !ctgry {
								ctgry:= Trim(Match.Value())
								If RegExMatch(thisline, "O)(?<=--)(.*)", Match)
										ctgrydsc:= Trim(Match.Value())
						} else {
								subctgry:= Trim(Match.Value())
								If RegExMatch(thisline, "O)(?<=--)(.*)", Match)
										subctgrydsc:= Trim(Match.Value())
						}
			}
			
			fcstart:= Sci_ContractedFoldNext(curline)
			Sci_GotoLine(fcstart)
			
			fcline3:= LTrim(Sci_GetLine(fcstart-2))
			fcline2:= LTrim(Sci_GetLine(fcstart-1))
			fcLine1:= LTrim(Sci_GetLine(fcstart))
			
			if GetKeyState("LControl")
					break
			
			If !RegExMatch(fcLine1, "P)^\w+\(.*\).*\{.*;--") 
			{
								If RegExMatch(fcLine2, "O);--.*\w+",Match) {
											fcMatch:= 2
											shdsc:= Trim(StrReplace(Match.Value(),";--"))
											Hash:= MD5(fcLine:= RTrim(SubStr(fcLine2, 1, Instr(fcLine2, ";--") - 1)) . " " . Trim(fcLine1))
								} else if RegExMatch(fcLine3, "O);--.*\w+",Match) {
											fcMatch:= 3
											shdsc:= Trim(StrReplace(Match.Value(),";--"))
											Hash:= MD5(fcLine:= RTrim(SubStr(fcLine3, 1, Instr(fcLine3, ";--") - 1)) . " " . Trim(fcLine2) . " " . Trim(fcLine1))
								} else {
											curLine:= Sci_GotoLineDown(fcstart, 1)
											continue
								}
								gosub AHKRareIndexWriter
			} 
			else If RegExMatch(fcLine1, "P)^\w+\(.*\).*\{.*;--") 
			{
								fcMatch:= 1
								RegExMatch(fcLine1, "O);--.*\w+",Match)
								shdsc:= Trim(StrReplace(Match.Value(),";--"))
								Hash:= MD5(fcLine:= RTrim(SubStr(fcLine1, 1, Instr(fcLine1, ";--") - 1)))
								gosub AHKRareIndexWriter
			} 
			else 
			{
								curLine:= Sci_GotoLineDown(fcstart, 1)
								continue
			}

			If (set_break=1)
					break

			;sleep, 300						
			if GetKeyState("LControl")
					break
				 
	}

	oneline:=0
	ctgry:=ctgrydsc:=subctgry:=subctgrydsc:=""
	MsgBox,, AHK-Rare referencing, Procedure has stopped!`n One chapter is fully analyzed!

return

AHKRareIndexWriter: ;{ 																	; collects some data calls a function to add them to the Index database

		RegExMatch(fcLine, "O)^\w+\(", Match)
		fcLine:= Match.Value() . "`)"
		refLine:= LTrim(Sci_GetLine(fcstart-fcMatch))
		Sci_SelectWholeLine(fcstart - fcMatch)
			;sleep, 200
		fchar:= LTrim(subStr(refline, 1, 1) )
		If (fchar=";")
			Sci_ClearLine(fcstart-fcMatch)
		Sci_GotoLine(fcstart-fcMatch)
		RareCr+=1, fdIdx+=1, fdlvl:= Sci_GetFoldLevel(fcstart)
		Sci_InsertText(";" . fdidx, -1)  
		RareObj:= {"idx": idxfile
							, "Cr": RareCr
							, "fcline": fcLine
							, "shdsc": shdsc
							, "fcstart": fcstart
							, "fcend": fcend
							, "fdlvl": fdlvl
							, "fdIdx": fdIdx
							, "Hash": Hash
							, "dsc": dsc
							, "example": example
							, "dpnds": dpnds
							, "tags": tags
							, "ctgry": ctgry
							, "ctgrydsc": ctgrydsc
							, "subctgry": subctgry
							, "subctgrydsc": subctgrydsc}
							
		Write_AHKRare_Index(RareObj)
		
		If (oneline=1) {
				MsgBox,, AHK-Rare referencing, Procedure stopped now!`nDue to the selected option`nto only referencing one function.
				 set_break:=1
		}
		
		curLine:= Sci_GotoLineDown(fcstart, 1)
		fcline:=shdsc:=fcstart:=fcend:=fdlvl:=Hash:=dsc:=example:=dpnds:=tags:=""
		
return
;}

;{  Funktions

	Write_AHKRare_Index(obj) {
						
		Section:= SubStr("000000" . obj.Cr, -5)
		IniWrite, % obj.fcline					, % obj.idx, % Section , function
		IniWrite, % obj.shdsc					, % obj.idx, % Section , shortdescription
		IniWrite, % obj.fcstart					, % obj.idx, % Section , funcstart_at
		IniWrite, % obj.fcend                  	, % obj.idx, % Section , funcend_at
		IniWrite, % obj.fdlvl						, % obj.idx, % Section , foldlevel
		IniWrite, % obj.fdIdx					, % obj.idx, % Section , foldIndex
		IniWrite, % obj.Hash					, % obj.idx, % Section , MD5Hash
		IniWrite, % obj.dsc						, % obj.idx, % Section , description
		IniWrite, % obj.example				, % obj.idx, % Section , example
		IniWrite, % obj.dpnds  				, % obj.idx, % Section , dependencies
		IniWrite, % obj.tags						, % obj.idx, % Section , tags
		IniWrite, % obj.ctgry					, % obj.idx, % Section , category
		IniWrite, % obj.ctgrydsc				, % obj.idx, % Section , category_description
		IniWrite, % obj.subctgry				, % obj.idx, % Section , subcategory
		IniWrite, % obj.subctgrydsc			, % obj.idx, % Section , subcategory_description

return
}
;============ Hash functions ==================
CalcAddrHash(addr, length, algid, byref hash = 0, byref hashlength = 0) {
    static h := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "a", "b", "c", "d", "e", "f"]
    static b := h.minIndex()
    hProv := hHash := o := ""
    if (DllCall("advapi32\CryptAcquireContext", "Ptr*", hProv, "Ptr", 0, "Ptr", 0, "UInt", 24, "UInt", 0xf0000000))
    {
        if (DllCall("advapi32\CryptCreateHash", "Ptr", hProv, "UInt", algid, "UInt", 0, "UInt", 0, "Ptr*", hHash))
        {
            if (DllCall("advapi32\CryptHashData", "Ptr", hHash, "Ptr", addr, "UInt", length, "UInt", 0))
            {
                if (DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2, "Ptr", 0, "UInt*", hashlength, "UInt", 0))
                {
                    VarSetCapacity(hash, hashlength, 0)
                    if (DllCall("advapi32\CryptGetHashParam", "Ptr", hHash, "UInt", 2, "Ptr", &hash, "UInt*", hashlength, "UInt", 0))
                    {
                        loop % hashlength
                        {
                            v := NumGet(hash, A_Index - 1, "UChar")
                            o .= h[(v >> 4) + b] h[(v & 0xf) + b]
                        }
                    }
                }
            }
            DllCall("advapi32\CryptDestroyHash", "Ptr", hHash)
        }
        DllCall("advapi32\CryptReleaseContext", "Ptr", hProv, "UInt", 0)
    }
    return o
}
CalcStringHash(string, algid, encoding = "UTF-8", byref hash = 0, byref hashlength = 0) {
    chrlength := (encoding = "CP1200" || encoding = "UTF-16") ? 2 : 1
    length := (StrPut(string, encoding) - 1) * chrlength
    VarSetCapacity(data, length, 0)
    StrPut(string, &data, floor(length / chrlength), encoding)
    return CalcAddrHash(&data, length, algid, hash, hashlength)
}
MD5(string, encoding = "UTF-8") {
    return CalcStringHash(string, 0x8003, encoding)
}
CRC32(string, encoding = "UTF-8") {
	chrlength := (encoding = "CP1200" || encoding = "UTF-16") ? 2 : 1
	length := (StrPut(string, encoding) - 1) * chrlength
	VarSetCapacity(data, length, 0)
	StrPut(string, &data, floor(length / chrlength), encoding)
	hMod := DllCall("Kernel32.dll\LoadLibrary", "Str", "Ntdll.dll")
	SetFormat, Integer, % SubStr((A_FI := A_FormatInteger) "H", 0)
	CRC32 := DllCall("Ntdll.dll\RtlComputeCrc32", "UInt", 0, "UInt", &data, "UInt", length, "UInt")
	CRC := SubStr(CRC32 | 0x1000000000, -7)
	DllCall("User32.dll\CharLower", "Str", CRC)
	SetFormat, Integer, %A_FI%
	return CRC, DllCall("Kernel32.dll\FreeLibrary", "Ptr", hMod)
}

;}


