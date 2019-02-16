


Directory1 = C:\Program Files\AutoHotkey\lib
Directory2 = D:\Eigene Dateien\Eigene Dokumente\AutoIt Scripte\GitHub\AHK-Rare
;FileSelectFile, file,, %Directory1%
;FileDelete, files.txt
;Directory = file
funclist:= listfunc2MD(A_ScriptDir . "\AHK-Rare.ahk")

today:= A_DD "-" A_MM "-" A_YYYY
file = %A_ScriptDir%\%today%_MDTable.md

If FileExist(file)
	FileDelete, %file%

FileAppend, %funclist%, %file%


;Reads files.txt , and opens file by file - it search for function - store them into functions object + store the containing script
;todo - retreave informations about the functions from script lines - detect ; or /**/

/*
Loop, Read, files.txt
{
	filename:=A_LoopReadLine
	ToolTip, File: %A_Index%/%countlines1%, 2000, 500, 6
	funcList:= listfunc(filename)
	If NOT (funcList="") {
		FileAppend, `;`{ %Filename% `n`n`;Functions`:`n, FunctionList.txt
		FileAppend, %funclist%`n, FunctionList.txt

		If Not (rl="") {
			FileAppend, `;Labels`:`n%rl%`n, FunctionList.txt
		}

		FileAppend, `;`}`n`n, FunctionList.txt

		}


}
*/



exitApp

Listfunc2MD(file){																;--list all functions inside a ahk script and write MarkDown Table

	f:=0, s:=0, i:=0
	lst=
(
| FNr | Line | name of function and description |
|:--: | :--: |`n
)

	fileread, z, % file
	StringReplace, z, z, `r, , All			; important

	Loop, Parse, z, `n
	{
		i++
		ALF:= A_LoopField
		If RegExMatch(ALF, ";\s?<")
			s:=0
		else If RegExMatch(ALF, ";\s?sub")
			s:=1
				
		If (s=1) 
			continue

		fnp1:= Instr(ALF, "`(")
		fnp2:= Instr(ALF, "`{")
		cmt:= Instr(ALF, ";--")+3
		If ((fnp1 > 0) AND (cmt > 0) AND (fnp1<cmt)) {
				f++
				dsc:= Trim(SubStr(ALF, cmt, StrLen(ALF)-cmt+1))
				If !(dsc="")
						dsc:= " - *" . dsc . "*"
				lst.= "| " . SubStr("00000", 1, 3-StrLen(f)) . f . " | " . SubStr("00000", 1, 5-StrLen(i)) . i . " | **" . Trim(SubStr(ALF, 1, fnp1)) . "`)**" . dsc . " |`n"
		}
		

	}

	return lst

}

