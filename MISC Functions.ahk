;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;															    Collection of rare and maybe very useful functions
; 															    collected by IXIKO =>    last change: 28.05.2018
;																	for description have a look at AHK-Rare.md
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;{Command - line interaction (1)
CMDret_RunReturn(CMDin, WorkingDir=0) {														;--

/*
; ******************************************************************
; CMDret-AHK functions
; version 1.10 beta
;
; Updated: Dec 5, 2006
; by: corrupt
; Code modifications and/or contributions made by:
; Laszlo, shimanov, toralf, Wdb
; ******************************************************************
; Usage:
; CMDin - command to execute
; WorkingDir - full path to working directory (Optional)
; ******************************************************************
; Known Issues:
; - If using dir be sure to specify a path (example: cmd /c dir c:\)
; or specify a working directory
; - Running 16 bit console applications may not produce output. Use
; a 32 bit application to start the 16 bit process to receive output
; ******************************************************************
; Additional requirements:
; - none
; ******************************************************************
; Code Start
; ******************************************************************

*/

  Global cmdretPID
  tcWrk := WorkingDir=0 ? "Int" : "Str"
  idltm := A_TickCount + 20
  CMsize = 1
  VarSetCapacity(CMDout, 1, 32)
  VarSetCapacity(sui,68, 0)
  VarSetCapacity(pi, 16, 0)
  VarSetCapacity(pa, 12, 0)
  Loop, 4 {
    DllCall("RtlFillMemory", UInt,&pa+A_Index-1, UInt,1, UChar,12 >> 8*A_Index-8)
    DllCall("RtlFillMemory", UInt,&pa+8+A_Index-1, UInt,1, UChar,1 >> 8*A_Index-8)
  }
  IF (DllCall("CreatePipe", "UInt*",hRead, "UInt*",hWrite, "UInt",&pa, "Int",0) <> 0) {
    Loop, 4
      DllCall("RtlFillMemory", UInt,&sui+A_Index-1, UInt,1, UChar,68 >> 8*A_Index-8)
    DllCall("GetStartupInfo", "UInt", &sui)
    Loop, 4 {
      DllCall("RtlFillMemory", UInt,&sui+44+A_Index-1, UInt,1, UChar,257 >> 8*A_Index-8)
      DllCall("RtlFillMemory", UInt,&sui+60+A_Index-1, UInt,1, UChar,hWrite >> 8*A_Index-8)
      DllCall("RtlFillMemory", UInt,&sui+64+A_Index-1, UInt,1, UChar,hWrite >> 8*A_Index-8)
      DllCall("RtlFillMemory", UInt,&sui+48+A_Index-1, UInt,1, UChar,0 >> 8*A_Index-8)
    }
    IF (DllCall("CreateProcess", Int,0, Str,CMDin, Int,0, Int,0, Int,1, "UInt",0, Int,0, tcWrk, WorkingDir, UInt,&sui, UInt,&pi) <> 0) {
      Loop, 4
        cmdretPID += *(&pi+8+A_Index-1) << 8*A_Index-8
      Loop {
        idltm2 := A_TickCount - idltm
        If (idltm2 < 10) {
          DllCall("Sleep", Int, 10)
          Continue
        }
        IF (DllCall("PeekNamedPipe", "uint", hRead, "uint", 0, "uint", 0, "uint", 0, "uint*", bSize, "uint", 0 ) <> 0 ) {
          Process, Exist, %cmdretPID%
          IF (ErrorLevel OR bSize > 0) {
            IF (bSize > 0) {
              VarSetCapacity(lpBuffer, bSize+1)
              IF (DllCall("ReadFile", "UInt",hRead, "Str", lpBuffer, "Int",bSize, "UInt*",bRead, "Int",0) > 0) {
                IF (bRead > 0) {
                  TRead += bRead
                  VarSetCapacity(CMcpy, (bRead+CMsize+1), 0)
                  CMcpy = a
                  DllCall("RtlMoveMemory", "UInt", &CMcpy, "UInt", &CMDout, "Int", CMsize)
                  DllCall("RtlMoveMemory", "UInt", &CMcpy+CMsize, "UInt", &lpBuffer, "Int", bRead)
                  CMsize += bRead
                  VarSetCapacity(CMDout, (CMsize + 1), 0)
                  CMDout=a
                  DllCall("RtlMoveMemory", "UInt", &CMDout, "UInt", &CMcpy, "Int", CMsize)
                  VarSetCapacity(CMDout, -1)   ; fix required by change in autohotkey v1.0.44.14
                }
              }
            }
          }
          ELSE
            break
        }
        ELSE
          break
        idltm := A_TickCount
      }
      cmdretPID=
      DllCall("CloseHandle", UInt, hWrite)
      DllCall("CloseHandle", UInt, hRead)
    }
  }
  IF (StrLen(CMDout) < TRead) {
    VarSetCapacity(CMcpy, TRead, 32)
    TRead2 = %TRead%
    Loop {
      DllCall("RtlZeroMemory", "UInt", &CMcpy, Int, TRead)
      NULLptr := StrLen(CMDout)
      cpsize := Tread - NULLptr
      DllCall("RtlMoveMemory", "UInt", &CMcpy, "UInt", (&CMDout + NULLptr + 2), "Int", (cpsize - 1))
      DllCall("RtlZeroMemory", "UInt", (&CMDout + NULLptr), Int, cpsize)
      DllCall("RtlMoveMemory", "UInt", (&CMDout + NULLptr), "UInt", &CMcpy, "Int", cpsize)
      TRead2 --
      IF (StrLen(CMDout) > TRead2)
        break
    }
  }
  StringTrimLeft, CMDout, CMDout, 1
  Return, CMDout
}

;}
; CMDret_RunReturn()
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Date or Time functions (4)

PrettyTickCount(timeInMilliSeconds) { 																	;-- takes a time in milliseconds and displays it in a readable fashion
   ElapsedHours := SubStr(0 Floor(timeInMilliSeconds / 3600000), -1)
   ElapsedMinutes := SubStr(0 Floor((timeInMilliSeconds - ElapsedHours * 3600000) / 60000), -1)
   ElapsedSeconds := SubStr(0 Floor((timeInMilliSeconds - ElapsedHours * 3600000 - ElapsedMinutes * 60000) / 1000), -1)
   ElapsedMilliseconds := SubStr(0 timeInMilliSeconds - ElapsedHours * 3600000 - ElapsedMinutes * 60000 - ElapsedSeconds * 1000, -2)
   returned := ElapsedHours "h:" ElapsedMinutes "m:" ElapsedSeconds "s." ElapsedMilliseconds
   return returned
}

TimePlus(one, two) {																							;--

   returned:=0
   returned+=Mod(one, 100) + Mod(two, 100)
   ;one/=100
   ;two/=100
   returned+=one
   return returned
}

FormatSeconds(Secs) {																						;-- formats seconds to hours,minutes and seconds -> 12:36:10

	Return SubStr("0" . Secs // 3600, -1) . ":"
        . SubStr("0" . Mod(Secs, 3600) // 60, -1) . ":"
        . SubStr("0" . Mod(Secs, 60), -1)

}

TimeCode(MaT) {																								;-- TimCode can be used for protokoll or error logs

	;Month & Time (MaT) = 1 - it's clear!

	If MaT = 1
		TC:= A_DD "." A_MM "." A_YYYY "`, "

	TC.= A_Hour ":" A_Min ":" A_Sec "`." A_MSec

	return TC
}

;}
; TimePlus()						|	PrettyTickCount()				|	FormatSeconds()					|	TimeCode()							|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Get - functions for retreaving informations - missing something - see Gui - retreaving ... (7)

GetProcesses() {																								;-- get the name of all running processes

   d = `n  ; string separator
   s := 4096  ; size of buffers and arrays (4 KB)

   Process, Exist  ; sets ErrorLevel to the PID of this running script
   ; Get the handle of this script with PROCESS_QUERY_INFORMATION (0x0400)
   h := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", ErrorLevel)
   ; Open an adjustable access token with this process (TOKEN_ADJUST_PRIVILEGES = 32)
   DllCall("Advapi32.dll\OpenProcessToken", "UInt", h, "UInt", 32, "UIntP", t)
   VarSetCapacity(ti, 16, 0)  ; structure of privileges
   NumPut(1, ti, 0)  ; one entry in the privileges array...
   ; Retrieves the locally unique identifier of the debug privilege:
   DllCall("Advapi32.dll\LookupPrivilegeValueA", "UInt", 0, "Str", "SeDebugPrivilege", "Int64P", luid)
   NumPut(luid, ti, 4, "int64")
   NumPut(2, ti, 12)  ; enable this privilege: SE_PRIVILEGE_ENABLED = 2
   ; Update the privileges of this process with the new access token:
   DllCall("Advapi32.dll\AdjustTokenPrivileges", "UInt", t, "Int", false, "UInt", &ti, "UInt", 0, "UInt", 0, "UInt", 0)
   DllCall("CloseHandle", "UInt", h)  ; close this process handle to save memory

   hModule := DllCall("LoadLibrary", "Str", "Psapi.dll")  ; increase performance by preloading the libaray
   s := VarSetCapacity(a, s)  ; an array that receives the list of process identifiers:
   c := 0  ; counter for process idendifiers
   DllCall("Psapi.dll\EnumProcesses", "UInt", &a, "UInt", s, "UIntP", r)
   Loop, % r // 4  ; parse array for identifiers as DWORDs (32 bits):
   {
      id := NumGet(a, A_Index * 4)
      ; Open process with: PROCESS_VM_READ (0x0010) | PROCESS_QUERY_INFORMATION (0x0400)
      h := DllCall("OpenProcess", "UInt", 0x0010 | 0x0400, "Int", false, "UInt", id)
      VarSetCapacity(n, s, 0)  ; a buffer that receives the base name of the module:
      e := DllCall("Psapi.dll\GetModuleBaseNameA", "UInt", h, "UInt", 0, "Str", n, "UInt", s)
      DllCall("CloseHandle", "UInt", h)  ; close process handle to save memory
      if (n && e)  ; if image is not null add to list:
         l .= n . d, c++
   }
   DllCall("FreeLibrary", "UInt", hModule)  ; unload the library to free memory
   Sort, l, C  ; uncomment this line to sort the list alphabetically
   ;MsgBox, 0, %c% Processes, %l%
   return l
}

getProcesses(ignoreSelf := True, searchNames := "") { 										;-- get running processes with search using comma separated list

	s := 100096  ; 100 KB will surely be HEAPS

	array := []
	PID := DllCall("GetCurrentProcessId")
	; Get the handle of this script with PROCESS_QUERY_INFORMATION (0x0400)
	h := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", PID, "Ptr")
	; Open an adjustable access token with this process (TOKEN_ADJUST_PRIVILEGES = 32)
	DllCall("Advapi32.dll\OpenProcessToken", "Ptr", h, "UInt", 32, "PtrP", t)
	VarSetCapacity(ti, 16, 0)  ; structure of privileges
	NumPut(1, ti, 0, "UInt")  ; one entry in the privileges array...
	; Retrieves the locally unique identifier of the debug privilege:
	DllCall("Advapi32.dll\LookupPrivilegeValue", "Ptr", 0, "Str", "SeDebugPrivilege", "Int64P", luid)
	NumPut(luid, ti, 4, "Int64")
	NumPut(2, ti, 12, "UInt")  ; enable this privilege: SE_PRIVILEGE_ENABLED = 2
	; Update the privileges of this process with the new access token:
	r := DllCall("Advapi32.dll\AdjustTokenPrivileges", "Ptr", t, "Int", false, "Ptr", &ti, "UInt", 0, "Ptr", 0, "Ptr", 0)
	DllCall("CloseHandle", "Ptr", t)  ; close this access token handle to save memory
	DllCall("CloseHandle", "Ptr", h)  ; close this process handle to save memory

	hModule := DllCall("LoadLibrary", "Str", "Psapi.dll")  ; increase performance by preloading the library
	s := VarSetCapacity(a, s)  ; an array that receives the list of process identifiers:
	DllCall("Psapi.dll\EnumProcesses", "Ptr", &a, "UInt", s, "UIntP", r)
	Loop, % r // 4  ; parse array for identifiers as DWORDs (32 bits):
	{
	   currentPID := NumGet(a, A_Index * 4, "UInt")
	   if (ignoreSelf && currentPID = PID)
			continue ; this is own script
	   ; Open process with: PROCESS_VM_READ (0x0010) | PROCESS_QUERY_INFORMATION (0x0400)
	   h := DllCall("OpenProcess", "UInt", 0x0010 | 0x0400, "Int", false, "UInt", currentPID, "Ptr")
	   if !h
	      continue
	   VarSetCapacity(n, s, 0)  ; a buffer that receives the base name of the module:
	   e := DllCall("Psapi.dll\GetModuleBaseName", "Ptr", h, "Ptr", 0, "Str", n, "UInt", A_IsUnicode ? s//2 : s)
	   if !e    ; fall-back method for 64-bit processes when in 32-bit mode:
	      if e := DllCall("Psapi.dll\GetProcessImageFileName", "Ptr", h, "Str", n, "UInt", A_IsUnicode ? s//2 : s)
	         SplitPath n, n
	   DllCall("CloseHandle", "Ptr", h)  ; close process handle to save memory
	  	if searchNames
	  	{
			  if n not in %searchNames%
			  	continue
	  	}
	   if (n && e)  ; if image is not null add to list:
	   		array.insert({"Name": n, "PID": currentPID})
	}
	DllCall("FreeLibrary", "Ptr", hModule)  ; unload the library to free memory
	return array
}

GetProcessWorkingDir(PID) {																				;-- like the name explains

	static PROCESS_ALL_ACCESS:=0x1F0FFF,MEM_COMMIT := 0x1000,MEM_RELEASE:=0x8000,PAGE_EXECUTE_READWRITE:=64
		,GetCurrentDirectoryW,init:=MCode(GetCurrentDirectoryW,"8BFF558BECFF75088B450803C050FF15A810807CD1E85DC20800")
	nDirLength := VarSetCapacity(nDir, 512, 0)
	hProcess := DllCall("OpenProcess", "UInt", PROCESS_ALL_ACCESS, "Int",0, "UInt", PID)
	if !hProcess
	return
	pBufferRemote := DllCall("VirtualAllocEx", "Ptr", hProcess, "Ptr", 0, "PTR", nDirLength + 1, "UInt", MEM_COMMIT, "UInt", PAGE_EXECUTE_READWRITE, "Ptr")

	pThreadRemote := DllCall("VirtualAllocEx", "Ptr", hProcess, "Ptr", 0, "PTR", 26, "UInt", MEM_COMMIT, "UInt", PAGE_EXECUTE_READWRITE, "Ptr")
	DllCall("WriteProcessMemory", "Ptr", hProcess, "Ptr", pThreadRemote, "Ptr", &GetCurrentDirectoryW, "PTR", 26, "Ptr", 0)

	If hThread := DllCall("CreateRemoteThread", "PTR", hProcess, "UInt", 0, "UInt", 0, "PTR", pThreadRemote, "PTR", pBufferRemote, "UInt", 0, "UInt", 0)
	{
	DllCall("WaitForSingleObject", "PTR", hThread, "UInt", 0xFFFFFFFF)
	DllCall("GetExitCodeThread", "PTR", hThread, "UIntP", lpExitCode)
	If lpExitCode {
		DllCall("ReadProcessMemory", "PTR", hProcess, "PTR", pBufferRemote, "Str", nDir, "UInt", lpExitCode*2, "UInt", 0)
		VarSetCapacity(nDir,-1)
	}
	DllCall("CloseHandle", "PTR", hThread)
	}
	DllCall("VirtualFreeEx","PTR",hProcess,"PTR",pBufferRemote,"PTR",nDirLength + 1,"UInt",MEM_RELEASE)
	DllCall("VirtualFreeEx","PTR",hProcess,"PTR",pThreadRemote,"PTR",31,"UInt",MEM_RELEASE)
	DllCall("CloseHandle", "PTR", hProcess)

	return nDir

}

GetTextSize(pStr, pSize, pFont, pWeight = 400, pHeight = false) {						;-- precalcute the Textsize (Width & Height)

  Gui, 55: Font, s%pSize% w%pWeight%, %pFont%
  Gui, 55: Add, Text, R1, %pStr%
  GuiControlGet T, 55: Pos, Static1
  Gui, 55: Destroy
  Return pHeight ? TW "," TH : TW

}

GetTextSize(pStr, pFont="", pHeight=false) { 														;-- different function to the above one

   local height, weight, italic, underline, strikeout , nCharSet
   local hdc := DllCall("GetDC", "Uint", 0)
   local hFont, hOldFont

  ;parse font
   if (pFont != "") {
      italic      := InStr(pFont, "italic")
      underline   := InStr(pFont, "underline")
      strikeout   := InStr(pFont, "strikeout")
      weight      := InStr(pFont, "bold") ? 700 : 0

      RegExMatch(pFont, "(?<=[S|s])(\d{1,2})(?=[ ,])", height)
      if (height != "")
         height := -DllCall("MulDiv", "int", height, "int", DllCall("GetDeviceCaps", "Uint", hDC, "int", 90), "int", 72)

      RegExMatch(pFont, "(?<=,).+", fontFace)
      fontFace := RegExReplace( fontFace, "(^\s+)|(\s+$)")      ;trim

      ;   msgbox "%fontFace%" "%italic%" "%underline%" "%strikeout%" "%weight%" "%height%"
   }


 ;create font
   hFont   := DllCall("CreateFont", "int", height, "int", 0, "int", 0, "int", 0
                           ,"int", weight, "Uint", italic, "Uint", underline
                           ,"uint", strikeOut, "Uint", nCharSet, "Uint", 0, "Uint", 0, "Uint", 0, "Uint", 0, "str", fontFace)
   hOldFont := DllCall("SelectObject", "Uint", hDC, "Uint", hFont)
   DllCall("GetTextExtentPoint32", "Uint", hDC, "str", pStr, "int", StrLen(pStr), "int64P", nSize)
;   DllCall("DrawTextA", "Uint", hDC, "str", pStr, "int", StrLen(pStr), "int64P", nSize, "uint", 0x400)


 ;clean

   DllCall("SelectObject", "Uint", hDC, "Uint", hOldFont)
   DllCall("DeleteObject", "Uint", hFont)
   DllCall("ReleaseDC", "Uint", 0, "Uint", hDC)

   nWidth  := nSize & 0xFFFFFFFF
   nHeight := nSize >> 32 & 0xFFFFFFFF


   if (pHeight)
      nWidth .= "," nHeight
   return   nWidth
}

monitorInfo() {																									;-- shows infos about your monitors
	sysget,monitorCount,monitorCount
	arr:=[],sorted:=[]
	loop % monitorCount {
		sysget,mon,monitor,% a_index
		arr.insert({l:monLeft,r:monRight,b:monBottom,t:monTop,w:monRight-monLeft+1,h:monBottom-monTop+1})
		k:=a_index
		while strlen(k)<3
			k:="0" k
		sorted[monLeft k]:=a_index
	}
	arr2:=[]
	for k,v in sorted
		arr2.insert(arr[v])
	return arr2
}

whichMonitor(x="",y="",byref monitorInfo="") { 													;-- return [current monitor, monitor count]
	CoordMode,mouse,screen
	if (x="" || y="")
		mousegetpos,x,y
	if !IsObject(monitorInfo)
		monitorInfo:=monitorInfo()

	for k,v in monitorInfo
		if (x>=v.l&&x<=v.r&&y>=v.t&&y<=v.b)
			return [k,monitorInfo.maxIndex()]
}

IsOfficeFile(FileName, Extensions = "doc,docx,xls,xlsx,ppt,pptx") { 						;-- checks if a file is an Office file

	;  Last update: 2014-4-23

	static doc  := "57006f007200640044006f00630075006d0065006e0074"                                 ; W.o.r.d.D.o.c.u.m.e.n.t
	,      docx := "00776F72642F"                                                                   ; .word/
	,      xls  := "0057006f0072006b0062006f006f006b00"                                             ; .W.o.r.k.b.o.o.k.
	,      xlsx := "0000786C2F"                                                                     ; ..xl/
	,      ppt  := "0050006f0077006500720050006f0069006e007400200044006f00630075006d0065006e007400" ; .P.o.w.e.r.P.o.i.n.t. .D.o.c.u.m.e.n.t.
	,      pptx := "00007070742F"                                                                   ; ..ppt/

	; =======================================
	; Check first 4 bytes
	; =======================================
	File := FileOpen(FileName, "r")
	File.RawRead(bin, 4)
	MCode_Bin2Hex(&bin, 4, hex)

	; Magic Numbers (http://en.wikipedia.org/wiki/List_of_file_signatures)
	;   doc/xls/ppt: D0CF11E0
	;   zip/jar/odt/ods/odp/docx/xlsx/pptx/apk: 504B0304, 504B0506 (empty archive) or 504B0708 (spanned archive)
	If hex not in D0CF11E0,504B0304,504B0506,504B0708
		Return "", File.Close()

	; =======================================
	; docx/xlsx/pptx --> check last 1024 bytes
	; =======================================
	If hex in 504B0304,504B0506,504B0708
	{
		File.Position := File.Length - 1024
		File.RawRead(bin, 1024)
		File.Close()
		MCode_Bin2Hex(&bin, 1024, hex)

		Loop, Parse, Extensions, CSV, %A_Space%%A_Tab%
			If (  InStr(hex, %A_LoopField%)  )
				Return A_LoopField

		Return
	}

	; =======================================
	; detect doc/xls/ppt
	; Reference: Daniel Rentz. Microsoft Compound Document File Format. 2006-Dec - 21.
	; =======================================
	; SecID of first sector of the directory stream
	File.Position := 48
	File.RawRead(bin, 4)
	MCode_Bin2Hex(&bin, 4, hex)
	SecID1 := "0x" SubStr(hex, 7, 2) SubStr(hex, 5, 2) SubStr(hex, 3, 2) SubStr(hex, 1, 2)
	SecID1 := SecID1 + 0

	; Jump to this offset...
	Offset := 512 * (SecID1 + 1)
	Length := 5 * 128

	File.Position := Offset
	File.RawRead(bin, Length)
	MCode_Bin2Hex(&bin, Length, hex)

	File.Close()

	; detecting...
	Loop, Parse, Extensions, CSV, %A_Space%%A_Tab%
		If (  InStr(hex, %A_LoopField%)  )
			Return A_LoopField
}

;}
; GetProcesses()				|	GetProcessWorkingDir()		|	GetTextSize()						|
; GetTextSize()					|	monitorInfo()					|	whichMonitor()						|
; IsOfficeFile()					|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Graphic functions (27)

LoadPicture(aFilespec, aWidth:=0, aHeight:=0, ByRef aImageType:="", 				;--Loads a picture and returns an HBITMAP or HICON to the caller
aIconNumber:=0, aUseGDIPlusIfAvailable:=1) {

	; Returns NULL on failure.
	; If aIconNumber > 0, an HICON or HCURSOR is returned (both should be interchangeable), never an HBITMAP.
	; However, aIconNumber==1 is treated as a special icon upon which LoadImage is given preference over ExtractIcon
	; for .ico/.cur/.ani files.
	; Otherwise, .ico/.cur/.ani files are normally loaded as HICON (unless aUseGDIPlusIfAvailable is true or
	; something else unusual happened such as file contents not matching file's extension).  This is done to preserve
	; any properties that HICONs have but HBITMAPs lack, namely the ability to be animated and perhaps other things.
	;
	; Loads a JPG/GIF/BMP/ICO/etc. and returns an HBITMAP or HICON to the caller (which it may call
	; DeleteObject()/DestroyIcon() upon, though upon program termination all such handles are freed
	; automatically).  The image is scaled to the specified width and height.  If zero is specified
	; for either, the image's actual size will be used for that dimension.  If -1 is specified for one,
	; that dimension will be kept proportional to the other dimension's size so that the original aspect
	; ratio is retained.

	static IMAGE_ICON,IMAGE_BITMAP,IMAGE_CURSOR,LR_LOADFROMFILE,LR_CREATEDIBSECTION,GdiplusStartupInput,gdi_input,CLR_DEFAULT,GENERIC_READ,OPEN_EXISTING,GMEM_MOVEABLE,LR_COPYRETURNORG,bitmap,ii,LR_COPYDELETEORG,INVALID_HANDLE_VALUE,IID_IPicture

	if !IMAGE_ICON
    IMAGE_ICON:=1,IMAGE_BITMAP:=0,IMAGE_CURSOR:=2,LR_LOADFROMFILE:=16, LR_CREATEDIBSECTION:=8192
    ,GdiplusStartupInput :="UINT32 GdiplusVersion;PTR DebugEventCallback;BOOL SuppressBackgroundThread;BOOL SuppressExternalCodecs"
    ,gdi_input:=Struct(GdiplusStartupInput),CLR_DEFAULT:=4278190080,GENERIC_READ:=2147483648
    ,OPEN_EXISTING:=3,GMEM_MOVEABLE:=2,LR_COPYRETURNORG:=4
    ,bitmap:=Struct("LONG bmType;LONG bmWidth;LONG bmHeight;LONG bmWidthBytes;WORD bmPlanes;WORD bmBitsPixel;LPVOID bmBits") ;BITMAP
    ,ii:=Struct("BOOL fIcon;DWORD xHotspot;DWORD yHotspot;HBITMAP hbmMask;HBITMAP hbmColor") ; ICONINFO
    ,LR_COPYDELETEORG:=8,INVALID_HANDLE_VALUE:=-1,VarSetCapacity(IID_IPicture,16,0) CLSIDFromString("{7BF80980-BF32-101A-8BBB-00AA00300CAB}", &IID_IPicture)
	hbitmap := 0
	,aImageType := -1 ; The type of image currently inside hbitmap.  Set default value for output parameter as "unknown".

	if (aFilespec="") ; Allow blank filename to yield NULL bitmap (and currently, some callers do call it this way).
		return 0

	; Lexikos: Negative values now indicate an icon's integer resource ID.
	;if (aIconNumber < 0) ; Allowed to be called this way by GUI and others (to avoid need for validation of user input there).
	;	aIconNumber = 0 ; Use the default behavior, which is "load icon or bitmap, whichever is most appropriate".

	file_ext := SubStr(aFilespec, InStr(aFilespec,".",1,-1) + 1)

	; v1.0.43.07: If aIconNumber is zero, caller didn't specify whether it wanted an icon or bitmap.  Thus,
	; there must be some kind of detection for whether ExtractIcon is needed instead of GDIPlus/OleLoadPicture.
	; Although this could be done by attempting ExtractIcon only after GDIPlus/OleLoadPicture fails (or by
	; somehow checking the internal nature of the file), for performance and code size, it seems best to not
	; to incur this extra I/O and instead make only one attempt based on the file's extension.
	; Must use ExtractIcon() if either of the following is true:
	; 1) Caller gave an icon index of the second or higher icon in the file.  Update for v1.0.43.05: There
	;    doesn't seem to be any reason to allow a caller to explicitly specify ExtractIcon as the method of
	;    loading the *first* icon from a .ico file since LoadImage is likely always superior.  This is
	;    because unlike ExtractIcon/Ex, LoadImage: 1) Doesn't distort icons, especially 16x16 icons 2) is
	;    capable of loading icons other than the first by means of width and height parameters.
	; 2) The target file is of type EXE/DLL/ICL/CPL/etc. (LoadImage() is documented not to work on those file types).
	;    ICL files (v1.0.43.05): Apparently ICL files are an unofficial file format. Someone on the newsgroups
	;    said that an ICL is an "ICon Library... a renamed 16-bit Windows .DLL (an NE format executable) which
	;    typically contains nothing but a resource section. The ICL extension seems to be used by convention."
	; L17: Support negative numbers to mean resource IDs. These are supported by the resource extraction method directly, and by ExtractIcon if aIconNumber < -1.
	; Icon library: Unofficial dll container, see notes above. (*.icl)
	; Control panel extension/applet (ExtractIcon is said to work on these). (*.cpl)
	; Screen saver (ExtractIcon should work since these are really EXEs). (*.src)
	If (ExtractIcon_was_used := aIconNumber > 1 || aIconNumber < 0 || file_ext = "exe" || file_ext="dll" || file_ext="icl" || file_ext="cpl" || file_ext="scr"){
		; v1.0.44: Below are now omitted to reduce code size and improve performance. They are still supported
		; indirectly because ExtractIcon is attempted whenever LoadImage() fails further below.
		;|| !_tcsicmp(file_ext, _T("drv")) ; Driver (ExtractIcon is said to work on these).
		;|| !_tcsicmp(file_ext, _T("ocx")) ; OLE/ActiveX Control Extension
		;|| !_tcsicmp(file_ext, _T("vbx")) ; Visual Basic Extension
		;|| !_tcsicmp(file_ext, _T("acm")) ; Audio Compression Manager Driver
		;|| !_tcsicmp(file_ext, _T("bpl")) ; Delphi Library (like a DLL?)
		; Not supported due to rarity, code size, performance, and uncertainty of whether ExtractIcon works on them.
		; Update for v1.0.44: The following are now supported indirectly because ExtractIcon is attempted whenever
		; LoadImage() fails further below.
		;|| !_tcsicmp(file_ext, _T("nil")) ; Norton Icon Library
		;|| !_tcsicmp(file_ext, _T("wlx")) ; Total/Windows Commander Lister Plug-in
		;|| !_tcsicmp(file_ext, _T("wfx")) ; Total/Windows Commander File System Plug-in
		;|| !_tcsicmp(file_ext, _T("wcx")) ; Total/Windows Commander Plug-in
		;|| !_tcsicmp(file_ext, _T("wdx")) ; Total/Windows Commander Plug-in

		aImageType := IMAGE_ICON

		; L17: Manually extract the most appropriately sized icon resource for the best results.
		,hbitmap := ExtractIconFromExecutable(aFilespec, aIconNumber, aWidth, aHeight)

		if (hbitmap < 2) ; i.e. it's NULL or 1. Return value of 1 means "incorrect file type".
			return 0 ; v1.0.44: Fixed to return NULL vs. hbitmap, since 1 is an invalid handle (perhaps rare since no known bugs caused by it).
		;else continue on below so that the icon can be resized to the caller's specified dimensions.
	}	else if (aIconNumber > 0) ; Caller wanted HICON, never HBITMAP, so set type now to enforce that.
		aImageType := IMAGE_ICON ; Should be suitable for cursors too, since they're interchangeable for the most part.
	else if (file_ext) ; Make an initial guess of the type of image if the above didn't already determine the type.
	{
		if (file_ext = "ico")
			aImageType := IMAGE_ICON
		else if (file_ext="cur" || file_ext="ani")
			aImageType := IMAGE_CURSOR
		else if (file_ext="bmp")
			aImageType := IMAGE_BITMAP
		;else for other extensions, leave set to "unknown" so that the below knows to use IPic or GDI+ to load it.
	}
	;else same comment as above.

	if ((aWidth = -1 || aHeight = -1) && (!aWidth || !aHeight))
		aWidth := aHeight := 0 ; i.e. One dimension is zero and the other is -1, which resolves to the same as "keep original size".
	keep_aspect_ratio := aWidth = -1 || aHeight = -1

	; Caller should ensure that aUseGDIPlusIfAvailable==false when aIconNumber > 0, since it makes no sense otherwise.
	if (aUseGDIPlusIfAvailable && !(hinstGDI := LoadLibrary("gdiplus"))) ; Relies on short-circuit boolean order for performance.
		aUseGDIPlusIfAvailable := false ; Override any original "true" value as a signal for the section below.
	if (!hbitmap && aImageType > -1 && !aUseGDIPlusIfAvailable)
	{
		; Since image hasn't yet be loaded and since the file type appears to be one supported by
		; LoadImage() [icon/cursor/bitmap], attempt that first.  If it fails, fall back to the other
		; methods below in case the file's internal contents differ from what the file extension indicates.
		if (keep_aspect_ratio) ; Load image at its actual size.  It will be rescaled to retain aspect ratio later below.
		{
			desired_width := 0
			,desired_height := 0
		}
		else
		{
			desired_width := aWidth
			,desired_height := aHeight
		}
		; For LoadImage() below:
		; LR_CREATEDIBSECTION applies only when aImageType == IMAGE_BITMAP, but seems appropriate in that case.
		; Also, if width and height are non-zero, that will determine which icon of a multi-icon .ico file gets
		; loaded (though I don't know the exact rules of precedence).
		; KNOWN LIMITATIONS/BUGS:
		; LoadImage() fails when requesting a size of 1x1 for an image whose orig/actual size is small (e.g. 1x2).
		; Unlike CopyImage(), perhaps it detects that division by zero would occur and refuses to do the
		; calculation rather than providing more code to do a correct calculation that doesn't divide by zero.
		; For example:
		; LoadImage() Success:
		;   Gui, Add, Pic, h2 w2, bitmap 1x2.bmp
		;   Gui, Add, Pic, h1 w1, bitmap 4x6.bmp
		; LoadImage() Failure:
		;   Gui, Add, Pic, h1 w1, bitmap 1x2.bmp
		; LoadImage() also fails on:
		;   Gui, Add, Pic, h1, bitmap 1x2.bmp
		; And then it falls back to GDIplus, which in the particular case above appears to traumatize the
		; parent window (or its picture control), because the GUI window hangs (but not the script) after
		; doing a FileSelectFolder.  For example:
		;   Gui, Add, Button,, FileSelectFile
		;   Gui, Add, Pic, h1, bitmap 1x2.bmp   Causes GUI window to hang after FileSelectFolder (due to LoadImage failing then falling back to GDIplus i.e. GDIplus is somehow triggering the problem).
		;   Gui, Show
		;   return
		;   ButtonFileSelectFile:
		;   FileSelectFile, outputvar
		;   return
		if (hbitmap := LoadImage(0, aFilespec, aImageType, desired_width, desired_height, LR_LOADFROMFILE | LR_CREATEDIBSECTION))
		{
			; The above might have loaded an HICON vs. an HBITMAP (it has been confirmed that LoadImage()
			; will return an HICON vs. HBITMAP is aImageType is IMAGE_ICON/CURSOR).  Note that HICON and
			; HCURSOR are identical for most/all Windows API uses.  Also note that LoadImage() will load
			; an icon as a bitmap if the file contains an icon but IMAGE_BITMAP was passed in (at least
			; on Windows XP).
			if (!keep_aspect_ratio) ; No further resizing is needed.
				return hbitmap
			; Otherwise, continue on so that the image can be resized via a second call to LoadImage().
		}
		; v1.0.40.10: Abort if file doesn't exist so that GDIPlus isn't even attempted. This is done because
		; loading GDIPlus apparently disrupts the color palette of certain games, at least old ones that use
		; DirectDraw in 256-color depth.
		else if (GetFileAttributes(aFilespec) = 0xFFFFFFFF) ; For simplicity, we don't check if it's a directory vs. file, since that should be too rare.
			return 0
		; v1.0.43.07: Also abort if caller wanted an HICON (not an HBITMAP), since the other methods below
		; can't yield an HICON.
		else if (aIconNumber > 0)
		{
			; UPDATE for v1.0.44: Attempt ExtractIcon in case its some extension that's
			; was recognized as an icon container (such as AutoHotkeySC.bin) and thus wasn't handled higher above.
			;hbitmap = (HBITMAP)ExtractIcon(g_hInstance, aFilespec, aIconNumber - 1)

			; L17: Manually extract the most appropriately sized icon resource for the best results.
			hbitmap := ExtractIconFromExecutable(aFilespec, aIconNumber, aWidth, aHeight)

			if (hbitmap < 2) ; i.e. it's NULL or 1. Return value of 1 means "incorrect file type".
				return 0
			ExtractIcon_was_used := true
		}
		;else file exists, so continue on so that the other methods are attempted in case file's contents
		; differ from what the file extension indicates, or in case the other methods can be successful
		; even when the above failed.
	}

	; pic := 0 is also used to detect whether IPic method was used to load the image.

	if (!hbitmap) ; Above hasn't loaded the image yet, so use the fall-back methods.
	{
		; At this point, regardless of the image type being loaded (even an icon), it will
		; definitely be converted to a Bitmap below.  So set the type:
		aImageType := IMAGE_BITMAP
		; Find out if this file type is supported by the non-GDI+ method.  This check is not foolproof
		; since all it does is look at the file's extension, not its contents.  However, it doesn't
		; need to be 100% accurate because its only purpose is to detect whether the higher-overhead
		; calls to GdiPlus can be avoided.

		if (aUseGDIPlusIfAvailable || !file_ext || file_ext!="jpg"
			&& file_ext!="jpeg" && file_ext!="gif") ; Non-standard file type (BMP is already handled above).
			if (!hinstGDI) ; We don't yet have a handle from an earlier call to LoadLibary().
				hinstGDI := LoadLibrary("gdiplus")
		; If it is suspected that the file type isn't supported, try to use GdiPlus if available.
		; If it's not available, fall back to the old method in case the filename doesn't properly
		; reflect its true contents (i.e. in case it really is a JPG/GIF/BMP internally).
		; If the below LoadLibrary() succeeds, either the OS is XP+ or the GdiPlus extensions have been
		; installed on an older OS.
		if (hinstGDI)
		{
			; LPVOID and "int" are used to avoid compiler errors caused by... namespace issues?

			gdi_input.Fill()
			if !GdiplusStartup(getvar(token:=0), gdi_input[], 0)
			{
				if !GdipCreateBitmapFromFile(aFilespec, getvar(pgdi_bitmap:=0))
				{
					if GdipCreateHBITMAPFromBitmap(pgdi_bitmap, hbitmap, CLR_DEFAULT)
						hbitmap := 0 ; Set to NULL to be sure.
					GdipDisposeImage(pgdi_bitmap) ; This was tested once to make sure it really returns Gdiplus::Ok.
				}
				; The current thought is that shutting it down every time conserves resources.  If so, it
				; seems justified since it is probably called infrequently by most scripts:
				GdiplusShutdown(token)
			}
			FreeLibrary(hinstGDI)
		}
		else ; Using old picture loading method.
		{
			; Based on code sample at http:;www.codeguru.com/Cpp/G-M/bitmap/article.php/c4935/
			hfile := CreateFile(aFilespec, GENERIC_READ, 0, 0, OPEN_EXISTING, 0, 0)
			if (hfile = INVALID_HANDLE_VALUE)
				return 0
			size := GetFileSize(hfile, 0)
			if !(hglobal := GlobalAlloc(GMEM_MOVEABLE, size)){
				CloseHandle(hfile)
				return 0
			}
			if !(hlocked := GlobalLock(hglobal)){
				CloseHandle(hfile)
				,GlobalFree(hglobal)
				return 0
			}
			; Read the file into memory:
			ReadFile(hfile, hlocked, size, getvar(size), 0)
			,GlobalUnlock(hglobal)
			,CloseHandle(hfile)
			if (0 > CreateStreamOnHGlobal(hglobal, FALSE, getvar(stream:=0)) || !stream )  ; Relies on short-circuit boolean order.
			{
				GlobalFree(hglobal)
				return 0
			}

			; Specify TRUE to have it do the GlobalFree() for us.  But since the call might fail, it seems best
			; to free the mem ourselves to avoid uncertainty over what it does on failure:
			if (0 > OleLoadPicture(stream, size, FALSE, &IID_IPicture,getvar(pic:=0)))
				pic:=0

			DllCall(NumGet(NumGet(stream+0)+8),"PTR",stream) ;->Release()
			,GlobalFree(hglobal)
			if !pic
				return 0
			DllCall(NumGet(NumGet(pic+0)+12),"PTR",pic,"PTR*",hbitmap)
			; Above: MSDN: "The caller is responsible for this handle upon successful return. The variable is set
			; to NULL on failure."
			if (!hbitmap)
			{
				DllCall(NumGet(NumGet(pic+0)+8),"PTR",pic)
				return 0
			}
			; Don't pic->Release() yet because that will also destroy/invalidate hbitmap handle.
		} ; IPicture method was used.
	} ; IPicture or GDIPlus was used to load the image, not a simple LoadImage() or ExtractIcon().

	; Above has ensured that hbitmap is now not NULL.
	; Adjust things if "keep aspect ratio" is in effect:
	if (keep_aspect_ratio)
	{
		ii.Fill()
		if (aImageType = IMAGE_BITMAP)
			hbitmap_to_analyze := hbitmap
		else ; icon or cursor
		{
			if (GetIconInfo(hbitmap, ii[])) ; Works on cursors too.
				hbitmap_to_analyze := ii.hbmMask ; Use Mask because MSDN implies hbmColor can be NULL for monochrome cursors and such.
			else
			{
				DestroyIcon(hbitmap)
				return 0 ; No need to call pic->Release() because since it's an icon, we know IPicture wasn't used (it only loads bitmaps).
			}
		}
		; Above has ensured that hbitmap_to_analyze is now not NULL.  Find bitmap's dimensions.
		bitmap.Fill()
		,GetObject(hbitmap_to_analyze, sizeof(_BITMAP), bitmap[]) ; Realistically shouldn't fail at this stage.
		if (aHeight = -1)
		{
			; Caller wants aHeight calculated based on the specified aWidth (keep aspect ratio).
			if (bitmap.bmWidth) ; Avoid any chance of divide-by-zero.
				aHeight := (bitmap.bmHeight / bitmap.bmWidth) * aWidth + 0.5 ; Round.
		}
		else
		{
			; Caller wants aWidth calculated based on the specified aHeight (keep aspect ratio).
			if (bitmap.bmHeight) ; Avoid any chance of divide-by-zero.
				aWidth := (bitmap.bmWidth / bitmap.bmHeight) * aHeight + 0.5 ; Round.
		}
		if (aImageType != IMAGE_BITMAP)
		{
			; It's our responsibility to delete these two when they're no longer needed:
			DeleteObject(ii.hbmColor)
			,DeleteObject(ii.hbmMask)
			; If LoadImage() vs. ExtractIcon() was used originally, call LoadImage() again because
			; I haven't found any other way to retain an animated cursor's animation (and perhaps
			; other icon/cursor attributes) when resizing the icon/cursor (CopyImage() doesn't
			; retain animation):
			if (!ExtractIcon_was_used)
			{
				DestroyIcon(hbitmap) ; Destroy the original HICON.
				; Load a new one, but at the size newly calculated above.
				; Due to an apparent bug in Windows 9x (at least Win98se), the below call will probably
				; crash the program with a "divide error" if the specified aWidth and/or aHeight are
				; greater than 90.  Since I don't know whether this affects all versions of Windows 9x, and
				; all animated cursors, it seems best just to document it here and in the help file rather
				; than limiting the dimensions of .ani (and maybe .cur) files for certain operating systems.
				return LoadImage(0, aFilespec, aImageType, aWidth, aHeight, LR_LOADFROMFILE)
			}
		}
	}


	if (pic) ; IPicture method was used.
	{
		; The below statement is confirmed by having tested that DeleteObject(hbitmap) fails
		; if called after pic->Release():
		; "Copy the image. Necessary, because upon pic's release the handle is destroyed."
		; MSDN: CopyImage(): "[If either width or height] is zero, then the returned image will have the
		; same width/height as the original."
		; Note also that CopyImage() seems to provide better scaling quality than using MoveWindow()
		; (followed by redrawing the parent window) on the static control that contains it:
		hbitmap_new := CopyImage(hbitmap, IMAGE_BITMAP, aWidth, aHeight ; We know it's IMAGE_BITMAP in this case.
														, (aWidth || aHeight) ? 0 : LR_COPYRETURNORG) ; Produce original size if no scaling is needed.
		,DllCall(NumGet(NumGet(pic+0)+8),"PTR",pic)
		; No need to call DeleteObject(hbitmap), see above.
	}
	else ; GDIPlus or a simple method such as LoadImage or ExtractIcon was used.
	{
		if (!aWidth && !aHeight) ; No resizing needed.
			return hbitmap
		; The following will also handle HICON/HCURSOR correctly if aImageType == IMAGE_ICON/CURSOR.
		; Also, LR_COPYRETURNORG|LR_COPYDELETEORG is used because it might allow the animation of
		; a cursor to be retained if the specified size happens to match the actual size of the
		; cursor.  This is because normally, it seems that CopyImage() omits cursor animation
		; from the new object.  MSDN: "LR_COPYRETURNORG returns the original hImage if it satisfies
		; the criteria for the copy�that is, correct dimensions and color depth�in which case the
		; LR_COPYDELETEORG flag is ignored. If this flag is not specified, a new object is always created."
		; KNOWN BUG: Calling CopyImage() when the source image is tiny and the destination width/height
		; is also small (e.g. 1) causes a divide-by-zero exception.
		; For example:
		;   Gui, Add, Pic, h1 w-1, bitmap 1x2.bmp   Crash (divide by zero)
		;   Gui, Add, Pic, h1 w-1, bitmap 2x3.bmp   Crash (divide by zero)
		; However, such sizes seem too rare to document or put in an exception handler for.
		hbitmap_new := CopyImage(hbitmap, aImageType, aWidth, aHeight, LR_COPYRETURNORG | LR_COPYDELETEORG)
		; Above's LR_COPYDELETEORG deletes the original to avoid cascading resource usage.  MSDN's
		; LoadImage() docs say:
		; "When you are finished using a bitmap, cursor, or icon you loaded without specifying the
		; LR_SHARED flag, you can release its associated memory by calling one of [the three functions]."
		; Therefore, it seems best to call the right function even though DeleteObject might work on
		; all of them on some or all current OSes.  UPDATE: Evidence indicates that DestroyIcon()
		; will also destroy cursors, probably because icons and cursors are literally identical in
		; every functional way.  One piece of evidence:
		;> No stack trace, but I know the exact source file and line where the call
		;> was made. But still, it is annoying when you see 'DestroyCursor' even though
		;> there is 'DestroyIcon'.
		; "Can't be helped. Icons and cursors are the same thing" (Tim Robinson (MVP, Windows SDK)).
		;
		; Finally, the reason this is important is that it eliminates one handle type
		; that we would otherwise have to track.  For example, if a gui window is destroyed and
		; and recreated multiple times, its bitmap and icon handles should all be destroyed each time.
		; Otherwise, resource usage would cascade upward until the script finally terminated, at
		; which time all such handles are freed automatically.
	}
	return hbitmap_new
}

GetImageDimensionProperty(ImgPath, Byref width, Byref height, 							;-- this retrieves the dimensions from a dummy Gui
PropertyName="dimensions") {

    Static DimensionIndex
    SplitPath, ImgPath , FileName, DirPath,
    objShell := ComObjCreate("Shell.Application")
    objFolder := objShell.NameSpace(DirPath)
    objFolderItem := objFolder.ParseName(FileName)

    if !DimensionIndex {
        Loop
            DimensionIndex := A_Index
        Until (objFolder.GetDetailsOf(objFolder.Items, A_Index) = PropertyName) || (A_Index > 300)
    }

    if (DimensionIndex = 301)
        Return

    dimensions := objFolder.GetDetailsOf(objFolderItem, DimensionIndex)
    width := height := ""
    pos := len := 0
    loop 2
    {
        pos := RegExMatch(dimensions, "O)\d+", oM, pos+len+1)
        if (A_Index = 1)
            width := oM.Value(0), len := oM.len(0)
        else
            height := oM.Value(0)
    }

}

GetImageDimensions(ImgPath, Byref width, Byref height) {									;-- Retrieves image width and height of a specified image file

	/*											Description

		;https://sites.google.com/site/ahkref/custom-functions/getimagedimensions

		Retrieves image width and height of a specified image file.

		Requirements
		AutoHotkey 1.1.05.00 or later. Tested on: Windows 7 64bit, AutoHotkey 32bit Unicode 1.1.05.05.

		License
		Public Domain.

		Format
		GetImageDimensionProperty(ImgPath, Byref width, Byref height, PropertyName="dimensions")
		Parameters
		ImgPath: the path of the file to look up the dimensions.
		width: pass a variable to store the retrieved width.
		height: pass a variable to store the retrieved height.
		PropertyName: the property name which stores the information of image dimensions. In English OS, it is dimensions.
		Return Value
		None.

		Remarks
		This function retrieves the information of detail properties and the PropertyName parameter must match the property name in the property details

	*/

	/*											Example

		ImageFile := A_ScriptDir "\logo.gif"
		if !FileExist(ImageFile)
			UrlDownloadToFile, http://www.autohotkey.com/docs/images/AutoHotkey_logo.gif, % ImageFile

		GetImageDimensions(ImageFile, w, h)
		msgbox % "Width:`t" w "`nHeight:`t" h

	*/


    DHW := A_DetectHiddenWIndows
    DetectHiddenWindows, ON
    Gui, AnimatedGifControl_GetImageDimensions: Add, Picture, hwndhWndImage, % ImgPath
    GuiControlGet, Image, AnimatedGifControl_GetImageDimensions:Pos, % hWndImage
    Gui, AnimatedGifControl_GetImageDimensions: Destroy
    DetectHiddenWindows, % DHW
    width := ImageW,     height := ImageH

}

Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r) {								;--

	Region := Gdip_GetClipRegion(pGraphics)
	Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
	Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
	Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
	Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
	E := Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
	Gdip_SetClipRegion(pGraphics, Region, 0)
	Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
	Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
	Gdip_FillEllipse(pGraphics, pBrush, x, y, 2*r, 2*r)
	Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r)-1, y, 2*r, 2*r)
	Gdip_FillEllipse(pGraphics, pBrush, x, y+h-(2*r)-1, 2*r, 2*r)
	Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r)-1, y+h-(2*r)-1, 2*r, 2*r)
	Gdip_SetClipRegion(pGraphics, Region, 0)
	Gdip_DeleteRegion(Region)
	Return E

}

Redraw(hwnd=0) {																							;-- redraws the overlay window(s) using the position, text and scrolling settings

    ;This function redraws the overlay window(s) using the position, text and scrolling settings
    global MainOverlay, PreviewOverlay, PreviewWindow, MainWindow
	outputdebug redraw
	;Called without parameters, recursive calls for both overlays
	if(hwnd=0)
	{
		if(MainOverlay && PreviewOverlay)
		{
			Redraw(MainWindow)
			Redraw(PreviewWindow)
			return
		}
		Else
		{
			msgbox Redraw() called with invalid window handle
			Exit
		}
	}
	;Get Position of overlay area and text position
	GetOverlayArea(x,y,w,h,hwnd)
	GetAbsolutePosition(CenterX,CenterY,hwnd)
	GetDrawingSettings(text,font,FontColor,style,BackColor,hwnd)

	; Create a gdi bitmap with width and height of what we are going to draw into it. This is the entire drawing area for everything
	hbm := CreateDIBSection(w, h)

	; Get a device context compatible with the screen
	hdc := CreateCompatibleDC()

	; Select the bitmap into the device context
	obm := SelectObject(hdc, hbm)

	; Get a pointer to the graphics of the bitmap, for use with drawing functions
	G := Gdip_GraphicsFromHDC(hdc)

	; Set the smoothing mode to antialias = 4 to make shapes appear smother (only used for vector drawing and filling)
	Gdip_SetSmoothingMode(G, 4)
	Gdip_SetTextRenderingHint(G, 1)
	; Create a partially transparent, black brush (ARGB = Transparency, red, green, blue) to draw a rounded rectangle with
	pBrush := Gdip_BrushCreateSolid(backcolor)
	hFont := Font("", style "," font )
	size := Font_DrawText(text, hdc, hFont, "CALCRECT")		;measure the text, use already created font
	StringSplit, size, size, .
	FontWidth := size1,	FontHeight := size2
	DrawX:=CenterX-Round(FontWidth/2)
	DrawY:=CenterY-Round(FontHeight/2)

	corners:=min(Round(min(FontWidth,FontHeight)/5),20)
	Gdip_FillRoundedRectangle(G, pBrush, DrawX, DrawY, FontWidth, FontHeight, corners)
	; Delete the brush as it is no longer needed and wastes memory
	Gdip_DeleteBrush(pBrush)

	Options = x%DrawX% y%DrawY% cff%FontColor% %style% r4
	Gdip_TextToGraphics(G, text, Options, Font)


	; Update the specified window we have created (hwnd1) with a handle to our bitmap (hdc), specifying the x,y,w,h we want it positioned on our screen
	; With some simple maths we can place the gui in the centre of our primary monitor horizontally and vertically at the specified heigth and width
	if(hwnd=PreviewWindow)
		UpdateLayeredWindow(PreviewOverlay, hdc, x, y, w, h)
	else if(hwnd=MainWindow)
		UpdateLayeredWindow(MainOverlay, hdc, x, y, w, h)

	; Select the object back into the hdc
	SelectObject(hdc, obm)

	; Now the bitmap may be deleted
	DeleteObject(hbm)

	; Also the device context related to the bitmap may be deleted
	DeleteDC(hdc)

	; The graphics may now be deleted
	Gdip_DeleteGraphics(G)
}

CreateSurface(monitor := 0, window := 0) {														;-- creates a drawing GDI surface

	global DrawSurface_Hwnd

	if(monitor = 0) {
		if(window) {
			WinGetPos, sX, sY, sW, sH, ahk_id %window%
		} else {
			WinGetPos, sX, sY, sW, sH, Program Manager
		}
	} else {
		Sysget, MonitorInfo, Monitor, %monitor%
		sX := MonitorInfoLeft, sY := MonitorInfoTop
		sW := MonitorInfoRight - MonitorInfoLeft
		sH := MonitorInfoBottom - MonitorInfoTop
	}

	Gui DrawSurface:Color, 0xFFFFFF
	Gui DrawSurface: +E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop
	WinGet, DrawSurface_Hwnd, ID,
	WinSet, TransColor, 0xFFFFFF

	Gui DrawSurface:Show, x%sX% y%sY% w%sW% h%sH%
	Sleep, 100
	Gui DrawSurface:Submit

	return DrawSurface_Hwnd
}
;{ additional functions for CreateSurface
ShowSurface() {
	WinGet, active_win, ID, A
	Gui DrawSurface:Show
	WinActivate, ahk_id %active_win%
}

HideSurface() {
	Gui DrawSurface:Submit
}

WipeSurface(hwnd) {
	DllCall("InvalidateRect", UInt, hwnd, UInt, 0, Int, 1)
    DllCall("UpdateWindow", UInt, hwnd)
}

StartDraw(wipe := true) {

	global DrawSurface_Hwnd

	if(wipe)
		WipeSurface(DrawSurface_Hwnd)

    HDC := DllCall("GetDC", Int, DrawSurface_Hwnd)

    return HDC
}

EndDraw(hdc) {
	global DrawSurface_Hwnd
	DllCall("ReleaseDC", Int, DrawSurface_Hwnd, Int, hdc)
}

SetPen(color, thickness, hdc) {

	global DrawSurface_Hwnd

	static pen := 0

	if(pen) {
		DllCall("DeleteObject", Int, pen)
		pen := 0
	}

	pen := DllCall("CreatePen", UInt, 0, UInt, thickness, UInt, color)
    DllCall("SelectObject", Int, hdc, Int, pen)

}
;}

DrawLine(hdc, rX1, rY1, rX2, rY2) {																	;-- used DLLCall to draw a line

	DllCall("MoveToEx", Int, hdc, Int, rX1, Int, rY1, UInt, 0)
	DllCall("LineTo", Int, hdc, Int, rX2, Int, rY2)

}

DrawRectangle(hdc, left, top, right, bottom) {														;-- used DLLCall to draw a rectangle

	DllCall("MoveToEx", Int, hdc, Int, left, Int, top, UInt, 0)
    DllCall("LineTo", Int, hdc, Int, right, Int, top)
    DllCall("LineTo", Int, hdc, Int, right, Int, bottom)
    DllCall("LineTo", Int, hdc, Int, left, Int, bottom)
    DllCall("LineTo", Int, hdc, Int, left, Int, top-1)

}

DrawRectangle(startNewRectangle := false) {														;-- this is for screenshots

	static lastX, lastY
	static xorigin, yorigin

	if (startNewRectangle) {
	  MouseGetPos, xorigin, yorigin
	}

	CoordMode, Mouse, Screen
	MouseGetPos, currentX, currentY

	; Has the mouse moved?
	if (lastX lastY) = (currentX currentY)
	return

	lastX := currentX
	lastY := currentY

	x := Min(currentX, xorigin)
	w := Abs(currentX - xorigin)
	y := Min(currentY, yorigin)
	h := Abs(currentY - yorigin)

	Gui, ScreenshotSelection:Show, % "NA X" x " Y" y " W" w " H" h
	Gui, ScreenshotSelection:+LastFound

}

DrawFrameAroundControl(ControlID, WindowUniqueID, frame_t) {					;--

    global h_brushC, h_brushW, ChkDrawRectCtrl, ChkDrawRectWin

    ;get coordinates of Window and control again
    ;(could have been past into the function but it seemed too much parameters)
    WinGetPos, WindowX, WindowY, WindowWidth, WindowHeight, ahk_id %WindowUniqueID%
    ControlGetPos, ControlX, ControlY, ControlWidth, ControlHeight, %ControlID%, ahk_id %WindowUniqueID%

    ;find upper left corner relative to screen
    StartX := WindowX + ControlX
    StartY := WindowY + ControlY

    ;show ID in upper left corner
    CoordMode, ToolTip, Screen

    ;show frame gui above AOT apps
    Gui, 2: +AlwaysOnTop

    If ChkDrawRectWin {
        ;if windows upper left corner is outside the screen
        ; it is assumed that the window is maximized and the frame is made smaller
        If ( WindowX < 0 AND WindowY < 0 ){
            WindowX += 4
            WindowY += 4
            WindowWidth -= 8
            WindowHeight -= 8
          }

        ;remove old rectangle from screen and save/buffer screen below new rectangle
        BufferAndRestoreRegion( WindowX, WindowY, WindowWidth, WindowHeight )

        ;draw rectangle frame around window
        DrawFrame( WindowX, WindowY, WindowWidth, WindowHeight, frame_t, h_brushW )

        ;show tooltip above window frame when enough space
        If ( WindowY > 22)
            WindowY -= 22

        ;Show tooltip with windows unique ID
        ToolTip, %WindowUniqueID%, WindowX, WindowY, 3
      }
    Else
        ;remove old rectangle from screen and save/buffer screen below new rectangle
        BufferAndRestoreRegion( StartX, StartY, ControlWidth, ControlHeight )

    If ChkDrawRectCtrl {
        ;draw rectangle frame around control
        DrawFrame( StartX, StartY, ControlWidth, ControlHeight, frame_t, h_brushC )

        ;show tooltip above control frame when enough space, or below
        If ( StartY > 22)
            StartY -= 22
        Else
            StartY += ControlHeight

        ;show control tooltip left of window tooltip if position identical (e.g. Windows Start Button on Taskbar)
        If (StartY = WindowY
            AND StartX < WindowX + 50)
            StartX += 50

        ;Show tooltip with controls unique ID
        ToolTip, %ControlID%, StartX, StartY, 2
      }
    ;set back ToolTip position to default
    CoordMode, ToolTip, Relative
  }

Highlight(reg, delay=1500) {																				;-- Show a red rectangle outline to highlight specified region, it's useful to debug

    ;{-------------------------------------------------------------------------------
    ;
    ; Function: Highlight
    ; Description:
    ;		Show a red rectangle outline to highlight specified region, it's useful to debug
    ; Syntax: Highlight(region [, delay = 1500])
    ; Parameters:
    ;		reg - The region for highlight
    ;		delay - Show time (milliseconds)
    ; Return Value:
    ;		 Real string without variable(s) - "this string has real variable"
    ; Related:
    ;		SendSpiCall, SendWapiCall
    ; Remarks:
    ;		#Include, Gdip.ahk
    ; Example:
    ;		Highlight("100,200,300,400")
    ;		Highlight("100,200,300,400", 1000)
    ;
    ;-------------------------------------------------------------------------------
    ;}

    global @reg_global
; Start gdi+
	If !pToken := Gdip_Startup()
	{
		MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
		ExitApp
	}

	StringSplit, g_coors, @reg_global, `,
	; Set the width and height we want as our drawing area, to draw everything in. This will be the dimensions of our bitmap
	Width := g_coors3
	Height := g_coors4
    ; Create a layered window (+E0x80000 : must be used for UpdateLayeredWindow to work!) that is always on top (+AlwaysOnTop), has no taskbar entry or caption
	Gui, 1: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop

	; Show the window
	Gui, 1: Show, NA

	; Get a handle to this window we have created in order to update it later
	hwnd1 := WinExist()

	; Create a gdi bitmap with width and height of what we are going to draw into it. This is the entire drawing area for everything
	hbm := CreateDIBSection(Width, Height)

	; Get a device context compatible with the screen
	hdc := CreateCompatibleDC()

	; Select the bitmap into the device context
	obm := SelectObject(hdc, hbm)

	; Get a pointer to the graphics of the bitmap, for use with drawing functions
	G := Gdip_GraphicsFromHDC(hdc)

	; Set the smoothing mode to antialias = 4 to make shapes appear smother (only used for vector drawing and filling)
	Gdip_SetSmoothingMode(G, 4)


	; Create a slightly transparent (66) blue pen (ARGB = Transparency, red, green, blue) to draw a rectangle
	; This pen is wider than the last one, with a thickness of 10
	pPen := Gdip_CreatePen(0xffff0000, 2)

	; Draw a rectangle onto the graphics of the bitmap using the pen just created
	; Draws the rectangle from coordinates (250,80) a rectangle of 300x200 and outline width of 10 (specified when creating the pen)

	StringSplit, reg_coors, reg, `,
	x := reg_coors1
	y := reg_coors2
	w := reg_coors3 - reg_coors1
	h := reg_coors4 - reg_coors2

	Gdip_DrawRectangle(G, pPen, x, y, w, h)

	; Delete the brush as it is no longer needed and wastes memory
	Gdip_DeletePen(pPen)

	; Update the specified window we have created (hwnd1) with a handle to our bitmap (hdc), specifying the x,y,w,h we want it positioned on our screen
	; So this will position our gui at (0,0) with the Width and Height specified earlier
	UpdateLayeredWindow(hwnd1, hdc, 0, 0, Width, Height)

	; Select the object back into the hdc
	SelectObject(hdc, obm)

	; Now the bitmap may be deleted
	DeleteObject(hbm)

	; Also the device context related to the bitmap may be deleted
	DeleteDC(hdc)

	; The graphics may now be deleted
	Gdip_DeleteGraphics(G)
	Sleep, %delay%
	Gui, 1: Show, Hide
	Gdip_Shutdown(pToken)
}

SetAlpha(hwnd, alpha) {																					;-- set alpha to a layered window

    DllCall("UpdateLayeredWindow","uint",hwnd,"uint",0,"uint",0
        ,"uint",0,"uint",0,"uint",0,"uint",0,"uint*",alpha<<16|1<<24,"uint",2)

}

CircularText(Angle, Str, Width, Height, Font, Options){										;-- given a string it will generate a bitmap of the characters drawn with a given angle between each char

	;-- Given a string it will generate a bitmap of the characters drawn with a given angle between each char, if the angle is 0 it will try to make the string fill the entire circle.
	;--https://autohotkey.com/boards/viewtopic.php?t=32179
	;--by Capn Odin 23 Mai 2017

	pBitmap := Gdip_CreateBitmap(Width, Height)

	G := Gdip_GraphicsFromImage(pBitmap)

	Gdip_SetSmoothingMode(G, 4)

	if(!Angle) {
		Angle := 360 / StrLen(Str)
	}

	for i, chr in StrSplit(Str) {
		RotateAroundCenter(G, Angle, Width, Height)
		Gdip_TextToGraphics(G, chr, Options, Font, Width, Height)
	}

	Gdip_DeleteGraphics(G)

	Return pBitmap
}

RotateAroundCenter(G, Angle, Width, Height) {													;-- GDIP rotate around center

	Gdip_TranslateWorldTransform(G, Width / 2, Height / 2)
	Gdip_RotateWorldTransform(G, Angle)
	Gdip_TranslateWorldTransform(G, - Width / 2, - Height / 2)

}

;Screenshot - functions maybe useful
Screenshot(outfile, screen) {																				;-- screenshot function 1
    pToken := Gdip_Startup()
    raster := 0x40000000 + 0x00CC0020 ; get layered windows

    pBitmap := Gdip_BitmapFromScreen(screen,raster)

    Gdip_SetBitmapToClipboard(pBitmap)
    Gdip_SaveBitmapToFile(pBitmap, outfile)
    Gdip_DisposeImage(pBitmap)
    Gdip_Shutdown(pToken)

    PlaceTooltip("Screenshot copied and saved.")
}

TakeScreenshot() {																								;-- screenshot function 2

    static UserProfile
    if (UserProfile = "") {
      EnvGet, UserProfile, UserProfile
    }
    CoordMode, Mouse, Screen
    MouseGetPos, begin_x, begin_y
    DrawRectangle(true)
    SetTimer, rectangle, 10
    KeyWait, RButton

    SetTimer, rectangle, Off
    Gui, ScreenshotSelection:Cancel
    MouseGetPos, end_x, end_y

    Capture_x := Min(end_x, begin_x)
    Capture_y := Min(end_y, begin_y)
    Capture_width := Abs(end_x - begin_x)
    Capture_height := Abs(end_y - begin_y)

    area := Capture_x . "|" . Capture_y . "|" . Capture_width . "|" Capture_height ; X|Y|W|H

    FormatTime, CurrentDateTime,, yyyy-MM-ddTHH-mm-ss

    filename := UserProfile "\downloads\screenshot " CurrentDateTime ".png"

    Screenshot(filename,area)
return
}

CaptureWindow(hwndOwner, hwnd) {																;-- screenshot function 3
    VarSetCapacity(RECT, 16, 0)
    DllCall("GetWindowRect", "Ptr", hwnd, "Ptr", &RECT)
    width  := NumGet(RECT, 8, "Int")  - NumGet(RECT, 0, "Int")
    height := NumGet(RECT, 12, "Int") - NumGet(RECT, 4, "Int")

    hdc    := DllCall("GetDC", "Ptr", 0, "Ptr")
    hdcMem := DllCall("CreateCompatibleDC", "Ptr", hdc, "UPtr")
    hBmp   := DllCall("CreateCompatibleBitmap", "Ptr", hdc, "Int", width, "Int", height, "UPtr")
    hdcOld := DllCall("SelectObject", "Ptr", hdcMem, "Ptr", hBmp)

    DllCall("BitBlt", "Ptr", hdcMem
        , "Int", 0, "Int", 0, "Int", width, "Int", height
        , "Ptr", hdc, "Int", Numget(RECT, 0, "Int"), "Int", Numget(RECT, 4, "Int")
        , "UInt", 0x00CC0020) ; SRCCOPY

    DllCall("SelectObject", "Ptr", hdcMem, "Ptr", hdcOld)

    DllCall("OpenClipboard", "Ptr", hwndOwner) ; Clipboard owner
    DllCall("EmptyClipboard")
    DllCall("SetClipboardData", "uint", 0x2, "Ptr", hBmp) ; CF_BITMAP
    DllCall("CloseClipboard")

    DllCall("ReleaseDC", "Ptr", 0, "Ptr", hdc)

    Return True
}
;-----------------------------------------------

RGBRange(x, y=0, c=0, delim=",") {																	;-- returns an array for a color transition from x to y

	; RGBRange by [VxE]

	oif := A_FormatInteger
	SetFormat, Integer, H

	dr:=(y>>16&255)-(r:=x>>16&255)
	dg:=(y>>8&255)-(g:=x>>8&255)
	db:=(y&255)-(b:=x&255)
	d := sqrt(dr**2 + dg**2 + db**2)
	v := Floor(d/c)

	IfLessOrEqual, c, 0, SetEnv, c, % d/( v := c<-3 ? -1-Ceil(c) : 2 )
			s := c/d

	cr:=sqrt(d**2-dg**2-db**2)*s*((dr>0)*2-1)
	cg:=sqrt(d**2-dr**2-db**2)*s*((dg>0)*2-1)
	cb:=sqrt(d**2-dg**2-dr**2)*s*((db>0)*2-1)

	Loop %v% {
		u := SubStr("000000" SubStr( "" . ((Round(r+cr*A_Index)&255)<<16) | ((Round(g+cg*A_Index)&255)<<8) | (Round(b+cb*A_Index)&255), 3) ,-5)
		StringUpper, u, u
		x .= delim "0x" u
	}

	SetFormat, Integer, %oif%
	return x
}

getSelectionCoords(ByRef x_start, ByRef x_end, ByRef y_start, ByRef y_end) {			;-- creates a click-and-drag selection box to specify an area

	/*			EXAMPLE

				;hotkey to activate OCR
				!q:: ;press ALT Q
				getSelectionCoords(x_start, x_end, y_start, y_end)
				MsgBox, In area :: x_start: %x_start%, y_start: %y_start% --> x_end: %x_end%, y_end: %y_end%
				return

			Esc:: ExitApp

	*/

	;Mask Screen
	Gui, Color, FFFFFF
	Gui +LastFound
	WinSet, Transparent, 50
	Gui, -Caption
	Gui, +AlwaysOnTop
	Gui, Show, x0 y0 h%A_ScreenHeight% w%A_ScreenWidth%,"AutoHotkeySnapshotApp"

	;Drag Mouse
	CoordMode, Mouse, Screen
	CoordMode, Tooltip, Screen
	WinGet, hw_frame_m,ID,"AutoHotkeySnapshotApp"
	hdc_frame_m := DllCall( "GetDC", "uint", hw_frame_m)
	KeyWait, LButton, D
	MouseGetPos, scan_x_start, scan_y_start
	Loop
	{
		Sleep, 10
		KeyIsDown := GetKeyState("LButton")
		if (KeyIsDown = 1)
		{
			MouseGetPos, scan_x, scan_y
			DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", 0,"int",0,"int", A_ScreenWidth,"int",A_ScreenWidth)
			DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", scan_x_start,"int",scan_y_start,"int", scan_x,"int",scan_y)
		} else {
			break
		}
	}

	;KeyWait, LButton, U
	MouseGetPos, scan_x_end, scan_y_end
	Gui Destroy

	if (scan_x_start < scan_x_end)
	{
		x_start := scan_x_start
		x_end := scan_x_end
	} else {
		x_start := scan_x_end
		x_end := scan_x_start
	}

	if (scan_y_start < scan_y_end)
	{
		y_start := scan_y_start
		y_end := scan_y_end
	} else {
		y_start := scan_y_end
		y_end := scan_y_start
	}

}

FloodFill(x, y, target, replacement, mode=1, key="") {										;-- filling an area using color banks

	;function is from https://rosettacode.org/wiki/Bitmap/Flood_fill#AutoHotkey

	/*				Example

		SetBatchLines, -1
		CoordMode, Mouse
		CoordMode, Pixel
		CapsLock::
		KeyWait, CapsLock
		MouseGetPos, X, Y
		PixelGetColor, color, X, Y
		FloodFill(x, y, color, 0x000000, 1, "CapsLock")
		MsgBox Done!
		Return

	*/

   If GetKeyState(key, "P")
      Return
   PixelGetColor, color, x, y
   If (color <> target || color = replacement || target = replacement)
      Return
   VarSetCapacity(Rect, 16, 0)
   NumPut(x, Rect, 0)
   NumPut(y, Rect, 4)
   NumPut(x+1, Rect, 8)
   NumPut(y+1, Rect, 12)
   hDC := DllCall("GetDC", UInt, 0)
   hBrush := DllCall("CreateSolidBrush", UInt, replacement)
   DllCall("FillRect", UInt, hDC, Str, Rect, UInt, hBrush)
   DllCall("ReleaseDC", UInt, 0, UInt, hDC)
   DllCall("DeleteObject", UInt, hBrush)
   FloodFill(x+1, y, target, replacement, mode, key)
   FloodFill(x-1, y, target, replacement, mode, key)
   FloodFill(x, y+1, target, replacement, mode, key)
   FloodFill(x, y-1, target, replacement, mode, key)
   If (mode = 2 || mode = 4)
      FloodFill(x, y, target, replacement, mode, key)
   If (Mode = 3 || mode = 4)
   {
      FloodFill(x+1, y+1, target, replacement, key)
      FloodFill(x-1, y+1, target, replacement, key)
      FloodFill(x+1, y-1, target, replacement, key)
      FloodFill(x-1, y-1, target, replacement, key)
   }
}

CreateBMPGradient(File, RGB1, RGB2, Vertical=1) {											;-- Horizontal/Vertical gradient

	; SKAN: http://www.autohotkey.com/forum/viewtopic.php?p=61081#61081

	; Left/Bottom -> Right/Top color, File is overwritten
	   If Vertical
		 H:="424d3e000000000000003600000028000000010000000200000001001800000000000800000000000000000000000000000000000000"
		   . BGR(RGB1) "00" BGR(RGB2) "00"
	   Else
		 H:="424d3e000000000000003600000028000000020000000100000001001800000000000800000000000000000000000000000000000000"
		   . BGR(RGB1) BGR(RGB2) "0000"

	   Handle:= DllCall("CreateFile",Str,file,Uint,0x40000000,Uint,0,UInt,0,UInt,4,Uint,0,UInt,0)

	   Loop 62 {
		 Hex := "0x" SubStr(H,2*A_Index-1,2)
		 DllCall("WriteFile", UInt,Handle, UCharP,Hex, UInt,1, UInt,0, UInt,0)
		}

	   DllCall("CloseHandle", "Uint", Handle)

}
;{depending function
BGR(RGB) {																										;-- BGR() subfunction from CreateBMPGradient()

	RGB = 00000%RGB%
		Return SubStr(RGB,-1) . SubStr(RGB,-3,2) . SubStr(RGB,-5,2)

}
;}



;}
; LoadPicture()					|	GetImageDimensionProperty|	GetImageDimensions()			|	Gdip_FillRoundedRectangle()	|	Redraw(hwnd=0)				|
; CreateSurface()				|	ShowSurface()					|	HideSurface()						|	WipeSurface()						|	StartDraw()						|
; EndDraw()						|	SetPen()							|	DrawLine()							|	SDrawRectangle()					|	SetAlpha()						|
; DrawRectangle()				|	Highlight()						|	Screenshot()							|	TakeScreenshot()					|	CaptureWindow()				|
; DrawFrameAroundControl	|	CircularText()					|	RotateAroundCenter()				|	RGBRange()							|	getSelectionCoords()			|
; FloodFill()						|	CreateBMPGradient()			|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{GUI FUNCTIONS SECTION (120)

    ;{Gui - Customizable full gui functions, custom gui elements

HtmlBox(Html, Title="", Timeout=0, Permanent=False,										;-- Gui with ActiveX - Internet Explorer - Control
GUIOptions="Resize MaximizeBox Minsize420x320",
ControlOptions="W400 H300", Margin=10, Hotkey=True) {

    ;AutoHotkey_L 1.1.04+
    ;Timeout : The seconds to make the HTML window disappear.
    ;Permanent : if this is True, closing the GUI window does not destroy it but it is hidden.
    ;Return Value: the handle of the created window(Hwnd).

    static HtmlBoxInfo := [], WindowHideStack := [] , WB , ExecCmd := { a : "selectall", c : "copy",  p : "print", v : "paste" }
    Gui, New, LabelHtmlBox HWNDHwndHtml %GUIOptions%, % Title     ;v1.1.04+
    Gui, Margin, %Margin%, %Margin%
    Gui, Add, ActiveX, vWB HwndHwndHtmlControl %ControlOptions%, Shell.Explorer    ;v1.1.03+
    WB.silent := true
    WB.Navigate("about:blank")
    Loop
       Sleep 10
    Until   (WB.readyState=4 && WB.document.readyState="complete" && !WB.busy)
    WB.document.write(html)
    Gui, Show
    If Timeout {
        ExecuteTime := A_TickCount + Timeout * 1000
        loop % (WindowHideStack.MaxIndex() ? WindowHideStack.MaxIndex() + 1 : 1) {
            if (!(WindowHideStack[A_Index].ExecuteTime) && (A_Index = 1)) || (WindowHideStack[A_Index].ExecuteTime > ExecuteTime) {
                Inserted := True, WindowHideStack.Insert(A_Index, { ExecuteTime: ExecuteTime, Hwnd : HwndHtml })    ;increment the rest
                if (A_Index = 1)
                    SetTimer, HtmlBoxClose, % Timeout * -1 * 1000
            }
        } Until (Inserted)
        if !Inserted
            WindowHideStack.Insert({ ExecuteTime: ExecuteTime, Hwnd : HwndHtml })    ;insert it at the very end
    }
    HtmlBoxInfo[HwndHtml] := { HwndWindow : HwndHtml, Margin : Margin, HwndHtmlControl : HwndHtmlControl, Permanent: Permanent, doc : WB.document }
    If Hotkey {
        Hotkey, IfWinActive, ahk_id %HwndHtml%
        For key in ExecCmd
            Hotkey, ^%key%, HtmlBoxExecCommand
        Hotkey, IfWinActive
    }
Return HwndHtml
    HtmlBoxSize:
        If (A_EventInfo = 1)  ; The window has been minimized.  No action needed.
            Return
        GuiControl, Move, % HtmlBoxInfo[Trim(A_GUI)].HwndHtmlControl
                  , % "H" (A_GuiHeight - HtmlBoxInfo[A_GUI].margin * 2) " W" ( A_GuiWidth - HtmlBoxInfo[A_GUI].margin * 2)
    Return
    HtmlBoxEscape:
    HtmlBoxClose:
        if (_HwndHtml := WindowHideStack[WindowHideStack.MinIndex()].Hwnd)  {     ;this means it's called from the timer, so the least index is removed
            WindowHideStack.Remove(WindowHideStack.MinIndex())
            if (NextTimer := WindowHideStack[WindowHideStack.MinIndex()].ExecuteTime)        ;this means a next timer exists
                SetTimer,, % A_TickCount - NextTimer < 0 ? A_TickCount - NextTimer : -1        ;v1.1.01+
        } else
            _HwndHtml := HtmlBoxInfo[A_GUI].HwndWindow
        DHW := A_DetectHiddenWindows
        DetectHiddenWindows, ON
        if WinExist("ahk_id " _HwndHtml) {        ;in case timeout is set and the user closes before the timeout
            if !HtmlBoxInfo[_HwndHtml].Permanent {
                Gui, %_HwndHtml%:Destroy
                WB := ""
                HtmlBoxInfo.Remove(_HwndHtml, "")
            } else
                Gui, %_HwndHtml%:Hide
        }
        DetectHiddenWindows, % DHW
    Return
    HtmlBoxExecCommand:        ;this is called when the user presses one of the hotkeys
        HtmlBoxInfo[WinExist("A")].doc.ExecCommand(ExecCmd[SubStr(A_ThisHotkey, 2)])
    Return
}

EditBox(Text, Title="", Timeout=0, Permanent=False, 											;-- Displays an edit box with the given text, tile, and options
GUIOptions="Resize MaximizeBox Minsize420x320",
ControlOptions="VScroll W400 H300", Margin=10) {

    ;AutoHotkey_L 1.1.04+
    ;Timeout : The seconds to make the edit window disappear.
    ;Permanent : if this is True, closing the GUI window does not destroy it but it is hidden.
    ;Return Value: the handle of the created window(Hwnd).

	/*											Description

		Displays an edit box with the given text, tile, and options.

		Requirements
		AutoHotkey_L 1.1.04 or later.  Tested on: Windows 7 64bit, AutoHotkey 32bit Unicode 1.1.05.01.

		License
		Public Domain.

		Format
		EditBox(Text, Title="", Timeout=0, Permanent=False, GUIOptions="Resize MaximizeBox Minsize420x320", ControlOptions="VScroll W400 H300", Margin=10)
		Parameters
		Text : 					the text strings to display in the edit box.
		Title : 					the title for the GUI window.
		Timeout : 				if specified, the edit box will disappear in the given seconds.
		Permanent : 			if this is TRUE, closing the window does not destroy the window but hide it. So it can be displayed again with the window handle.
		GUIOptions : 		the options for the Edit box GUI window.
		ControlOptions : 	the options for the Edit control.
		Margin : 				the margin in pixels between the window borders and the control.

		Return Value
		The window handle (hwnd) of the created GUI window.

		Remarks
		No global variables are used. However, it uses these label names: EditBoxClose, EditBoxEscape, EditBoxResize. So the script should avoid using the label names.

	*/

	/*												Example

				Text =
		(
			Copyright 2011 A_Samurai. All rights reserved.

			Redistribution and use in source and binary forms, with or without modification, are
			permitted provided that the following conditions are met:

			   1. Redistributions of source code must retain the above copyright notice, this list of
				  conditions and the following disclaimer.

			   2. Redistributions in binary form must reproduce the above copyright notice, this list
				  of conditions and the following disclaimer in the documentation and/or other materials
				  provided with the distribution.

			THIS SOFTWARE IS PROVIDED BY A_Samurai ''AS IS'' AND ANY EXPRESS OR IMPLIED
			WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
			FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL A_Samurai OR
			CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
			CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
			SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
			ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
			NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
			ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

			The views and conclusions contained in the software and documentation are those of the
			authors and should not be interpreted as representing official policies, either expressed
			or implied, of A_Samurai.
		)
		EditBox(Text, "Free BSD Licence")

	*/


    Static EditBoxInfo := [], WindowHideStack := []
    Gui, New, LabelEditBox HWNDHwndEdit %GUIOptions%, % Title     ;v1.1.04+
    Gui, Margin, %Margin%, %Margin%
    Gui, Add, Edit, HwndHwndEditControl %ControlOptions%, % Text
    ControlFocus,, ahk_id %HwndEditControl%
    Gui, Show
    If Timeout {
        WindowHideStack[A_TickCount + Timeout * 1000] := HwndEdit
        SetTimer, EditBoxClose, % Timeout * -1 * 1000
    }
    EditBoxInfo[HwndEdit] := { HwndWindow : HwndEdit, Margin : Margin, HwndEditControl : HwndEditControl }
Return HwndEdit

    EditBoxSize:
        If (A_EventInfo = 1)  ; The window has been minimized.  No action needed.
            Return
        GuiControl, Move, % EditBoxInfo[Trim(A_GUI)].HwndEditControl
                  , % "H" (A_GuiHeight - EditBoxInfo[A_GUI].margin * 2) " W" ( A_GuiWidth - EditBoxInfo[A_GUI].margin * 2)
    Return
    EditBoxEscape:
    EditBoxClose:
        if (HwndEdit := WindowHideStack.Remove(WindowHideStack.MinIndex(), "")) { ;this means it's called from the timer, so the least index is removed
            if (NextTimer := WindowHideStack.MinIndex())        ;this means a next timer exists
                SetTimer,, % A_TickCount - NextTimer < 0 ? A_TickCount - NextTimer : -1        ;v1.1.01+
        } else
            HwndEdit := EditBoxInfo[A_GUI].HwndWindow
        if !Permanent {
            Gui, %HwndEdit%:Destroy
            EditBoxInfo.Remove(HwndEdit, "")
        } else
            Gui, %HwndEdit%:Hide
    Return
}

Popup(title, action, close=true, image="", w=197, h=46) {									;-- Splashtext Gui

    SysGet, Screen, MonitorWorkArea
    ScreenRight-=w+3
    ScreenBottom-=h+4
    SplashImage,%image%,CWe0dfe3 b1 x%ScreenRight% y%ScreenBottom% w%w% h%h% C00 FM8 FS8, %action%,%title%,Popup
    WinSet, Transparent, 216, Popup
    if close
        SetTimer, ClosePopup, -2000
    return
}
ClosePopup: ;{
    WinGet,WinID,ID,Popup
    MouseGetPos,,,MouseWinID
    ifEqual,WinID,%MouseWinID%
    {
        SetTimer, ClosePopup, -2000
    }else{
        SplashImage, Off
    }
    return

;}

PIC_GDI_GUI(GuiName, byref File, GDIx, GDIy , GDIw, GDIh) { 						;-- a GDI-gui to show a picture

				global GGhdc
			If !pToken := Gdip_Startup() {
			   MsgBox, 0x40048, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
			   ExitApp
			}
			; Create a layered window (+E0x80000 : must be used for UpdateLayeredWindow to work!) that is always on top (+AlwaysOnTop), has no taskbar entry or caption
			Gui, %GuiName%:-Caption +E0x80000 +LastFound +AlwaysOnTop
			Gui, %GuiName%:+Owner
			Gui, %GuiName%: Show, Center ; x%GDIx% y%GDIy%

			hwnd1 := WinExist()

			pBitmap1 := Gdip_CreateBitmapFromFile(file)
			; Check to ensure we actually got a bitmap from the file, in case the file was corrupt or some other error occured
			If (!pBitmap1) {
				MsgBox, 0x40048, File loading error!, Could not load '%file%'
				ExitApp
			}
			;Load picture to pBitmap
			IWidth := Gdip_GetImageWidth(pBitmap1), IHeight := Gdip_GetImageHeight(pBitmap1)
			hbm := CreateDIBSection(GDIw, GDIh)
			GGhdc := CreateCompatibleDC()
			obm := SelectObject(GGhdc, hbm)
			G1 := Gdip_GraphicsFromHDC(GGhdc)
			Gdip_SetInterpolationMode(G, 7)
			Gdip_DrawImage(G1, pBitmap1, 0, 0, GDIw, GDIh, 0, 0, GDIw, GDIh)
			UpdateLayeredWindow(hwnd1, GGhdc, GDIx, GDIy, GDIw, GDIh)

			SelectObject(hdc, obm)
			DeleteObject(hbm)
			DeleteDC(hdc)
			Gdip_DeleteGraphics(G1)

return [hwnd1, GGhdc]
}

SplitButton(hButton, GlyphSize=16, Menu="", hDontUse="") {								;--	drop down button

	;https://autohotkey.com/boards/viewtopic.php?t=22830
	/*						DESCRIPTION

		SplitButton ( hButton [, GlyphSize, MenuName ] )
		- hButton = hWnd of button to turn into SplitButton
		- GlyphSize = size of down arrow glyph (default: 16)
		- MenuName = name of menu to call when clicked (default: SplitButton_Menu)

		Issues/Requirements:
		- statically saved hwnd of button from first call needs turned into array... for now only one button can be a SplitButton
		- will conflict with other code using WM_Notify OnMessage()
		- missing features from API for glyph size, imagelist, styles, etc...
		- Requires Vista+, unsupported on XP

		;;parameters need to be expanded to cover these options:
		;;BUTTON_SPLITINFO struct 	 	;INFO mask flags        				;STYLE flags
		;;  UINT       mask;        				;BCSIF_GLYPH 	:= 0x0001  		;BCSS_NOSPLIT         := 0x0001
		;;  HIMAGELIST himlGlyph;  		;BCSIF_IMAGE 	:= 0x0002  		;BCSS_STRETCH        	:= 0x0002
		;;  UINT       uSplitStyle; 			;BCSIF_STYLE 	:= 0x0004  		;BCSS_ALIGNLEFT		:= 0x0004
		;;  SIZE       size;        				;BCSIF_SIZE  		:= 0x0008  		;BCSS_IMAGE           	:= 0x0008

	*/

	/*					  SIMPLE EXAMPLE more Example see forum link

		Menu, SplitButton_Menu, Add, First Item, DoNothing
		Menu, SplitButton_Menu, Add, Second Item, DoNothing
		Gui, Add, Button, w160 h80 hwndhButton, Button
		SplitButton(hButton)
		Gui, Show
		DoNothing:
		Return

	*/


	Static     _ := OnMessage(0x4E, "SplitButton") ;WM_NOTIFY
	Static Menu_ := "SplitButton_Menu"
	Static hButton_


	If (Menu=0x4E) {

			hCtrl := NumGet(GlyphSize+0, 0, "Ptr") ;-> lParam -> NMHDR -> hCtrl

			If (hCtrl = hButton_) { ;BCN_DROPDOWN for SplitButton

				id := NumGet(GlyphSize+0, A_PtrSize * 2, "uInt")
				If (id = 0xFFFFFB20) {
					ControlGetPos, cX, cY, cW, cH,, ahk_id %hButton_%
					Menu, %Menu_%, Show, % cX+1, % cY + cH
					}
			}
	 } Else {

			If (Menu <> "")
				Menu_ := Menu

			hButton_ := hButton
			Winset,   Style, +0x0C, ahk_id %hButton%          ;BS_SPLITBUTTON
			VarSetCapacity(   pBUTTON_SPLITINFO,  40, 0)
			NumPut(8,         pBUTTON_SPLITINFO,   0, "Int")  ;set glyph size
			NumPut(GlyphSize, pBUTTON_SPLITINFO,  4 + A_PtrSize * 2, "Int")
			SendMessage, BCM_SETSPLITINFO := 0x1607, 0, &pBUTTON_SPLITINFO, , ahk_id %hButton%
			Return

	}

}

AddToolTip(con, text, Modify=0) {																		;--	adds a ToolTip to a gui button

	/*	Source: https://gist.github.com/andreberg/55d003569f0564cd8695
		Usage example:
		Gui,Add,Button,hwndbutton1 Gbut1,Test Button 1
		AddTooltip(button1,"Press me to change my tooltip")
	*/

    Static TThwnd, GuiHwnd
    TInfo =
    UInt := "UInt"
    Ptr := (A_PtrSize ? "Ptr" : UInt)
    PtrSize := (A_PtrSize ? A_PtrSize : 4)
    Str := "Str"
    ; defines from Windows MFC commctrl.h
    WM_USER := 0x400
    TTM_ADDTOOL := (A_IsUnicode ? WM_USER+50 : WM_USER+4)           ; used to add a tool, and assign it to a control
    TTM_UPDATETIPTEXT := (A_IsUnicode ? WM_USER+57 : WM_USER+12)    ; used to adjust the text of a tip
    TTM_SETMAXTIPWIDTH := WM_USER+24                                ; allows the use of multiline tooltips
    TTF_IDISHWND := 1
    TTF_CENTERTIP := 2
    TTF_RTLREADING := 4
    TTF_SUBCLASS := 16
    TTF_TRACK := 0x0020
    TTF_ABSOLUTE := 0x0080
    TTF_TRANSPARENT := 0x0100
    TTF_PARSELINKS := 0x1000
    If (!TThwnd) {
        Gui, +LastFound
        GuiHwnd := WinExist()
        TThwnd := DllCall("CreateWindowEx"
                    ,UInt,0
                    ,Str,"tooltips_class32"
                    ,UInt,0
                    ,UInt,2147483648
                    ,UInt,-2147483648
                    ,UInt,-2147483648
                    ,UInt,-2147483648
                    ,UInt,-2147483648
                    ,UInt,GuiHwnd
                    ,UInt,0
                    ,UInt,0
                    ,UInt,0)
    }
    ;~ DllCall("uxtheme\SetWindowTheme","Uint",TThwnd,Ptr,0,"UintP",0)	; TTM_SETWINDOWTHEME
    ; for TOOLINFO structure see http://msdn.microsoft.com/en-us/library/windows/desktop/bb760256%28v=vs.85%29.aspx
    ;   cbSize, UINT, 4
    ;   uFlags, UINT, 4
    ;   hwnd, HWND = PVOID, PtrSize
    ;   uId, UINT64_PTR, PtrSize
    ;   rect, RECT = {LONG, LONG, LONG, LONG}, 4*4=16
    ;   hinst, HINSTANCE = PVOID, PtrSize
    ;   lpszText, LPTSTR, LONG_PTR, PtrSize
    ;   lParam, LONG_PTR, PtrSize
    ;   lpReserved, LONG_PTR, PtrSize
    cbSize := 6*4+6*PtrSize
    uFlags := TTF_IDISHWND|TTF_SUBCLASS|TTF_PARSELINKS
    VarSetCapacity(TInfo, cbSize, 0)
    NumPut(cbSize, TInfo)
    NumPut(uFlags, TInfo, 4)
    NumPut(GuiHwnd, TInfo, 8)
    NumPut(con, TInfo, 8+PtrSize)
    NumPut(&text, TInfo, 6*4+3*PtrSize)
    NumPut(0,TInfo, 6*4+6*PtrSize)
    DetectHiddenWindows, On
    If (!Modify) {
        DllCall("SendMessage"
            ,Ptr,TThwnd
            ,UInt,TTM_ADDTOOL
            ,Ptr,0
            ,Ptr,&TInfo
            ,Ptr)
        DllCall("SendMessage"
            ,Ptr,TThwnd
            ,UInt,TTM_SETMAXTIPWIDTH
            ,Ptr,0
            ,Ptr,A_ScreenWidth)
    }
    DllCall("SendMessage"
        ,Ptr,TThwnd
        ,UInt,TTM_UPDATETIPTEXT
        ,Ptr,0
        ,Ptr,&TInfo
        ,Ptr)

}

BetterBox(Title := "", Prompt := "", Default := "", Pos := -1) {								;--	custom input box allows to choose the position of the text insertion point

	;-------------------------------------------------------------------------------
    ; custom input box allows to choose the position of the text insertion point
    ; return the entered text
    ;
    ; Title is the title for the GUI
    ; Prompt is the text to display
    ; Default is the text initially shown in the edit control
    ; Pos is the position of the text insertion point
    ;   Pos =  0  => at the start of the string
    ;   Pos =  1  => after the first character of the string
    ;   Pos = -1  => at the end of the string
    ;---------------------------------------------------------------------------

    static Result ; used as a GUI control variable

    ; create GUI
    Gui, BetterBox: New, +LastFound, %Title%
    Gui, -MinimizeBox
    Gui, Margin, 30, 18
    Gui, Add, Text,, %Prompt%
    Gui, Add, Edit, w290 vResult, %Default%
    Gui, Add, Button, x80 w80 Default, &OK
    Gui, Add, Button, x+m wp, &Cancel

    ; main loop
    Gui, Show
    SendMessage, 0xB1, %Pos%, %Pos%, Edit1, A ; EM_SETSEL
    WinWaitClose
    Return, Result


    ;-----------------------------------
    ; event handlers
    ;-----------------------------------
    BetterBoxButtonOK: ; "OK" button
        Gui, Submit ; get Result from GUI
        Gui, Destroy
    Return

    BetterBoxButtonCancel: ; "Cancel" button
    BetterBoxGuiClose:     ; {Alt+F4} pressed, [X] clicked
    BetterBoxGuiEscape:    ; {Esc} pressed
        Result := "BetterBoxCancel"
        Gui, Destroy
    Return
}

BtnBox(Title := "", Prompt := "", List := "", Seconds := "") {									;--	show a custom MsgBox with arbitrarily named buttons
;-------------------------------------------------------------------------------
    ; show a custom MsgBox with arbitrarily named buttons
    ; return the text of the button pressed
    ;
    ; Title is the title for the GUI
    ; Prompt is the text to display
    ; List is a pipe delimited list of captions for the buttons
    ; Seconds is the time in seconds to wait before timing out
    ;---------------------------------------------------------------------------

    ; create GUI
    Gui, BtnBox: New, +LastFound, %Title%
    Gui, -MinimizeBox
    Gui, Margin, 30, 18
    Gui, Add, Text,, %Prompt%
    Loop, Parse, List, |
        Gui, Add, Button, % (A_Index = 1 ? "" : "x+10") " gBtn", %A_LoopField%

    ; main loop
    Gui, Show
    WinWaitClose,,, %Seconds%
    If (ErrorLevel = 1) {
        Result := "TimeOut"
        Gui, Destroy
    }
    Return, Result


    ;-----------------------------------
    ; event handlers
    ;-----------------------------------
    Btn: ; all the buttons come here
        Result := A_GuiControl
        Gui, Destroy
    Return

    BtnBoxGuiClose: ; {Alt+F4} pressed, [X] clicked
        Result := "WinClose"
        Gui, Destroy
    Return

    BtnBoxGuiEscape: ; {Esc} pressed
        Result := "EscapeKey"
        Gui, Destroy
    Return
}

LoginBox(Title := "") {																						;-- show a custom input box for credentials, return an object with Username and Password
	;-------------------------------------------------------------------------------
    ; show a custom input box for credentials
    ; return an object with Username and Password
    ;
    ; Title is the title for the GUI
    ;---------------------------------------------------------------------------

    static Name, Pass ; used as a GUI control variables

    ; create GUI
    Gui, LoginBox: New, +LastFound, %Title%
    Gui, -MinimizeBox
    Gui, Margin, 30, 18
    Gui, Add, Text, ym+4 w55, Username:
    Gui, Add, Edit, x+10 yp-4 w100 vName
    Gui, Add, Text, xm y+10 w55, Password:
    Gui, Add, Edit, x+10 yp-4 w100 vPass Password
    Gui, Add, Button, w80 Default, &OK

    ; main loop
    Gui, Show
    WinWaitClose
    Return, Result


    ;-----------------------------------
    ; event handlers
    ;-----------------------------------
    LoginBoxButtonOK:  ; "OK" button, {Enter} pressed
        Gui, Submit
        Result := {Username: Name, Password: Pass}
        Gui, Destroy
    Return

    LoginBoxGuiClose:  ; {Alt+F4} pressed, [X] clicked
        Result := "WinClose"
        Gui, Destroy
    Return

    LoginBoxGuiEscape: ; {Esc} pressed
        Result := "EscapeKey"
        Gui, Destroy
    Return
}

MultiBox(Title := "", Prompt := "", Default := "") {												;-- show a multi-line input box, return the entered text

;-------------------------------------------------------------------------------
    ; show a multi-line input box
    ; return the entered text
    ;
    ; Title is the title for the GUI
    ; Prompt is the text to display
    ; Default is shown in the edit control
    ;---------------------------------------------------------------------------

    static Result ; used as a GUI control variable

    ; create GUI
    Gui, MultiBox: New, +LastFound, %Title%
    Gui, -MinimizeBox
    Gui, Margin, 30, 18
    Gui, Add, Text,, %Prompt%
    Gui, Add, Edit, w640 r10 vResult, %Default%
    Gui, Add, Button, w80 Default, &OK
    Gui, Add, Button, x+m wp, &Cancel

    ; main loop
    Gui, Show
    SendMessage, 0xB1, -1,, Edit1, A ; EM_SETSEL
    WinWaitClose
    Return, Result


    ;-----------------------------------
    ; event handlers
    ;-----------------------------------
    MultiBoxButtonOK: ; "OK" button, {Enter} pressed
        Gui, Submit ; get Result from GUI
        Gui, Destroy
    Return

    MultiBoxButtonCancel: ; "Cancel" button
    MultiBoxGuiClose:     ; {Alt+F4} pressed, [X] clicked
    MultiBoxGuiEscape:    ; {Esc} pressed
        Result := "MultiBoxCancel"
        Gui, Destroy
    Return
}

PassBox(Title := "", Prompt := "") {																		;-- show a custom input box for a password

	;-------------------------------------------------------------------------------
    ; show a custom input box for a password
    ; return the entered password
    ;
    ; Title is the title for the GUI
    ; Prompt is the text to display
    ;---------------------------------------------------------------------------

    static Result ; used as a GUI control variables

    ; create GUI
    Gui, PassBox: New, +LastFound, %Title%
    Gui, -MinimizeBox
    Gui, Margin, 30, 18
    Gui, Add, Text,, %Prompt%
    Gui, Add, Edit, w100 vResult Password
    Gui, Add, Button, w80 Default, &OK

    ; main loop
    Gui, Show
    WinWaitClose
    Return, Result


    ;-----------------------------------
    ; event handlers
    ;-----------------------------------
    PassBoxButtonOK: ; "OK" button, {Enter} pressed
        Gui, Submit ; get Result from GUI
        Gui, Destroy
    Return

    PassBoxGuiClose: ; {Alt+F4} pressed, [X] clicked
        Result := "WinClose"
        Gui, Destroy
    Return

    PassBoxGuiEscape: ; {Esc} pressed
        Result := "EscapeKey"
        Gui, Destroy
    Return
}

CreateHotkeyWindow(key) {      	 																		;-- Hotkey Window

	/*											Example

		#7::
		CreateWindow(Win + 7)
		return

	*/

	GetTextSize(key,35,Verdana,height,width)
	bgTopPadding = 40
	bgWidthPadding = 100
	bgHeight = % height + bgTopPadding
	bgWidth = % width + bgWidthPadding
	padding = 20
	yPlacement = % A_ScreenHeight ֠bgHeight ֠padding
	xPlacement = % A_ScreenWidth ֠bgWidth ֠padding

	Gui, Color, 46bfec
	Gui, Margin, 0, 0
	Gui, Add, Picture, x0 y0 w%bgWidth% h%bgHeight%, C:\Users\IrisDaniela\Pictures\bg.png
	Gui, +LastFound +AlwaysOnTop -Border -SysMenu +Owner -Caption +ToolWindow
	Gui, Font, s35 cWhite, Verdana
	Gui, Add, Text, xm y20 x25 ,%key%
	Gui, Show, x%xPlacement% y%yPlacement%
	SetTimer, RemoveGui, 5000

	return

	RemoveGui:
		Gui, Destroy
	return

}

;}

    ;{Gui - changing functions

FadeGui(guihwnd, fading_time, inout) {																;-- used DllCall to Animate (Fade in/out) a window

	AW_BLEND := 0x00080000
	AW_HIDE  := 0x00010000

	if inout	= "out"
		DllCall("user32\AnimateWindow", "ptr", guihwnd, "uint", fading_time, "uint", AW_BLEND|AW_HIDE)    ; Fade Out
	if inout = "in"
		DllCall("user32\AnimateWindow", "ptr", guihwnd, "uint", fading_time, "uint", AW_BLEND)    ; Fade In

return
}

ShadowBorder(handle) {																					;-- used DllCall to draw a shadow around a gui

    DllCall("user32.dll\SetClassLongPtr", "ptr", handle, "int", -26, "ptr", DllCall("user32.dll\GetClassLongPtr", "ptr", handle, "int", -26, "uptr") | 0x20000)

}

FrameShadow(handle) {																					;-- FrameShadow1
    DllCall("dwmapi.dll\DwmIsCompositionEnabled", "int*", DwmEnabled)
    if !(DwmEnabled)
        DllCall("user32.dll\SetClassLongPtr", "ptr", handle, "int", -26, "ptr", DllCall("user32.dll\GetClassLongPtr", "ptr", handle, "int", -26) | 0x20000)
    else {
        VarSetCapacity(MARGINS, 16, 0) && NumPut(1, NumPut(1, NumPut(1, NumPut(1, MARGINS, "int"), "int"), "int"), "int")
        DllCall("dwmapi.dll\DwmSetWindowAttribute", "ptr", handle, "uint", 2, "ptr*", 2, "uint", 4)
        DllCall("dwmapi.dll\DwmExtendFrameIntoClientArea", "ptr", handle, "ptr", &MARGINS)
    }
}

FrameShadow(HGui) {																						;-- FrameShadow(): Drop Shadow On Borderless Window, (DWM STYLE)

	;--https://autohotkey.com/boards/viewtopic.php?t=29117

	/*
	Gui, +HwndHGui -Caption - Example
	FrameShadow(HGui)
	Gui, Add, Button, x10 y130 w100 h30, Minimize
	Gui, Add, Button, x365 y130 w100 h30, Exit
	Gui, Add, GroupBox, x10 y10 w455 h110, GroupBox
	Gui, Add, Edit, x20 y30 w435 h80 +Multi, Edit
	Gui, Show, Center w475 h166, Frame Shadow Test
	*/

	DllCall("dwmapi\DwmIsCompositionEnabled","IntP",_ISENABLED) ; Get if DWM Manager is Enabled
	if !_ISENABLED ; if DWM is not enabled, Make Basic Shadow
		DllCall("SetClassLong","UInt",HGui,"Int",-26,"Int",DllCall("GetClassLong","UInt",HGui,"Int",-26)|0x20000)
	else {
		VarSetCapacity(_MARGINS,16)
		NumPut(1,&_MARGINS,0,"UInt")
		NumPut(1,&_MARGINS,4,"UInt")
		NumPut(1,&_MARGINS,8,"UInt")
		NumPut(1,&_MARGINS,12,"UInt")
		DllCall("dwmapi\DwmSetWindowAttribute", "Ptr", HGui, "UInt", 2, "Int*", 2, "UInt", 4)
		DllCall("dwmapi\DwmExtendFrameIntoClientArea", "Ptr", HGui, "Ptr", &_MARGINS)
	}
}

RemoveWindowFromTaskbar(WinTitle) {																;-- remove the active window from the taskbar by using COM

/*
      Example: Temporarily remove the active window from the taskbar by using COM.
      Methods in ITaskbarList's VTable:
        IUnknown:
          0 QueryInterface  -- use ComObjQuery instead
          1 AddRef          -- use ObjAddRef instead
          2 Release         -- use ObjRelease instead
        ITaskbarList:
          3 HrInit
          4 AddTab
          5 DeleteTab
          6 ActivateTab
          7 SetActiveAlt
    */
    IID_ITaskbarList  := "{56FDF342-FD6D-11d0-958A-006097C9A090}"
    CLSID_TaskbarList := "{56FDF344-FD6D-11d0-958A-006097C9A090}"

    ; Create the TaskbarList object and store its address in tbl.
    tbl := ComObjCreate(CLSID_TaskbarList, IID_ITaskbarList)

    activeHwnd := WinExist(WinTitle)

    DllCall(vtable(tbl,3), "ptr", tbl)                     ; tbl.HrInit()
    DllCall(vtable(tbl,5), "ptr", tbl, "ptr", activeHwnd)  ; tbl.DeleteTab(activeHwnd)
    Sleep 3000
    DllCall(vtable(tbl,4), "ptr", tbl, "ptr", activeHwnd)  ; tbl.AddTab(activeHwnd)

    ; Non-dispatch objects must always be manually freed.
    ObjRelease(tbl)
    return

}
;{ sub
vtable(ptr, n) {
    ; NumGet(ptr+0) returns the address of the object's virtual function
    ; table (vtable for short). The remainder of the expression retrieves
    ; the address of the nth function's address from the vtable.
    return NumGet(NumGet(ptr+0), n*A_PtrSize)
}
;}

ToggleTitleMenuBar(ahkid:=0, bHideTitle:=1, bHideMenuBar:=0) {					;-- show or hide Titlemenubar

    if ( ahkid = 0 ) ; must with () wrap
        WinGet, ahkid, ID, A
    ; ToolTip, % "AHKID is: " ahkid, 300, 300,
    if ( bHideTitle = 1 ) {
        WinSet, Style, ^0xC00000, ahk_id %ahkid%     ; titlebar toggle
    }
    if ( bHideMenuBar = 1 ) {
        WinSet, Style, ^0x40000, ahk_id %ahkid%      ; menubar toggle
    }

}

ToggleFakeFullscreen() {																					;-- sets styles to a window to look like a fullscreen

    CoordMode Screen, Window
    static WINDOW_STYLE_UNDECORATED := -0xC40000
    static savedInfo := Object() ;; Associative array!
    WinGet, id, ID, A

    if (savedInfo[id]) {
        inf := savedInfo[id]
        WinSet, Style, % inf["style"], ahk_id %id%
        WinMove, ahk_id %id%,, % inf["x"], % inf["y"], % inf["width"], % inf["height"]
        savedInfo[id] := ""
    } else {
        savedInfo[id] := inf := Object()
        WinGet, ltmp, Style, A
        inf["style"] := ltmp
        WinGetPos, ltmpX, ltmpY, ltmpWidth, ltmpHeight, ahk_id %id%
        inf["x"] := ltmpX
        inf["y"] := ltmpY
        inf["width"] := ltmpWidth
        inf["height"] := ltmpHeight
        WinSet, Style, %WINDOW_STYLE_UNDECORATED%, ahk_id %id%
        mon := GetMonitorActiveWindow()
        SysGet, mon, Monitor, %mon%
        WinMove, A,, %monLeft%, %monTop%, % monRight-monLeft, % monBottom-monTop
    }
    WinSet Redraw

}

CreateFont(nHeight, nWidth, nEscapement, nOrientation, fnWeight, 					;-- creates HFont for use with GDI
fdwItalic, fdwUnderline, fdwStrikeOut, fdwCharSet, fdwOutputPrecision,
fdwClipPrecision, fdwQuality, fdwPitchAndFamily, lpszFace) {

/*
HFONT CreateFont(
  int nHeight,               // height of font
  int nWidth,                // average character width
  int nEscapement,           // angle of escapement
  int nOrientation,          // base-line orientation angle
  int fnWeight,              // font weight
  DWORD fdwItalic,           // italic attribute option
  DWORD fdwUnderline,        // underline attribute option
  DWORD fdwStrikeOut,        // strikeout attribute option
  DWORD fdwCharSet,          // character set identifier
  DWORD fdwOutputPrecision,  // output precision
  DWORD fdwClipPrecision,    // clipping precision
  DWORD fdwQuality,          // output quality
  DWORD fdwPitchAndFamily,   // pitch and family
  LPCTSTR lpszFace           // typeface name
);
*/

	return DllCall("CreateFont"
				, "Int" , nHeight           , "Int" , nWidth          , "Int" , nEscapement
				, "Int" , nOrientation      , "Int" , fnWeight        , "UInt", fdwItalic
				, "UInt", fdwUnderline      , "UInt", fdwStrikeOut    , "UInt", fdwCharSet
				, "UInt", fdwOutputPrecision, "UInt", fdwClipPrecision, "UInt", fdwQuality
				, "UInt", fdwPitchAndFamily , "Str" , lpszFace)
}

FullScreenToggleUnderMouse(WT) {																	;-- toggles a window under the mouse to look like fullscreen

		DetectHiddenWindows, On
		MouseGetPos,,,WinUnderMouse
		WinGetTitle, WTm, %WinUnderMouse%
		WinSet, Style, ^0xC00000, ahk_id %WinUnderMouse%
		WinSet, AlwaysOnTop, Toggle, ahk_id %WinUnderMouse%
		PostMessage, 0x112, 0xF030,,, ahk_id %WinUnderMouse% ;WinMaximize
		;PostMessage, 0x112, 0xF120,,, Fenstertitel, Fenstertext 	;WinRestore
		WinGet, Style, Style, ahk_class Shell_TrayWnd
			If (Style & 0x10000000) {
				  WinShow ahk_class Shell_TrayWnd
				  WinShow Start ahk_class Button

			} Else {
				WinHide ahk_class Shell_TrayWnd
				  WinHide Start ahk_class Button
			}

}

SetTaskbarProgress(pct, state="", hwnd="") { 														;-- accesses Windows 7's ability to display a progress bar behind a taskbar button.

	; https://autohotkey.com/board/topic/46860-windows-7-settaskbarprogress/ - from Lexikos
	; edited version of Lexikos' SetTaskbarProgress() function to work with Unicode 64bit, Unicode 32bit, Ansi 32bit, and Basic/Classic (1.0.48.5)
	; SetTaskbarProgress  -  Requires Windows 7.
	;
	; pct    -  A number between 0 and 100 or a state value (see below).
	; state  -  "N" (normal), "P" (paused), "E" (error) or "I" (indeterminate).
	;           If omitted (and pct is a number), the state is not changed.
	; hwnd   -  The ID of the window which owns the taskbar button.
	;           If omitted, the Last Found Window is used.

	/*		EXAMPLE

		Gui, Font, s15
		Gui, Add, Text,, % "This GUI should show a progress bar on its taskbar button.`n"
						 . "It will demonstrate the four different progress states:`n"
						 . "(N)ormal, (P)aused, (E)rror and (I)ndeterminate."
		Gui, Show        ; Show the window and taskbar button.
		Gui, +LastFound  ; SetTaskbarProgress will use this window.
		Loop
		{
			progress_states=NPE
			Loop, Parse, progress_states
			{
				SetTaskbarProgress(0, A_LoopField)
				Loop 50 {
					SetTaskbarProgress(A_Index*2)
					Sleep 50
				}
				Sleep 1000
				Loop 50 {
					SetTaskbarProgress(100-A_Index*2)
					Sleep 50
				}
				SetTaskbarProgress(0)
				Sleep 1000
			}
			SetTaskbarProgress("I")
			Sleep 4000
		}
		GuiClose:
		GuiEscape:
		ExitApp
	*/

    static tbl, s0:=0, sI:=1, sN:=2, sE:=4, sP:=8
	 if !tbl
	  Try tbl := ComObjCreate("{56FDF344-FD6D-11d0-958A-006097C9A090}"
							, "{ea1afb91-9e28-4b86-90e9-9e9f8a5eefaf}")
	  Catch
	   Return 0
	 If hwnd =
	  hwnd := WinExist()
	 If pct is not number
	  state := pct, pct := ""
	 Else If (pct = 0 && state="")
	  state := 0, pct := ""
	 If state in 0,I,N,E,P
	  DllCall(NumGet(NumGet(tbl+0)+10*A_PtrSize), "uint", tbl, "uint", hwnd, "uint", s%state%)
	 If pct !=
	  DllCall(NumGet(NumGet(tbl+0)+9*A_PtrSize), "uint", tbl, "uint", hwnd, "int64", pct*10, "int64", 1000)
	Return 1

}

SetTaskbarProgress(State, hWnd := "") { 															;-- modified function

	;http://ahkscript.org/boards/viewtopic.php?p=48299#p48299 from Flipeador
	;SetTaskbarProgress( [0~100 | Normal, Paused, Indeterminate, Error], [Win ID] )

	/*					EXAMPLE

		Gui, Font, s15
		Gui, Add, Text,, % "------------------------------------------------------"
		Gui, Show
		Gui, +LastFound +HWND_G

		SetTaskbarProgress( 0, _G )
		Sleep 100
		Loop, 50 {
			SetTaskbarProgress( A_Index, _G )
			Sleep 50
		}
		Sleep 100
		SetTaskbarProgress( "Paused", _G )
		Sleep, 1000
		SetTaskbarProgress( "Normal", _G )
		Sleep, 1000
		Loop, 49 {
			SetTaskbarProgress( A_Index * 2, _G )
			Sleep 100
		}
		Sleep 100
		SetTaskbarProgress( "Error", _G )
		Sleep 1000
		SetTaskbarProgress( "Indeterminate", _G )
		Sleep 1000
		ExitApp
		Esc::ExitApp

	*/

	static ppv
	if !ppv
		DllCall("ole32.dll\OleInitialize", "PtrP", 0)
		, VarSetCapacity(CLSID, 16), VarSetCapacity(riid, 16)
		, DllCall("ole32.dll\CLSIDFromString", "Str", "{56FDF344-FD6D-11d0-958A-006097C9A090}", "Ptr", &CLSID)
		, DllCall("ole32.dll\CLSIDFromString", "Str", "{ea1afb91-9e28-4b86-90e9-9e9f8a5eefaf}", "Ptr", &riid)
		, DllCall("ole32.dll\CoCreateInstance", "Ptr", &CLSID, "Ptr", 0, "UInt", 21, "Ptr", &riid, "PtrP", ppv)
	hWnd := hWnd ? hWnd : IsWindow()
	s0 := 0, sI := sIndeterminate := 1, sN := sNormal := 2, sE := sError := 4, sP := sPaused := 8
	if InVar( State, "0,N,P,E,I,Normal,Paused,Error,Indeterminate" )
		return DllCall(NumGet(NumGet(ppv+0)+10*A_PtrSize), "Ptr", ppv, "Ptr", hWnd, "UInt", s%State%)
	return DllCall(NumGet(NumGet(ppv+0)+9*A_PtrSize), "Ptr", ppv, "Ptr", hWnd, "Int64", State * 10, "Int64", 1000)
}
;{ sub
;If [var] in [ .. ]
InVar(Haystack, Needle, Delimiter := ",", OmitChars := "") {
	Loop, Parse, % Needle, %Delimiter%, %OmitChars%
		if (A_LoopField = Haystack)
			return 1
	return 0
}

IsWindow(hWnd*) {
	if !hWnd.MaxIndex()
		return DllCall("User32.dll\GetForegroundWindow")
	return i := DllCall("User32.dll\IsWindow", "Ptr", hWnd[1] )
		, ErrorLevel := !i
}
;}

;}

	;{Gui - control type functions

		;{Edit and HEdit control functions

				;************************
				; Edit Control Functions
				;************************
				;
				; http://www.autohotkey.com/forum/topic22748.html
				;
				; Standard parameters:
				;   Control, WinTitle   If WinTitle is not specified, 'Control' may be the
				;                       unique ID (hwnd) of the control.  If "A" is specified
				;                       in Control, the control with input focus is used.
				;
				; Standard/default return value:
				;   true on success, otherwise false.

				Edit_Standard_Params(ByRef Control, ByRef WinTitle) {  								;-- these are helper functions to use with Edit or HEdit controls
					if (Control="A" && WinTitle="") { ; Control is "A", use focused control.
						ControlGetFocus, Control, A
						WinTitle = A
					} else if (Control+0!="" && WinTitle="") {  ; Control is numeric, assume its a ahk_id.
						WinTitle := "ahk_id " . Control
						Control =
					}
				}

				Edit_TextIsSelected(Control="", WinTitle="") {												;--
					; Returns true if text is selected, otherwise false.
				;
					Edit_Standard_Params(Control, WinTitle)
					return Edit_GetSelection(start, end, Control, WinTitle) and (start!=end)
				}

				Edit_GetSelection(ByRef start, ByRef end, Control="", WinTitle="") {				;--
					; Gets the start and end offset of the current selection.
				;
					Edit_Standard_Params(Control, WinTitle)
					VarSetCapacity(start, 4), VarSetCapacity(end, 4)
					SendMessage, 0xB0, &start, &end, %Control%, %WinTitle%  ; EM_GETSEL
					if (ErrorLevel="FAIL")
						return false
					start := NumGet(start), end := NumGet(end)
					return true
				}

				Edit_Select(start=0, end=-1, Control="", WinTitle="") {								;--
					; Selects text in a text box, given absolute character positions (starting at 0.)
					;
					; start:    Starting character offset, or -1 to deselect.
					; end:      Ending character offset, or -1 for "end of text."
					;

					Edit_Standard_Params(Control, WinTitle)
					SendMessage, 0xB1, start, end, %Control%, %WinTitle%  ; EM_SETSEL
					return (ErrorLevel != "FAIL")
				}

				Edit_SelectLine(line=0, include_newline=false, Control="", WinTitle="") {	;--
						; Selects a line of text.
					;
					; line:             One-based line number, or 0 to select the current line.
					; include_newline:  Whether to also select the line terminator (`r`n).
					;

					Edit_Standard_Params(Control, WinTitle)

					ControlGet, hwnd, Hwnd,, %Control%, %WinTitle%
					if (!WinExist("ahk_id " hwnd))
						return false

					if (line<1)
						ControlGet, line, CurrentLine

					SendMessage, 0xBB, line-1, 0  ; EM_LINEINDEX
					offset := ErrorLevel

					SendMessage, 0xC1, offset, 0  ; EM_LINELENGTH
					lineLen := ErrorLevel

					if (include_newline) {
						WinGetClass, class
						lineLen += (class="Edit") ? 2 : 1 ; `r`n : `n
					}

					; Select the line.
					SendMessage, 0xB1, offset, offset+lineLen  ; EM_SETSEL
					return (ErrorLevel != "FAIL")
				}

				Edit_DeleteLine(line=0, Control="", WinTitle="") {										;--
						; Deletes a line of text.
				;
				; line:     One-based line number, or 0 to delete current line.
				;

					Edit_Standard_Params(Control, WinTitle)
					; Select the line.
					if (Edit_SelectLine(line, true, Control, WinTitle))
					{   ; Delete it.
						ControlSend, %Control%, {Delete}, %WinTitle%
						return true
					}
					return false
				}

				Edit_VCenter(HEDIT) {																				;-- Vertically Align Text

					; by just me, http://ahkscript.org/boards/viewtopic.php?f=5&t=4673#p44099
					; the Edit control must have the ES_MULTILINE style (0x0004 \ +Multi)!
					; EM_GETRECT := 0x00B2 <- msdn.microsoft.com/en-us/library/bb761596(v=vs.85).aspx
					; EM_SETRECT := 0x00B3 <- msdn.microsoft.com/en-us/library/bb761657(v=vs.85).aspx

					VarSetCapacity(RC, 16, 0)
					DllCall("User32.dll\GetClientRect", "Ptr", HEDIT, "Ptr", &RC)
					CLHeight := NumGet(RC, 12, "Int")
					SendMessage, 0x0031, 0, 0, , ahk_id %HEDIT% ; WM_GETFONT
					HFONT := ErrorLevel
					HDC := DllCall("GetDC", "Ptr", HEDIT, "UPtr")
					DllCall("SelectObject", "Ptr", HDC, "Ptr", HFONT)
					VarSetCapacity(RC, 16, 0)
					DTH := DllCall("DrawText", "Ptr", HDC, "Str", "W", "Int", 1, "Ptr", &RC, "UInt", 0x2400)
					DllCall("ReleaseDC", "Ptr", HEDIT, "Ptr", HDC)
					SendMessage, 0x00BA, 0, 0, , ahk_id %HEDIT% ; EM_GETLINECOUNT
					TXHeight := DTH * ErrorLevel
					If (TXHeight > CLHeight)
							Return False
					VarSetCapacity(RC, 16, 0)
					SendMessage, 0x00B2, 0, &RC, , ahk_id %HEDIT%
					DY := (CLHeight - TXHeight) // 2
					NumPut(DY, RC, 4, "Int")
					NumPut(TXHeight + DY, RC, 12, "Int")
					SendMessage, 0x00B3, 0, &RC, , ahk_id %HEDIT%

				}

		;}

		;{ImageList control type functions

IL_LoadIcon(FullFilePath, IconNumber := 1, LargeIcon := 1) {									;--
	HIL := IL_Create(1, 1, !!LargeIcon)
	IL_Add(HIL, FullFilePath, IconNumber)
	HICON := DllCall("Comctl32.dll\ImageList_GetIcon", "Ptr", HIL, "Int", 0, "UInt", 0, "UPtr")
	IL_Destroy(HIL)
	return HICON
}

IL_GuiButtonIcon(Handle, File, Index := 1, Options := "") {											;--

	RegExMatch(Options, "i)w\K\d+", W), (W="") ? W := 16 :
	RegExMatch(Options, "i)h\K\d+", H), (H="") ? H := 16 :
	RegExMatch(Options, "i)s\K\d+", S), S ? W := H := S :
	RegExMatch(Options, "i)l\K\d+", L), (L="") ? L := 0 :
	RegExMatch(Options, "i)t\K\d+", T), (T="") ? T := 0 :
	RegExMatch(Options, "i)r\K\d+", R), (R="") ? R := 0 :
	RegExMatch(Options, "i)b\K\d+", B), (B="") ? B := 0 :
	RegExMatch(Options, "i)a\K\d+", A), (A="") ? A := 4 :
	Psz := A_PtrSize = "" ? 4 : A_PtrSize, DW := "UInt", Ptr := A_PtrSize = "" ? DW : "Ptr"
	VarSetCapacity( button_il, 20 + Psz, 0 )
	NumPut( normal_il := DllCall( "ImageList_Create", DW, W, DW, H, DW, 0x21, DW, 1, DW, 1 ), button_il, 0, Ptr )   ; Width & Height
	NumPut( L, button_il, 0 + Psz, DW )     ; Left Margin
	NumPut( T, button_il, 4 + Psz, DW )     ; Top Margin
	NumPut( R, button_il, 8 + Psz, DW )     ; Right Margin
	NumPut( B, button_il, 12 + Psz, DW )    ; Bottom Margin
	NumPut( A, button_il, 16 + Psz, DW )    ; Alignment
	SendMessage, BCM_SETIMAGELIST := 5634, 0, &button_il,, AHK_ID %Handle%
	return IL_Add( normal_il, File, Index )

}

		;}

		;{Listview functions

LV_GetCount(hLV) {																									;-- get current count of notes in a listview

	;https://autohotkey.com/boards/viewtopic.php?t=26317
	;hLV - Listview handle

	c := DllCall("SendMessage", "uint", hLV, "uint", 0x18B) ; LB_GETCOUNT
	return c

}

LV_SetSelColors(HLV, BkgClr := "", TxtClr := "", Dummy := "") {									;-- sets the colors for selected rows in a listView.

	; ==================================================================================================================================
	; Sets the colors for selected rows in a ListView.
	; Parameters:
	;     HLV      -  handle (HWND) of the ListView control.
	;     BkgClr   -  background color as RGB integer value (0xRRGGBB).
	;                 If omitted or empty the ListViews's background color will be used.
	;     TxtClr   -  text color as RGB integer value (0xRRGGBB).
	;                 If omitted or empty the ListView's text color will be used.
	;                 If both BkgColor and TxtColor are omitted or empty the control will be reset to use the default colors.
	;     Dummy    -  must be omitted or empty!!!
	; Return value:
	;     No return value.
	; Remarks:
	;     The function adds a handler for WM_NOTIFY messages to the chain of existing handlers.
	; ==================================================================================================================================

   Static OffCode := A_PtrSize * 2              ; offset of code        (NMHDR)
        , OffStage := A_PtrSize * 3             ; offset of dwDrawStage (NMCUSTOMDRAW)
        , OffItem := (A_PtrSize * 5) + 16       ; offset of dwItemSpec  (NMCUSTOMDRAW)
        , OffItemState := OffItem + A_PtrSize   ; offset of uItemState  (NMCUSTOMDRAW)
        , OffClrText := (A_PtrSize * 8) + 16    ; offset of clrText     (NMLVCUSTOMDRAW)
        , OffClrTextBk := OffClrText + 4        ; offset of clrTextBk   (NMLVCUSTOMDRAW)
        , Controls := {}
        , MsgFunc := Func("LV_SetSelColors")
        , IsActive := False
   Local Item, H, LV, Stage
   If (Dummy = "") { ; user call ------------------------------------------------------------------------------------------------------
      If (BkgClr = "") && (TxtClr = "")
         Controls.Delete(HLV)
      Else {
         If (BkgClr <> "")
            Controls[HLV, "B"] := ((BkgClr & 0xFF0000) >> 16) | (BkgClr & 0x00FF00) | ((BkgClr & 0x0000FF) << 16) ; RGB -> BGR
         If (TxtClr <> "")
            Controls[HLV, "T"] := ((TxtClr & 0xFF0000) >> 16) | (TxtClr & 0x00FF00) | ((TxtClr & 0x0000FF) << 16) ; RGB -> BGR
      }

      If (Controls.MaxIndex() = "") {
         If (IsActive) {
            OnMessage(0x004E, MsgFunc, 0)
            IsActive := False
      }  } Else If !(IsActive) {
         OnMessage(0x004E, MsgFunc)
         IsActive := True
   }  }
   Else { ; system call ------------------------------------------------------------------------------------------------------------
      ; HLV : wParam, BkgClr : lParam, TxtClr : uMsg, Dummy : hWnd
      H := NumGet(BkgClr + 0, "UPtr")
      If (LV := Controls[H]) && (NumGet(BkgClr + OffCode, "Int") = -12) { ; NM_CUSTOMDRAW
         Stage := NumGet(BkgClr + OffStage, "UInt")
         If (Stage = 0x00010001) { ; CDDS_ITEMPREPAINT
            Item := NumGet(BkgClr + OffItem, "UPtr")
            If DllCall("SendMessage", "Ptr", H, "UInt", 0x102C, "Ptr", Item, "Ptr", 0x0002, "UInt") { ; LVM_GETITEMSTATE, LVIS_SELECTED
               ; The trick: remove the CDIS_SELECTED (0x0001) and CDIS_FOCUS (0x0010) states from uItemState and set the colors.
               NumPut(NumGet(BkgClr + OffItemState, "UInt") & ~0x0011, BkgClr + OffItemState, "UInt")
               If (LV.B <> "")
                  NumPut(LV.B, BkgClr + OffClrTextBk, "UInt")
               If (LV.T <> "")
                  NumPut(LV.T, BkgClr + OffClrText, "UInt")
               Return 0x02 ; CDRF_NEWFONT
         }  }
         Else If (Stage = 0x00000001) ; CDDS_PREPAINT
            Return 0x20 ; CDRF_NOTIFYITEMDRAW
         Return 0x00 ; CDRF_DODEFAULT
}  }  }

LV_Select(r:=1, Control:="", WinTitle:="") {																;-- select/deselect 1 to all rows of a listview

	; Modified from http://www.autohotkey.com/board/topic/54752-listview-select-alldeselect-all/?p=343662
	; Examples: LVSel(1 , "SysListView321", "Win Title")   ; Select row 1. (or use +1)
	;           LVSel(-1, "SysListView321", "Win Title")   ; Deselect row 1
	;           LVSel(+0, "SysListView321", "Win Title")   ; Select all
	;           LVSel(-0, "SysListView321", "Win Title")   ; Deselect all
	;           LVSel(+0,                 , "ahk_id " HLV) ; Use listview's hwnd

	VarSetCapacity(LVITEM, 4*15, 0) ;Do *13 if you're not on Vista or Win 7 (see MSDN)

	state := InStr(r, "-") ? 0x00000000 : 0x00000002
	NumPut(0x00000008, LVITEM, 4*0) ;mask = LVIF_STATE
	NumPut(state,      LVITEM, 4*3) ;state = <second LSB must be 1>
	NumPut(0x0002,     LVITEM, 4*4) ;stateMask = LVIS_SELECTED

	;LVM_SETITEMSTATE = LVM_FIRST + 43
	r := RegExReplace(r, "\D") - 1
	SendMessage, 0x1000 + 43, r, &LVITEM, %Control%, %WinTitle%

}

LV_HeaderFontSet(p_hwndlv="", p_fontstyle="", p_fontname="") {								;-- sets the font of a listview header

	;//******************* Functions *******************
	;//Sun, Jul 13, 2008 --- 7/13/08, 7:19:19pm
	;//Function: ListView_HeaderFontSet
	;//Params...
	;//		p_hwndlv    = ListView hwnd
	;//		p_fontstyle = [b[old]] [i[talic]] [u[nderline]] [s[trike]]
	;//		p_fontname  = <any single valid font name = Arial, Tahoma, Trebuchet MS>


	static hFont1stBkp
	method:="CreateFont"
	;//method="CreateFontIndirect"
	WM_SETFONT:=0x0030
	WM_GETFONT:=0x0031

	LVM_FIRST:=0x1000
	LVM_GETHEADER:=LVM_FIRST+31

	;// /* Font Weights */
	FW_DONTCARE:=0
	FW_THIN:=100
	FW_EXTRALIGHT:=200
	FW_LIGHT:=300
	FW_NORMAL:=400
	FW_MEDIUM:=500
	FW_SEMIBOLD:=600
	FW_BOLD:=700
	FW_EXTRABOLD:=800
	FW_HEAVY:=900

	FW_ULTRALIGHT:=FW_EXTRALIGHT
	FW_REGULAR:=FW_NORMAL
	FW_DEMIBOLD:=FW_SEMIBOLD
	FW_ULTRABOLD:=FW_EXTRABOLD
	FW_BLACK:=FW_HEAVY
	/*
	parse p_fontstyle for...
		cBlue	color	*** Note *** OMG can't set ListView/SysHeader32 font/text color??? ***
		s19		size
		b		bold
		w500	weight?
	*/
	;//*** Note *** yes I will allow mixed types later!...this was quick n dirty...
	;//*** Note *** ...it now supports bold italic underline & strike-thru...all at once
	style:=p_fontstyle
	;//*** Note *** change RegExReplace to RegExMatch
	style:=RegExReplace(style, "i)\s*\b(?:I|U|S)*B(?:old)?(?:I|U|S)*\b\s*", "", style_bold)
	style:=RegExReplace(style, "i)\s*\b(?:B|U|S)*I(?:talic)?(?:B|U|S)*\b\s*", "", style_italic)
	style:=RegExReplace(style, "i)\s*\b(?:B|I|S)*U(?:nderline)?(?:B|I|S)*\b\s*", "", style_underline)
	style:=RegExReplace(style, "i)\s*\b(?:B|I|U)*S(?:trike)?(?:B|I|U)*\b\s*", "", style_strike)
	;//style:=RegExReplace(style, "i)\s*\bW(?:eight)(\d+)\b\s*", "", style_weight)
	if (style_bold)
		fnWeight:=FW_BOLD
	if (style_italic)
		fdwItalic:=1
	if (style_underline)
		fdwUnderline:=1
	if (style_strike)
		fdwStrikeOut:=1
	;//if (mweight)
	;//	fnWeight:=mweight
	lpszFace:=p_fontname

	ret:=hHeader:=SendMessage(p_hwndlv, LVM_GETHEADER, 0, 0)
	el:=Errorlevel
	le:=A_LastError
	;//msgbox, 64, , SendMessage LVM_GETHEADER: ret(%ret%) el(%el%) le(%le%)

	ret:=hFontCurr:=SendMessage(hHeader, WM_GETFONT, 0, 0)
	el:=Errorlevel
	le:=A_LastError
	;//msgbox, 64, , SendMessage WM_GETFONT: ret(%ret%) el(%el%) le(%le%)
	if (!hFont1stBkp) {
		hFont1stBkp:=hFontCurr
	}

	if (method="CreateFont") {
		if (p_fontstyle!="" || p_fontname!="") {
			ret:=hFontHeader:=CreateFont(nHeight, nWidth, nEscapement, nOrientation
										, fnWeight, fdwItalic, fdwUnderline, fdwStrikeOut
										, fdwCharSet, fdwOutputPrecision, fdwClipPrecision
										, fdwQuality, fdwPitchAndFamily, lpszFace)
			el:=Errorlevel
			le:=A_LastError
			;//msgbox, 64, , CreateFont: ret(%ret%) el(%el%) le(%le%)
		} else hFontHeader:=hFont1stBkp
		ret:=SendMessage(hHeader, WM_SETFONT, hFontHeader, 1)
		;//ret:=SendMessage(hHeader, WM_SETFONT, hFontHeader, 0)
		;//ret:=SendMessage(hHeader, WM_SETFONT, &0, 1)
		el:=Errorlevel
		le:=A_LastError
		;//msgbox, 64, , SendMessage WM_SETFONT: ret(%ret%) el(%el%) le(%le%)
	}

}

LV_GetItemText(item_index, sub_index, ctrl_id, win_id) {												;-- read the text from an item in a TListView

		; https://autohotkey.com/board/topic/18299-reading-listview-of-another-app/
		; code from Tigerite

		/* 			Example

			F4::
			pList = ahk_class TPlayerListForm
			WinGet, active_id, ID, %pList%
			;WinGet, active_id, ID, ahk_class TPlayerListForm
			;MsgBox, The active window's ID is "%a_id%".

			p0 := LV_GetItemText((0, 2, "TListView1", active_id)
			p1 := LV_GetItemText((1, 2, "TListView1", active_id)
			p2 := LV_GetItemText((2, 2, "TListView1", active_id)
			p3 := LV_GetItemText((3, 2, "TListView1", active_id)
			p4 := LV_GetItemText((4, 2, "TListView1", active_id)
			p5 := LV_GetItemText((5, 2, "TListView1", active_id)
			MsgBox %p0%`n %p1%`n %p2%`n %p3%`n %p4%`n %p5%
			Return

		*/

        ;const
        MAX_TEXT = 260

        VarSetCapacity(szText, MAX_TEXT, 0)
        VarSetCapacity(szClass, MAX_TEXT, 0)
        ControlGet, hListView, Hwnd, , %ctrl_id%, ahk_id %win_id%
        DllCall("GetClassName", UInt,hListView, Str,szClass, Int,MAX_TEXT)
        if (DllCall("lstrcmpi", Str,szClass, Str,"SysListView32") == 0 || DllCall("lstrcmpi", Str,szClass, Str,"TListView") == 0)
        {
            GetListViewText(hListView, item_index, sub_index, szText, MAX_TEXT)
        }

        return %szText%
    }

LV_GetText(hListView,iItem,iSubItem,ByRef lpString,nMaxCount) {								;--
        ;const
        NULL = 0
        PROCESS_ALL_ACCESS = 0x001F0FFF
        INVALID_HANDLE_VALUE = 0xFFFFFFFF
        PAGE_READWRITE = 4
        FILE_MAP_WRITE = 2
        MEM_COMMIT = 0x1000
        MEM_RELEASE = 0x8000
        LV_ITEM_mask = 0
        LV_ITEM_iItem = 4
        LV_ITEM_iSubItem = 8
        LV_ITEM_state = 12
        LV_ITEM_stateMask = 16
        LV_ITEM_pszText = 20
        LV_ITEM_cchTextMax = 24
        LVIF_TEXT = 1
        LVM_GETITEM = 0x1005
        SIZEOF_LV_ITEM = 0x28
        SIZEOF_TEXT_BUF = 0x104
        SIZEOF_BUF = 0x120
        SIZEOF_INT = 4
        SIZEOF_POINTER = 4

        ;var
        result := 0
        hProcess := NULL
        dwProcessId := 0

        if lpString <> NULL && nMaxCount > 0
        {
            DllCall("lstrcpy", Str,lpString, Str,"")
            DllCall("GetWindowThreadProcessId", UInt,hListView, UIntP,dwProcessId)
            hProcess := DllCall("OpenProcess", UInt,PROCESS_ALL_ACCESS, Int,false, UInt,dwProcessId)
            if hProcess <> NULL
            {
                ;var
                lpProcessBuf := NULL
                hMap := NULL
                hKernel := DllCall("GetModuleHandle", Str,"kernel32.dll", UInt)
                pVirtualAllocEx := DllCall("GetProcAddress", UInt,hKernel, Str,"VirtualAllocEx", UInt)

                if pVirtualAllocEx == NULL
                {
                    hMap := DllCall("CreateFileMapping", UInt,INVALID_HANDLE_VALUE, Int,NULL, UInt,PAGE_READWRITE, UInt,0, UInt,SIZEOF_BUF, UInt)
                    if hMap <> NULL
                        lpProcessBuf := DllCall("MapViewOfFile", UInt,hMap, UInt,FILE_MAP_WRITE, UInt,0, UInt,0, UInt,0, UInt)
                }
                else
                {
                    lpProcessBuf := DllCall("VirtualAllocEx", UInt,hProcess, UInt,NULL, UInt,SIZEOF_BUF, UInt,MEM_COMMIT, UInt,PAGE_READWRITE)
                }

                if lpProcessBuf <> NULL
                {
                    ;var
                    VarSetCapacity(buf, SIZEOF_BUF, 0)

                    InsertIntegerSL(LVIF_TEXT, buf, LV_ITEM_mask, SIZEOF_INT)
                    InsertIntegerSL(iItem, buf, LV_ITEM_iItem, SIZEOF_INT)
                    InsertIntegerSL(iSubItem, buf, LV_ITEM_iSubItem, SIZEOF_INT)
                    InsertIntegerSL(lpProcessBuf + SIZEOF_LV_ITEM, buf, LV_ITEM_pszText, SIZEOF_POINTER)
                    InsertIntegerSL(SIZEOF_TEXT_BUF, buf, LV_ITEM_cchTextMax, SIZEOF_INT)

                    if DllCall("WriteProcessMemory", UInt,hProcess, UInt,lpProcessBuf, UInt,&buf, UInt,SIZEOF_BUF, UInt,NULL) <> 0
                        if DllCall("SendMessage", UInt,hListView, UInt,LVM_GETITEM, Int,0, Int,lpProcessBuf) <> 0
                            if DllCall("ReadProcessMemory", UInt,hProcess, UInt,lpProcessBuf, UInt,&buf, UInt,SIZEOF_BUF, UInt,NULL) <> 0
                            {
                                DllCall("lstrcpyn", Str,lpString, UInt,&buf + SIZEOF_LV_ITEM, Int,nMaxCount)
                                result := DllCall("lstrlen", Str,lpString)
                            }
                }

                if lpProcessBuf <> NULL
                    if pVirtualAllocEx <> NULL
                        DllCall("VirtualFreeEx", UInt,hProcess, UInt,lpProcessBuf, UInt,0, UInt,MEM_RELEASE)
                    else
                        DllCall("UnmapViewOfFile", UInt,lpProcessBuf)

                if hMap <> NULL
                    DllCall("CloseHandle", UInt,hMap)

                DllCall("CloseHandle", UInt,hProcess)
            }
        }
        return result
    }
;{Sub	for LV_GetItemText and LV_GetText
ExtractInteger(ByRef pSource, pOffset = 0, pIsSigned = false, pSize = 4) {

; Original versions of ExtractInteger and InsertInteger provided by Chris
; - from the AutoHotkey help file - Version 1.0.37.04

; pSource is a string (buffer) whose memory area contains a raw/binary integer at pOffset.
; The caller should pass true for pSigned to interpret the result as signed vs. unsigned.
; pSize is the size of PSource's integer in bytes (e.g. 4 bytes for a DWORD or Int).
; pSource must be ByRef to avoid corruption during the formal-to-actual copying process
; (since pSource might contain valid data beyond its first binary zero).

   SourceAddress := &pSource + pOffset  ; Get address and apply the caller's offset.
   result := 0  ; Init prior to accumulation in the loop.
   Loop %pSize%  ; For each byte in the integer:
   {
      result := result | (*SourceAddress << 8 * (A_Index - 1))  ; Build the integer from its bytes.
      SourceAddress += 1  ; Move on to the next byte.
   }
   if (!pIsSigned OR pSize > 4 OR result < 0x80000000)
      return result  ; Signed vs. unsigned doesn't matter in these cases.
   ; Otherwise, convert the value (now known to be 32-bit) to its signed counterpart:
   return -(0xFFFFFFFF - result + 1)
}
InsertInteger(pInteger, ByRef pDest, pOffset = 0, pSize = 4) {
; To preserve any existing contents in pDest, only pSize number of bytes starting at pOffset
; are altered in it. The caller must ensure that pDest has sufficient capacity.

   mask := 0xFF  ; This serves to isolate each byte, one by one.
   Loop %pSize%  ; Copy each byte in the integer into the structure as raw binary data.
   {
      DllCall("RtlFillMemory", UInt, &pDest + pOffset + A_Index - 1, UInt, 1  ; Write one byte.
         , UChar, (pInteger & mask) >> 8 * (A_Index - 1))  ; This line is auto-merged with above at load-time.
      mask := mask << 8  ; Set it up for isolation of the next byte.
   }
}
;}
;}

		;{TabControl functions

TabCtrl_GetCurSel(HWND) { 																						;-- Indexnumber of active tab in a gui
	; a function by: "just me" found on https://autohotkey.com/board/topic/79783-how-to-get-the-current-tab-name/
   ; Returns the 1-based index of the currently selected tab
   Static TCM_GETCURSEL := 0x130B
   SendMessage, TCM_GETCURSEL, 0, 0, , ahk_id %HWND%
   Return (ErrorLevel + 1)
}

TabCtrl_GetItemText(HWND, Index = 0) {																	;-- returns text of a tab
	; a function by: "just me" found on https://autohotkey.com/board/topic/79783-how-to-get-the-current-tab-name/

   Static TCM_GETITEM  := A_IsUnicode ? 0x133C : 0x1305 ; TCM_GETITEMW : TCM_GETITEMA
   Static TCIF_TEXT := 0x0001
   Static TCTXTP := (3 * 4) + (A_PtrSize - 4)
   Static TCTXLP := TCTXTP + A_PtrSize
   ErrorLevel := 0
   If (Index = 0)
      Index := TabCtrl_GetCurSel(HWND)
   If (Index = 0)
      Return SetError(1, "")
   VarSetCapacity(TCTEXT, 256 * SizeT, 0)
   ; typedef struct {
   ;   UINT   mask;           4
   ;   DWORD  dwState;        4
   ;   DWORD  dwStateMask;    4 + 4 bytes padding on 64-bit systems
   ;   LPTSTR pszText;        4 / 8 (32-bit / 64-bit)
   ;   int    cchTextMax;     4
   ;   int    iImage;         4
   ;   LPARAM lParam;         4 / 8
   ; } TCITEM, *LPTCITEM;
   VarSetCapacity(TCITEM, (5 * 4) + (2 * A_PtrSize) + (A_PtrSize - 4), 0)
   NumPut(TCIF_TEXT, TCITEM, 0, "UInt")
   NumPut(&TCTEXT, TCITEM, TCTXTP, "Ptr")
   NumPut(256, TCITEM, TCTXLP, "Int")
   SendMessage, TCM_GETITEM, --Index, &TCITEM, , ahk_id %HWND%
   If !(ErrorLevel)
      Return SetError(1, "")
   Else
      Return SetError(0, StrGet(NumGet(TCITEM, TCTXTP, "UPtr")))
}
;{sub of TabCtrl functions
SetError(ErrorValue, ReturnValue) {

	;; a function by: "just me" found on https://autohotkey.com/board/topic/79783-how-to-get-the-current-tab-name/
   ErrorLevel := ErrorValue
   Return ReturnValue
}
;}

		;}

		;{Treeview functions

TV_Find(VarText) {																										;-- returns the ID of an item based on the text of the item


	Loop {
		ItemID := TV_GetNext(ItemID, "Full")
		if not ItemID
			break
		TV_GetText(ItemText, ItemID)
		If (ItemText=VarText)
			Return ItemID
	}

Return
}

TV_Load(src, p:=0, recurse:=false) {																			;-- loads TreeView items from an XML string

	/*	Description

	a function by Coco found at https://autohotkey.com/boards/viewtopic.php?t=91

	This function loads TreeView items from an XML string. By using XPath expressions, the user can instruct the function on how to process/parse
	the XML source and on how the items are to be added.

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	A. The XML structure

	This function is versatile enough to accept any user-defined XML string. Parsing instructions are defined as XPath expressions assigned as values
	to the root element's attribute(s). The following attribute names should be used(strictly applies to the root element only):

	name - 		specify an XPath expression, query must resolve to either of the following nodeTypes: element, attribute, text, cdatasection, comment.
					The selection is applied to the element node that is defined as a TreeView item. If not defined, the element node's tagName property
					is used as the TreeView's item's name.

	options - 	same as above

	global - 	An XPath expression. This attribute defines global TreeView item options to be applied to all TreeView items that are to be added.
					Selection is applied to the root node.

	exclude - An XPath expression. Specifies which nodes(element) are not to be added as TreeView items. Selection is applied to the root node.

	match - An XPath expression. Specifies which element nodes are to be added as TreeView items. By default all element nodes(except the root
				node) are added as items to the TreeView. Selection is applied to the root node.

	Note: Only element nodes are added as TreeView items.

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	B. Function parameters

		src - an XML string
		p - parentItem's ID. Defaults to '0' - top item of the TreeView

	*/

	/* Example

		#Include TV_Load.ahk ;or Copy-Paste fucntion in script

		tv1 := "
		(Join
		<TREEVIEW name='@n' options='@o' match='//i' global='bold'>
		 <i n='AutoHotkey' o='expand'>
		  <i n='Hello World'/>
		 </i>
		 <i n='TreeView Item'/>
		 <i n='Another Item' o='-bold expand'>
		  <excluded>
		   <i n='The quick brown fox'/>
		  </excluded>
		  <i n='Child Item'>
		   <i n='Descendant'/>
		  </i>
		  <i n='Sibling Item' o='-bold'/>
		 </i>
		</TREEVIEW>
		)"

		tv2 := "
		(Join
		<TREEVIEW name='name/text()' options='options/text()' match='//i' global='expand'>
		 <i>
		  <name><![CDATA[AutoHotkey]]></name>
		  <options>bold</options>
		  <i>
		   <name><![CDATA[Child Item]]></name>
		   <options/>
		  </i>
		 </i>
		 <i>
		  <name><![CDATA[<XML STRING/>]]></name>
		  <options/>
		 </i>
		 <i>
		  <name><![CDATA[Sibling Item]]></name>
		  <options>check</options>
		  <i>
		   <name><![CDATA[Hello World]]></name>
		   <options/>
		   <i>
			<name><![CDATA[Descendant]]></name>
			<options>check</options>
		   </i>
		  </i>
		 </i>
		 <i>
		  <name><![CDATA[Items automatcially expanded]]></name>
		  <options/>
		 </i>
		</TREEVIEW>
		)"

		Gui, Margin, 0, 0
		Gui, Font, s9, Consolas
		Gui, Add, TreeView, w250 r15
		TV_Load(tv1)
		Gui, Add, TreeView, x+5 yp w250 r15 Checked
		TV_Load(tv2)
		Gui, Show
		return
		GuiClose:
		ExitApp

	*/

	;recurse is an internal parameter
	static xpr , root
	static TVL_NAME , TVL_OPTIONS , TVL_GLOBAL , TVL_EXCLUDE , TVL_MATCH

	if !xpr
		xpr := {TVL_NAME:"@*[translate(name(), 'NAME', 'name')='name']"
		    ,   TVL_OPTIONS:"@*[translate(name(), 'OPTIONS', 'options')='options']"
		    ,   TVL_GLOBAL:"@*[translate(name(), 'GLOBAL', 'global')='global']"
		    ,   TVL_EXCLUDE:"@*[translate(name(), 'EXCLUDE', 'exclude')='exclude']"
		    ,   TVL_MATCH:"@*[translate(name(), 'MATCH', 'match')='match']"}

	if !IsObject(src)
		x := ComObjCreate("MSXML2.DOMDocument.6.0")
		, x.setProperty("SelectionLanguage", "XPath") ;redundant
		, x.async := false , x.loadXML(src)
		, src := x.documentElement

	if !recurse {
		root := src.selectSingleNode("/*") ;src.ownerDocument.documentElement

		for var, xp in xpr
			if (var ~= "^TVL_(NAME|OPTIONS|GLOBAL)$")
				%var% := (_:=root.selectSingleNode(xp))
				      ? _.value
				      : (var="TVL_NAME" ? "." : "")

			else if (var ~= "^TVL_(EXCLUDE|MATCH)$")
				%var% := (_:=root.selectSingleNode(xp))
				      ? (_.value<>"" ? root.selectNodes(_.value) : "")
				      : ""
	}

	for e in src.childNodes {
		if (e.nodeTypeString <> "element")
			continue
		if (TVL_EXCLUDE && TVL_EXCLUDE.matches(e))
			continue
		if (TVL_MATCH && !TVL_MATCH.matches(e))
			continue

		for k, v in {name:TVL_NAME, options:TVL_OPTIONS}
			%k% := (n:=e.selectSingleNode(v))[(n.nodeType>1 ? "nodeValue" : "nodeName")]

		if (TVL_GLOBAL <> "") {
			go := TVL_GLOBAL
			Loop, Parse, options, % " `t", % " `t"
			{
				if ((alf:=A_LoopField) == "")
					continue
				if InStr(go, m:=RegExReplace(alf, "i)[^a-z]+", ""))
					go := RegExReplace(go, "i)\S*" m "\S*", alf)
				else (go .=  " " . alf)
			}

		} else go := options

		id := TV_Add(name, p, go)
		if e.hasChildNodes()
			TV_Load(e, id, true)
	}
	;Empty/reset static vars
	if !recurse
		root := ""
		, TVL_NAME := ""
		, TVL_OPTIONS := ""
		, TVL_GLOBAL := ""
		, TVL_EXCLUDE := ""
		, TVL_MATCH := ""

}

		;}

		;{GDI Control functions

ControlCreateGradient(Handle, Colors*) {																	;-- draws a gradient as background picture

   GuiControlGet, C, Pos, %Handle%
   ColorCnt := Colors.Length()
   Size := ColorCnt * 2 * 4
   VarSetCapacity(Bits, Size, 0)
   Addr := &Bits
   For Each, Color In Colors
      Addr := Numput(Color, NumPut(Color, Addr + 0, "UInt"), "UInt")
    HBMP := DllCall("CreateBitmap", "Int", 2, "Int", ColorCnt, "UInt", 1, "UInt", 32, "Ptr", 0, "Ptr")
    HBMP := DllCall("CopyImage", "Ptr", HBMP, "UInt", 0, "Int", 0, "Int", 0, "UInt", 0x2008, "Ptr")
    DllCall("SetBitmapBits", "Ptr", HBMP, "UInt", Size, "Ptr", &Bits)
    HBMP := DllCall("CopyImage", "Ptr", HBMP, "UInt", 0, "Int", CW, "Int", CH, "UInt", 0x2008, "Ptr")
    DllCall("SendMessage", "Ptr", Handle, "UInt", 0x0172, "Ptr", 0, "Ptr", HBMP, "Ptr")
    Return True

}

AddGraphicButtonPlus(ImgPath, Options="", Text="") {												;-- GDI+ add a graphic button to a gui

    hGdiPlus := DllCall("LoadLibrary", "Str", "gdiplus.dll")
    VarSetCapacity(si, 16, 0), si := Chr(1)
    DllCall("gdiplus\GdiplusStartup", "UIntP", pToken, "UInt", &si, "UInt", 0)
    VarSetCapacity(wFile, StrLen(ImgPath)*2+2)
    DllCall("kernel32\MultiByteToWideChar", "UInt", 0, "UInt", 0, "Str", ImgPath, "Int", -1, "UInt", &wFile, "Int", VarSetCapacity(wFile)//2)
    DllCall("gdiplus\GdipCreateBitmapFromFile", "UInt", &wFile, "UIntP", pBitmap)
    if (pBitmap) {
        DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "UInt", pBitmap, "UIntP", hBM, "UInt", 0)
        DllCall("gdiplus\GdipDisposeImage", "Uint", pBitmap)
    }
    DllCall("gdiplus\GdiplusShutdown" , "UInt", pToken)
    DllCall("FreeLibrary", "UInt", hGdiPlus)

    if Text =
    {
        VarSetCapacity(oBM, 24)
        DllCall("GetObject","uint",hBM,"int",24,"uint",&oBM)
        Options := "W" NumGet(oBM,4,"int") " H" NumGet(oBM,8,"int") " +128 " Options
    }

    Gui, Add, Button, %Options% hwndhwnd, %Text%

    SendMessage, 0xF7, 0, hBM,, ahk_id %hwnd%  ; BM_SETIMAGE
    if ErrorLevel ; delete previous image
        DllCall("DeleteObject", "uint", ErrorLevel)

    return hBM
}

		;}

	;}

    ;{Gui - retreaving informations functions

;{ SCREEN-------get
screenDims() {																											;-- returns informations of active screen (size, DPI and orientation)

	W := A_ScreenWidth
	H := A_ScreenHeight
	DPI := A_ScreenDPI
	Orient := (W>H)?"L":"P"
	;MsgBox % "W: "W "`nH: "H "`nDPI: "DPI
	return {W:W, H:H, DPI:DPI, OR:Orient}

}

DPIFactor() {																												;-- determines the Windows setting to the current DPI factor

	RegRead, DPI_value, HKEY_CURRENT_USER, Control Panel\Desktop\WindowMetrics, AppliedDPI
	; the reg key was not found - it means default settings
	; 96 is the default font size setting
	if (errorlevel=1) OR (DPI_value=96 )
		return 1
	else
		Return  DPI_Value/96

}

;}

;{ CONTROL type - get (not control specific functions)

ControlExists(class) {																									;-- true/false for ControlClass
  WinGet, WinList, List  ;gets a list of all windows
  Loop, % WinList
  {
    temp := "ahk_id " WinList%A_Index%
    ControlGet, temp, Hwnd,, %class%, %temp%
    if !ErrorLevel  ;errorlevel is set to 1 if control doesn't exist
      return temp
  }
  return 0
}

GetFocusedControl()  {   																							;-- retrieves the ahk_id (HWND) of the active window's focused control.

        ; This script requires Windows 98+ or NT 4.0 SP3+.
        /*
        typedef struct tagGUITHREADINFO {
        DWORD cbSize;
        DWORD flags;
        HWND  hwndActive;
        HWND  hwndFocus;
        HWND  hwndCapture;
        HWND  hwndMenuOwner;
        HWND  hwndMoveSize;
        HWND  hwndCaret;
        RECT  rcCaret;
        } GUITHREADINFO, *PGUITHREADINFO;
        */

    guiThreadInfoSize := 8 + 6 * A_PtrSize + 16
   VarSetCapacity(guiThreadInfo, guiThreadInfoSize, 0)
   NumPut(GuiThreadInfoSize, GuiThreadInfo, 0)
   ; DllCall("RtlFillMemory" , "PTR", &guiThreadInfo, "UInt", 1 , "UChar", guiThreadInfoSize)   ; Below 0xFF, one call only is needed
   If(DllCall("GetGUIThreadInfo" , "UInt", 0   ; Foreground thread
         , "PTR", &guiThreadInfo) = 0)
   {
      ErrorLevel := A_LastError   ; Failure
      Return 0
   }
   focusedHwnd := NumGet(guiThreadInfo,8+A_PtrSize, "Ptr") ; *(addr + 12) + (*(addr + 13) << 8) +  (*(addr + 14) << 16) + (*(addr + 15) << 24)

	Return focusedHwnd
}

GetControls(hwnd, controls="") {																				;-- returns an array with ClassNN, Hwnd and text of all controls of a window

	if !isobject(controls)
		controls:=[]

	if isobject(hwnd){
		for k,v in hwnd
			controls:=GetControls(v, controls)
		return controls
	}

	winget,classnn,ControlList,ahk_id %hwnd%
	winget,controlId,controllisthwnd,ahk_id %hwnd%
	loop,parse,classnn,`n
	{
		controls[a_index]:=[]
		controls[a_index]["ClassNN"]:=a_loopfield
	}

	loop,parse,controlId,`n
	{
		controls[a_index]["Hwnd"]:=a_loopfield
		controlgetText,txt,,ahk_id %a_loopfield%
		controls[a_index]["text"]:=txt
	}
	return controls

}

GetOtherControl(refHwnd,shift,controls,type="hwnd") {												;--
	for k,v in controls
		if v[type]=refHwnd
			return controls[k+shift].hwnd
}

ListControls(hwnd, obj=0, arr="") {																			;-- similar function to GetControls but returns a comma seperated list

	if !isobject(arr)
		arr:=[]

	if isobject(hwnd){
		for k,v in hwnd
			arr:=ListControls(v, 1, arr)
		goto ListControlsReturn
	}

	str=
	arr:=GetControls(hwnd)
ListControlsReturn:
	if obj
		return arr

	for k,v in arr
		str.="""" v["Hwnd"] """,""" v["ClassNN"] """,""" v["text"] """`n"
	return str

}

Control_GetClassNN( hWnd, hCtrl ) {  																		;-- no-loop

	; SKAN: www.autohotkey.com/forum/viewtopic.php?t=49471
	 WinGet, CH, ControlListHwnd, ahk_id %hWnd%
	 WinGet, CN, ControlList, ahk_id %hWnd%
	 LF:= "`n",  CH:= LF CH LF, CN:= LF CN LF,  S:= SubStr( CH, 1, InStr( CH, LF hCtrl LF ) )
	 StringReplace, S, S,`n,`n, UseErrorLevel
	 StringGetPos, P, CN, `n, L%ErrorLevel%
	 Return SubStr( CN, P+2, InStr( CN, LF, 0, P+2 ) -P-2 )

}

ControlGetClassNN(hWndWindow,hWndControl) {													;-- with loop

	; https://autohotkey.com/board/topic/45627-function-control-getclassnn-get-a-control-classnn/
	DetectHiddenWindows, On
	WinGet, ClassNNList, ControlList, ahk_id %hWndWindow%
	Loop, PARSE, ClassNNList, `n
	{
		ControlGet, hwnd, hwnd,,%A_LoopField%,ahk_id %hWndWindow%
		if (hWnd = hWndControl)
			return A_LoopField
	}

}

Control_GetFont(hWnd, ByRef Name, ByRef Size, ByRef Style, 										;-- get the currently used font of a control
IsGDIFontSize := 0) {

    SendMessage 0x31, 0, 0, , ahk_id %hWnd% ; WM_GETFONT
    If (ErrorLevel == "FAIL") {
        Return
    }

    hFont := Errorlevel
    VarSetCapacity(LOGFONT, LOGFONTSize := 60 * (A_IsUnicode ? 2 : 1 ))
    DllCall("GetObject", "UInt", hFont, "Int", LOGFONTSize, "UInt", &LOGFONT)

    Name := DllCall("MulDiv", "Int", &LOGFONT + 28, "Int", 1, "Int", 1, "Str")

    Style := Trim((Weight := NumGet(LOGFONT, 16, "Int")) == 700 ? "Bold" : (Weight == 400) ? "" : " w" . Weight
    . (NumGet(LOGFONT, 20, "UChar") ? " Italic" : "")
    . (NumGet(LOGFONT, 21, "UChar") ? " Underline" : "")
    . (NumGet(LOGFONT, 22, "UChar") ? " Strikeout" : ""))

    Size := IsGDIFontSize ? -NumGet(LOGFONT, 0, "Int") : Round((-NumGet(LOGFONT, 0, "Int") * 72) / A_ScreenDPI)
}

IsControlFocused(hwnd) {																							;-- true/false if a specific control is focused
    VarSetCapacity(GuiThreadInfo, 48) , NumPut(48, GuiThreadInfo, 0)
    Return DllCall("GetGUIThreadInfo", uint, 0, str, GuiThreadInfo) ? (hwnd = NumGet(GuiThreadInfo, 12)) ? True : False : False
}

getControlNameByHwnd(winHwnd,controlHwnd) {														;-- self explaining
	bufSize=1024
	winget,processID,pid,ahk_id %winHwnd%
	VarSetCapacity(var1,bufSize)
	getName:=DllCall( "RegisterWindowMessage", "str", "WM_GETCONTROLNAME" )
	dwResult:=DllCall("GetWindowThreadProcessId", "UInt", winHwnd)
	hProcess:=DllCall("OpenProcess", "UInt", 0x8 | 0x10 | 0x20, "Uint", 0, "UInt", processID)
	otherMem:=DllCall("VirtualAllocEx", "Ptr", hProcess, "Ptr", 0, "PTR", bufSize, "UInt", 0x3000, "UInt", 0x0004, "Ptr")

	SendMessage,%getName%,%bufSize%,%otherMem%,,ahk_id %controlHwnd%
	DllCall("ReadProcessMemory","UInt",hProcess,"UInt",otherMem,"Str",var1,"UInt",bufSize,"UInt *",0)
	DllCall("CloseHandle","Ptr",hProcess)
	DllCall("VirtualFreeEx","Ptr", hProcess,"UInt",otherMem,"UInt", 0, "UInt", 0x8000)
	return var1

}

getByControlName(winHwnd,name) {																		;-- search by control name return hwnd
	winget,controlList,controlListhwnd,ahk_id %winHwnd%
    arr:=[]
    ,bufSize=1024
	winget,processID,pid,ahk_id %winHwnd%
	VarSetCapacity(var1,bufSize)
	if !(getName:=DllCall( "RegisterWindowMessage", "str", "WM_GETCONTROLNAME" ))
        return []
	if !(dwResult:=DllCall("GetWindowThreadProcessId", "UInt", winHwnd))
        return []
	if !(hProcess:=DllCall("OpenProcess", "UInt", 0x8 | 0x10 | 0x20, "Uint", 0, "UInt", processID))
        return []
    if !(otherMem:=DllCall("VirtualAllocEx", "Ptr", hProcess, "Ptr", 0, "PTR", bufSize, "UInt", 0x3000, "UInt", 0x0004, "Ptr"))
        return []

	loop,parse,controlList,`n
	{
        SendMessage,%getName%,%bufSize%,%otherMem%,,ahk_id %a_loopfield%
        if errorlevel=FAIL
            return []
        if !DllCall("ReadProcessMemory","UInt",hProcess,"UInt",otherMem,"Str",var1,"UInt",bufSize,"UInt *",0)
            return []
        if (var1=name)
            arr.insert(a_loopfield)
            ,var1:=""
	}

    DllCall("VirtualFreeEx","Ptr", hProcess,"UInt",otherMem,"UInt", 0, "UInt", 0x8000)
	DllCall("CloseHandle","Ptr",hProcess)
    return arr
}

;}

;{ GUI / window - get

IsOverTitleBar(x, y, hWnd) { 																						;-- WM_NCHITTEST wrapping: what's under a screen point?

	; This function is from http://www.autohotkey.com/forum/topic22178.html
   SendMessage, 0x84,, (x & 0xFFFF) | (y & 0xFFFF) << 16,, ahk_id %hWnd%
   if ErrorLevel in 2,3,8,9,20,21
      return true
   else
      return false
}

WinGetPosEx(hWindow,ByRef X="",ByRef Y="",ByRef Width="", 									;-- gets the position, size, and offset of a window
ByRef Height="", ByRef Offset_X="",ByRef Offset_Y="")  {

/*
;
; Function: WinGetPosEx
;
; Description:
;
;   Gets the position, size, and offset of a window. See the *Remarks* section
;   for more information.
;
; Parameters:
;
;   hWindow - Handle to the window.
;
;   X, Y, Width, Height - Output variables. [Optional] If defined, these
;       variables contain the coordinates of the window relative to the
;       upper-left corner of the screen (X and Y), and the Width and Height of
;       the window.
;
;   Offset_X, Offset_Y - Output variables. [Optional] Offset, in pixels, of the
;       actual position of the window versus the position of the window as
;       reported by GetWindowRect.  If moving the window to specific
;       coordinates, add these offset values to the appropriate coordinate
;       (X and/or Y) to reflect the true size of the window.
;
; Returns:
;
;   If successful, the address of a RECTPlus structure is returned.  The first
;   16 bytes contains a RECT structure that contains the dimensions of the
;   bounding rectangle of the specified window.  The dimensions are given in
;   screen coordinates that are relative to the upper-left corner of the screen.
;   The next 8 bytes contain the X and Y offsets (4-byte integer for X and
;   4-byte integer for Y).
;
;   Also if successful (and if defined), the output variables (X, Y, Width,
;   Height, Offset_X, and Offset_Y) are updated.  See the *Parameters* section
;   for more more information.
;
;   If not successful, FALSE is returned.
;
; Requirement:
;
;   Windows 2000+
;
; Remarks, Observations, and Changes:
;
; * Starting with Windows Vista, Microsoft includes the Desktop Window Manager
;   (DWM) along with Aero-based themes that use DWM.  Aero themes provide new
;   features like a translucent glass design with subtle window animations.
;   Unfortunately, the DWM doesn't always conform to the OS rules for size and
;   positioning of windows.  If using an Aero theme, many of the windows are
;   actually larger than reported by Windows when using standard commands (Ex:
;   WinGetPos, GetWindowRect, etc.) and because of that, are not positioned
;   correctly when using standard commands (Ex: gui Show, WinMove, etc.).  This
;   function was created to 1) identify the true position and size of all
;   windows regardless of the window attributes, desktop theme, or version of
;   Windows and to 2) identify the appropriate offset that is needed to position
;   the window if the window is a different size than reported.
;
; * The true size, position, and offset of a window cannot be determined until
;   the window has been rendered.  See the example script for an example of how
;   to use this function to position a new window.
;
; * 20150906: The "dwmapi\DwmGetWindowAttribute" function can return odd errors
;   if DWM is not enabled.  One error I've discovered is a return code of
;   0x80070006 with a last error code of 6, i.e. ERROR_INVALID_HANDLE or "The
;   handle is invalid."  To keep the function operational during this types of
;   conditions, the function has been modified to assume that all unexpected
;   return codes mean that DWM is not available and continue to process without
;   it.  When DWM is a possibility (i.e. Vista+), a developer-friendly messsage
;   will be dumped to the debugger when these errors occur.
;
; * 20160105 (Ben Allred): Adjust width and height for offset calculations if
;   DPI is in play.
;
; Credit:
;
;   Idea and some code from *KaFu* (AutoIt forum)
;
;-------------------------------------------------------------------------------
    */

    Static Dummy5693
          ,RECTPlus
          ,S_OK:=0x0
          ,DWMWA_EXTENDED_FRAME_BOUNDS:=9

    ;-- Workaround for AutoHotkey Basic
    PtrType:=(A_PtrSize=8) ? "Ptr":"UInt"

    ;-- Get the window's dimensions
    ;   Note: Only the first 16 bytes of the RECTPlus structure are used by the
    ;   DwmGetWindowAttribute and GetWindowRect functions.
    VarSetCapacity(RECTPlus,24,0)
    DWMRC:=DllCall("dwmapi\DwmGetWindowAttribute"
        ,PtrType,hWindow                                ;-- hwnd
        ,"UInt",DWMWA_EXTENDED_FRAME_BOUNDS             ;-- dwAttribute
        ,PtrType,&RECTPlus                              ;-- pvAttribute
        ,"UInt",16)                                     ;-- cbAttribute

    if (DWMRC<>S_OK)
        {
        if ErrorLevel in -3,-4  ;-- Dll or function not found (older than Vista)
            {
            ;-- Do nothing else (for now)
            }
         else
            outputdebug,
               (ltrim join`s
                Function: %A_ThisFunc% -
                Unknown error calling "dwmapi\DwmGetWindowAttribute".
                RC=%DWMRC%,
                ErrorLevel=%ErrorLevel%,
                A_LastError=%A_LastError%.
                "GetWindowRect" used instead.
               )

        ;-- Collect the position and size from "GetWindowRect"
        DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECTPlus)
        }

    ;-- Populate the output variables
    X:=Left :=NumGet(RECTPlus,0,"Int")
    Y:=Top  :=NumGet(RECTPlus,4,"Int")
    Right   :=NumGet(RECTPlus,8,"Int")
    Bottom  :=NumGet(RECTPlus,12,"Int")
    Width   :=Right-Left
    Height  :=Bottom-Top
    OffSet_X:=0
    OffSet_Y:=0

    ;-- If DWM is not used (older than Vista or DWM not enabled), we're done
    if (DWMRC<>S_OK)
        Return &RECTPlus

    ;-- Collect dimensions via GetWindowRect
    VarSetCapacity(RECT,16,0)
    DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECT)
    GWR_Width :=NumGet(RECT,8,"Int")-NumGet(RECT,0,"Int")
        ;-- Right minus Left
    GWR_Height:=NumGet(RECT,12,"Int")-NumGet(RECT,4,"Int")
        ;-- Bottom minus Top

    ;-- Adjust width and height for offset calculations if DPI is in play
    ;   See https://msdn.microsoft.com/en-us/library/windows/desktop/dn280512(v=vs.85).aspx
    ;   The current version of AutoHotkey is PROCESS_SYSTEM_DPI_AWARE (contains "<dpiAware>true</dpiAware>" in its manifest)
    ;   DwmGetWindowAttribute returns DPI scaled sizes
    ;   GetWindowRect does not
    ; get monitor handle where the window is at so we can get the monitor name
    hMonitor := DllCall("MonitorFromRect",PtrType,&RECT,UInt,2) ; MONITOR_DEFAULTTONEAREST = 2 (Returns a handle to the display monitor that is nearest to the rectangle)
    ; get monitor name so we can get a handle to the monitor device context
    VarSetCapacity(MONITORINFOEX,104)
    NumPut(104,MONITORINFOEX)
    DllCall("GetMonitorInfo",PtrType,hMonitor,PtrType,&MONITORINFOEX)
    monitorName := StrGet(&MONITORINFOEX+40)
    ; get handle to monitor device context so we can get the dpi adjusted and actual screen sizes
    hdc := DllCall("CreateDC",Str,monitorName,PtrType,0,PtrType,0,PtrType,0)
    ; get dpi adjusted and actual screen sizes
    dpiAdjustedScreenHeight := DllCall("GetDeviceCaps",PtrType,hdc,Int,10) ; VERTRES = 10 (Height, in raster lines, of the screen)
    actualScreenHeight := DllCall("GetDeviceCaps",PtrType,hdc,Int,117) ; DESKTOPVERTRES = 117
    ; delete hdc as instructed
    DllCall("DeleteDC",PtrType,hdc)
    ; calculate dpi adjusted width and height
    dpiFactor := actualScreenHeight/dpiAdjustedScreenHeight ; this will be 1.0 if DPI is 100%
    dpiAdjusted_Width := Ceil(Width/dpiFactor)
    dpiAdjusted_Height := Ceil(Height/dpiFactor)

    ;-- Calculate offsets and update output variables
    NumPut(Offset_X:=(dpiAdjusted_Width-GWR_Width)//2,RECTPlus,16,"Int")
    NumPut(Offset_Y:=(dpiAdjusted_Height-GWR_Height)//2,RECTPlus,20,"Int")
    Return &RECTPlus
    }

GetParent(hWnd) {																									;-- get parent win handle of a window

	return DllCall("GetParent", "Ptr", hWnd, "Ptr")

}

GetWindow(hWnd,uCmd) {																						;-- DllCall wrapper for GetWindow function

	return DllCall( "GetWindow", "Ptr", hWnd, "uint", uCmd, "Ptr")

}

GetForegroundWindow() {																							;-- returns handle of the foreground window

	return DllCall("GetForeGroundWindow", "Ptr")

}

IsWindowVisible(hWnd) {																							;-- self explaining

	return DllCall("IsWindowVisible","Ptr",h)

}

IsFullScreen(hwnd) {																									;-- specific window is a fullscreen window?

  WinGet, Style, Style, ahk_id %hwnd%
  return !(Style & 0x40000) ; 0x40000 = WS_SIZEBOX

}

IsClosed(win, wait) {																									;-- AHK function (WinWaitClose) wrapper

	WinWaitClose, ahk_id %win%,, %wait%
	return ((ErrorLevel = 1) ? False : True)

}

getProcessBaseAddress(WindowTitle, MatchMode=3)	{												;--

	;--WindowTitle can be anything ahk_exe ahk_class etc
	mode :=  A_TitleMatchMode
	SetTitleMatchMode, %MatchMode%	;mode 3 is an exact match
	WinGet, hWnd, ID, %WindowTitle%
	; AHK32Bit A_PtrSize = 4 | AHK64Bit - 8 bytes
	BaseAddress := DllCall(A_PtrSize = 4
		? "GetWindowLong"
		: "GetWindowLongPtr", "Uint", hWnd, "Uint", -6)
	SetTitleMatchMode, %mode%	; In case executed in autoexec

	return BaseAddress
}

GetClassLong(hWnd, Param) {																					;--

    Static GetClassLong := A_PtrSize == 8 ? "GetClassLongPtr" : "GetClassLong"
    Return DllCall(GetClassLong, "Ptr", hWnd, "int", Param)

}

GetWindowLong(hWnd, Param) {																				;--

    ;GetWindowLong := A_PtrSize == 8 ? "GetWindowLongPtr" : "GetWindowLong"
    Return DllCall("GetWindowLong", "Ptr", hWnd, "int", Param)

}

GetClassStyles(Style) {																								;--

    Static CS := {0x1: "CS_VREDRAW"
    , 0x2: "CS_HREDRAW"
    , 0x8: "CS_DBLCLKS"
    , 0x20: "CS_OWNDC"
    , 0x40: "CS_CLASSDC"
    , 0x80: "CS_PARENTDC"
    , 0x200: "CS_NOCLOSE"
    , 0x800: "CS_SAVEBITS"
    , 0x1000: "CS_BYTEALIGNCLIENT"
    , 0x2000: "CS_BYTEALIGNWINDOW"
    , 0x4000: "CS_GLOBALCLASS"
    , 0x10000: "CS_IME"
    , 0x20000: "CS_DROPSHADOW"}

    Styles := " ("
    For k, v in CS {
        If (Style & k) {
            Styles .= v ", "
        }
    }

    Return RTrim(Styles, ", ") . ")"

}

GetTabOrderIndex(hWnd) {																						;--

    hParent := GetAncestor(hWnd)

    WinGet ControlList, ControlListHwnd, ahk_id %hParent%
    Index := 1
    Loop Parse, ControlList, `n
    {
        If (!IsWindowVisible(A_LoopField)) {
            Continue
        }

        WinGet Style, Style, ahk_id %A_LoopField%
        If !(Style & 0x10000) { ; WS_TABSTOP
            Continue
        }

        If (A_LoopField == hWnd) {
            Return Index
        }

        Index++
    }

    Return 0
}

GetCursor(CursorHandle) {																						;--

    Cursor := Cursors[CursorHandle]
    Return (Cursor != "") ? Cursor : CursorHandle

}

GetExtraStyle(hWnd) {																								;-- get Extra Styles from a gui/window

    WinGetClass Class, ahk_id %hWnd%

    If (Class == "SysListView32") {
        Message := 0x1037 ; LVM_GETEXTENDEDLISTVIEWSTYLE
    } Else If (Class == "SysTreeView32") {
        Message := 0x112D ; TVM_GETEXTENDEDSTYLE
    } Else If (Class == "SysTabControl32") {
        Message := 0x1335 ; TCM_GETEXTENDEDSTYLE
    } Else If (Class == "ToolbarWindow32") {
        Message := 0x455 ; TB_GETEXTENDEDSTYLE
    } Else If (Class == "ComboBox" && g_Style & 0x10) {
        Message := 0x409 ; CBEM_GETEXTENDEDSTYLE
    }

    SendMessage %Message%, 0, 0,, ahk_id %hWnd%
    Return Format("0x{:08X}", ErrorLevel)

}

GetToolbarItems(hToolbar) {																						;-- retrieves the text/names of all items of a toolbar

    WinGet PID, PID, ahk_id %hToolbar%

    If !(hProc := DllCall("OpenProcess", "UInt", 0x438, "Int", False, "UInt", PID, "Ptr")) {
        Return
    }

    If (A_Is64bitOS) {
        Try DllCall("IsWow64Process", "Ptr", hProc, "int*", Is32bit := true)
    } Else {
        Is32bit := True
    }

    RPtrSize := Is32bit ? 4 : 8
    TBBUTTON_SIZE := 8 + (RPtrSize * 3)

    SendMessage 0x418, 0, 0,, ahk_id %hToolbar% ; TB_BUTTONCOUNT
    ButtonCount := ErrorLevel

    IDs := [] ; Command IDs
    Loop %ButtonCount% {
        Address := DllCall("VirtualAllocEx", "Ptr", hProc, "Ptr", 0, "uPtr", TBBUTTON_SIZE, "UInt", 0x1000, "UInt", 4, "Ptr")

        SendMessage 0x417, % A_Index - 1, Address,, ahk_id %hToolbar% ; TB_GETBUTTON
        If (ErrorLevel == 1) {
            VarSetCapacity(TBBUTTON, TBBUTTON_SIZE, 0)
            DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", Address, "Ptr", &TBBUTTON, "uPtr", TBBUTTON_SIZE, "Ptr", 0)
            IDs.Push(NumGet(&TBBUTTON, 4, "Int"))
        }

        DllCall("VirtualFreeEx", "Ptr", hProc, "Ptr", Address, "UPtr", 0, "UInt", 0x8000) ; MEM_RELEASE
    }

    ToolbarItems := []
    Loop % IDs.Length() {
        ButtonID := IDs[A_Index]
        ;SendMessage 0x44B, %ButtonID% , 0,, ahk_id %hToolbar% ; TB_GETBUTTONTEXTW
        ;BufferSize := ErrorLevel * 2
        BufferSize := 128

        Address := DllCall("VirtualAllocEx", "Ptr", hProc, "Ptr", 0, "uPtr", BufferSize, "UInt", 0x1000, "UInt", 4, "Ptr")

        SendMessage 0x44B, %ButtonID%, Address,, ahk_id %hToolbar% ; TB_GETBUTTONTEXTW

        VarSetCapacity(Buffer, BufferSize, 0)
        DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", Address, "Ptr", &Buffer, "uPtr", BufferSize, "Ptr", 0)

        ToolbarItems.Push({"ID": IDs[A_Index], "String": Buffer})

        DllCall("VirtualFreeEx", "Ptr", hProc, "Ptr", Address, "UPtr", 0, "UInt", 0x8000) ; MEM_RELEASE
    }

    DllCall("CloseHandle", "Ptr", hProc)

    Return ToolbarItems
}

ControlGetTabs(hTab) {																								;-- retrieves the text of tabs in a tab control

    ; https://autohotkey.com/board/topic/70727-ahk-l-controlgettabs/
	; a Lexikos function

	; Parameters:
	; Control - the HWND, ClassNN or text of the control.
	;WinTitle - same as ControlGet, but unused if Control is a HWND.
	; WinText - as above.

	; Returns:
	; An array of strings on success.
	;An empty string on failure.

	; Requirements:
	; AutoHotkey v1.1.
	; A compatible tab control

    Static MAX_TEXT_LENGTH := 260
         , MAX_TEXT_SIZE := MAX_TEXT_LENGTH * (A_IsUnicode ? 2 : 1)

    WinGet PID, PID, ahk_id %hTab%

    ; Open the process for read/write and query info.
    ; PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION | PROCESS_QUERY_INFORMATION
    If !(hProc := DllCall("OpenProcess", "UInt", 0x438, "Int", False, "UInt", PID, "Ptr")) {
        Return
    }

    ; Should we use the 32-bit struct or the 64-bit struct?
    If (A_Is64bitOS) {
        Try DllCall("IsWow64Process", "Ptr", hProc, "int*", Is32bit := true)
    } Else {
        Is32bit := True
    }

    RPtrSize := Is32bit ? 4 : 8
    TCITEM_SIZE := 16 + RPtrSize * 3

    ; Allocate a buffer in the (presumably) remote process.
    remote_item := DllCall("VirtualAllocEx", "Ptr", hProc, "Ptr", 0
                         , "uPtr", TCITEM_SIZE + MAX_TEXT_SIZE
                         , "UInt", 0x1000, "UInt", 4, "Ptr") ; MEM_COMMIT, PAGE_READWRITE
    remote_text := remote_item + TCITEM_SIZE

    ; Prepare the TCITEM structure locally.
    VarSetCapacity(TCITEM, TCITEM_SIZE, 0)
    NumPut(1, TCITEM, 0, "UInt") ; mask (TCIF_TEXT)
    NumPut(remote_text, TCITEM, 8 + RPtrSize) ; pszText
    NumPut(MAX_TEXT_LENGTH, TCITEM, 8 + RPtrSize * 2, "Int") ; cchTextMax

    ; Write the local structure into the remote buffer.
    DllCall("WriteProcessMemory", "Ptr", hProc, "Ptr", remote_item, "Ptr", &TCITEM, "uPtr", TCITEM_SIZE, "Ptr", 0)

    Tabs := []
    VarSetCapacity(TabText, MAX_TEXT_SIZE)

    SendMessage 0x1304, 0, 0,, ahk_id %hTab% ; TCM_GETITEMCOUNT
    Loop % (ErrorLevel != "FAIL") ? ErrorLevel : 0 {
        ; Retrieve the item text.
        SendMessage, % (A_IsUnicode) ? 0x133C : 0x1305, A_Index - 1, remote_item,, ahk_id %hTab% ; TCM_GETITEM
        If (ErrorLevel == 1) { ; Success
            DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", remote_text, "Ptr", &TabText, "uPtr", MAX_TEXT_SIZE, "Ptr", 0)
        } Else {
            TabText := ""
        }

        Tabs[A_Index] := TabText
    }

    ; Release the remote memory and handle.
    DllCall("VirtualFreeEx", "Ptr", hProc, "Ptr", remote_item, "UPtr", 0, "UInt", 0x8000) ; MEM_RELEASE
    DllCall("CloseHandle", "Ptr", hProc)

    Return Tabs
}

GetHeaderInfo(hHeader) {																							;--
    ; Returns an object containing width and text for each item of a remote header control
    Static MAX_TEXT_LENGTH := 260
         , MAX_TEXT_SIZE := MAX_TEXT_LENGTH * (A_IsUnicode ? 2 : 1)

    WinGet PID, PID, ahk_id %hHeader%

    ; Open the process for read/write and query info.
    ; PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION | PROCESS_QUERY_INFORMATION
    If !(hProc := DllCall("OpenProcess", "UInt", 0x438, "Int", False, "UInt", PID, "Ptr")) {
        Return
    }

    ; Should we use the 32-bit struct or the 64-bit struct?
    If (A_Is64bitOS) {
        Try DllCall("IsWow64Process", "Ptr", hProc, "int*", Is32bit := true)
    } Else {
        Is32bit := True
    }

    RPtrSize := Is32bit ? 4 : 8
    cbHDITEM := (4 * 6) + (RPtrSize * 6)

    ; Allocate a buffer in the (presumably) remote process.
    remote_item := DllCall("VirtualAllocEx", "Ptr", hProc, "Ptr", 0
                         , "uPtr", cbHDITEM + MAX_TEXT_SIZE
                         , "UInt", 0x1000, "UInt", 4, "Ptr") ; MEM_COMMIT, PAGE_READWRITE
    remote_text := remote_item + cbHDITEM

    ; Prepare the HDITEM structure locally.
    VarSetCapacity(HDITEM, cbHDITEM, 0)
    NumPut(0x3, HDITEM, 0, "UInt") ; mask (HDI_WIDTH | HDI_TEXT)
    NumPut(remote_text, HDITEM, 8, "Ptr") ; pszText
    NumPut(MAX_TEXT_LENGTH, HDITEM, 8 + RPtrSize * 2, "Int") ; cchTextMax

    ; Write the local structure into the remote buffer.
    DllCall("WriteProcessMemory", "Ptr", hProc, "Ptr", remote_item, "Ptr", &HDITEM, "uPtr", cbHDITEM, "Ptr", 0)

    HDInfo := {}
    VarSetCapacity(HDText, MAX_TEXT_SIZE)

    SendMessage 0x1200, 0, 0,, ahk_id %hHeader% ; HDM_GETITEMCOUNT
    Loop % (ErrorLevel != "FAIL") ? ErrorLevel : 0 {
        ; Retrieve the item text.
        SendMessage, % (A_IsUnicode) ? 0x120B : 0x1203, A_Index - 1, remote_item,, ahk_id %hHeader% ; HDM_GETITEMW
        If (ErrorLevel == 1) { ; Success
            DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", remote_item, "Ptr", &HDITEM, "uPtr", MAX_TEXT_SIZE, "Ptr", 0)
            DllCall("ReadProcessMemory", "Ptr", hProc, "Ptr", remote_text, "Ptr", &HDText, "uPtr", MAX_TEXT_SIZE, "Ptr", 0)
        } Else {
            TabText := ""
        }

        HDInfo.Push({"Width": NumGet(HDITEM, 4, "UInt"), "Text": HDText})
    }

    ; Release the remote memory and handle.
    DllCall("VirtualFreeEx", "Ptr", hProc, "Ptr", remote_item, "UPtr", 0, "UInt", 0x8000) ; MEM_RELEASE
    DllCall("CloseHandle", "Ptr", hProc)

    Return HDInfo
}

GetClientCoords(hWnd, ByRef x, ByRef y) {																	;--
    VarSetCapacity(POINT, 8, 0)
    NumPut(x, POINT, 0, "Int")
    NumPut(y, POINT, 4, "Int")
    hParent := GetParent(hWnd)
    DllCall("ScreenToClient", "Ptr", (hParent == 0 ? hWnd : hParent), "Ptr", &POINT)
    x := NumGet(POINT, 0, "Int")
    y := NumGet(POINT, 4, "Int")
}

GetWindowCoords(hWnd, ByRef x, ByRef y) {																;--
    hParent := GetParent(hWnd)
    WinGetPos px, py,,, % "ahk_id" . (hParent == 0 ? hWnd : hParent)
    x := x - px
    y := y - py
}

GetWindowPos(hWnd, ByRef X, ByRef Y, ByRef W, ByRef H) {										;--
    VarSetCapacity(RECT, 16, 0)
    DllCall("GetWindowRect", "Ptr", hWnd, "Ptr", &RECT)
    DllCall("MapWindowPoints", "Ptr", 0, "Ptr", GetParent(hWnd), "Ptr", &RECT, "UInt", 2)
    X := NumGet(RECT, 0, "Int")
    Y := NumGet(RECT, 4, "Int")
    w := NumGet(RECT, 8, "Int") - X
    H := NumGet(RECT, 12, "Int") - Y
}

GetWindowPlacement(hWnd) {																					;--
    VarSetCapacity(WINDOWPLACEMENT, 44, 0)
    NumPut(44, WINDOWPLACEMENT)
    DllCall("GetWindowPlacement", "Ptr", hWnd, "Ptr", &WINDOWPLACEMENT)
    Result := {}
    Result.x := NumGet(WINDOWPLACEMENT, 7 * 4, "UInt")
    Result.y := NumGet(WINDOWPLACEMENT, 8 * 4, "UInt")
    Result.w := NumGet(WINDOWPLACEMENT, 9 * 4, "UInt") - Result.x
    Result.h := NumGet(WINDOWPLACEMENT, 10 * 4, "UInt") - Result.y
    Result.showCmd := NumGet(WINDOWPLACEMENT, 8, "UInt")
    ; 1 = normal, 2 = minimized, 3 = maximized
    Return Result
}

GetWindowInfo(hWnd) {																							;--
    NumPut(VarSetCapacity(WINDOWINFO, 60, 0), WINDOWINFO)
    DllCall("GetWindowInfo", "Ptr", hWnd, "Ptr", &WINDOWINFO)
    wi := Object()
    wi.WindowX := NumGet(WINDOWINFO, 4, "Int")
    wi.WindowY := NumGet(WINDOWINFO, 8, "Int")
    wi.WindowW := NumGet(WINDOWINFO, 12, "Int") - wi.WindowX
    wi.WindowH := NumGet(WINDOWINFO, 16, "Int") - wi.WindowY
    wi.ClientX := NumGet(WINDOWINFO, 20, "Int")
    wi.ClientY := NumGet(WINDOWINFO, 24, "Int")
    wi.ClientW := NumGet(WINDOWINFO, 28, "Int") - wi.ClientX
    wi.ClientH := NumGet(WINDOWINFO, 32, "Int") - wi.ClientY
    wi.Style   := NumGet(WINDOWINFO, 36, "UInt")
    wi.ExStyle := NumGet(WINDOWINFO, 40, "UInt")
    wi.Active  := NumGet(WINDOWINFO, 44, "UInt")
    wi.BorderW := NumGet(WINDOWINFO, 48, "UInt")
    wi.BorderH := NumGet(WINDOWINFO, 52, "UInt")
    wi.Atom    := NumGet(WINDOWINFO, 56, "UShort")
    wi.Version := NumGet(WINDOWINFO, 58, "UShort")
    Return wi
}

GetOwner(hWnd) {																									;--
    Return DllCall("GetWindow", "Ptr", hWnd, "UInt", 4) ; GW_OWNER
}

FindWindow(WinTitle, WinClass:="", WinText:="", ParentTitle:="", 								;-- Finds the requested window,and return it's ID
ParentClass:="", DetectHiddenWins:="off", DectectHiddenTexts:="off") {

	; 0 if it wasn't found or chosen from a list
	; originally from Evan Casey Copyright (c) under MIT License.
	; changed for my purposes for Addendum for AlbisOnWindows by Ixiko on 04-06-2018
	; this version searches for ParentWindows if there is no WinText to check changed on 04-27-2018

	HWins:= A_DetectHiddenWindows
	HText:= A_DetectHiddenText
	DetectHiddenWindows, %DetectHiddenWins%
	DetectHiddenText, %DetectHiddenTexts%

		If Instr(WinClass, "Afx:") {
				SetTitleMatchMode, RegEx
		} else {
				SetTitleMatchMode, RegEx
		}

	if (WinClass = "")
		sSearchWindow := WinTitle
	else
		sSearchWindow := WinTitle . " ahk_class " . WinClass

	WinGet, nWindowArray, List, %sSearchWindow%, %WinText%

	;Loop for more windows - this is looks for ParentWindow
	if (nWindowArray > 1) {

		Loop %nWindowArray% {

			prev := DllCall("GetWindow", "ptr", hwnd, "uint", GW_HWNDPREV:=3, "ptr")			;GetParentWindowID
					if prev {
									DetectHiddenWindows On
									WinGetTitle title, ahk_id %prev%
									WinGetClass class, ahk_id %prev%
									If (titel == ParentTitle) AND (class == ParentClass) {
										sSelectedWinID := % nWindowArray%A_Index%
										break
									}

						}
		}

	} else if (nWindowArray == 1) {
		sSelectedWinID := nWindowArray1
	} else if (nWindowArray == 0) {
		sSelectedWinID := 0
	}

	DetectHiddenWindows, %HWins%
	DetectHiddenText, %HTexts%

	return sSelectedWinID
}

ShowWindow(hWnd, nCmdShow := 1) {																	;--
    DllCall("ShowWindow", "Ptr", hWnd, "Int", nCmdShow)
}

IsWindow(hWnd) {																										;--
    Return DllCall("IsWindow", "Ptr", hWnd)
}

IsWindowVisible(hWnd) {																							;--
    Return DllCall("IsWindowVisible", "Ptr", hWnd)
}

GetClassName(hWnd) {																								;-- wrapper for AHK WinGetClass function

	WinGetClass Class, ahk_id %hWnd%
    Return Class
}

WinForms_GetClassNN(WinID, fromElement, ElementName) {									;-- Check which ClassNN an element has

	; function by Ixiko 2018 last_change 28.01.2018
	/* Funktionsinfo: Deutsch
		;Achtung: da manchmal 2 verschiedene Elemente den gleichen Namen enthalten können hat die Funktion einen zusätzlichen Parameter: "fromElement"
		;die Funktion untersucht ob das hier angebene Element im ClassNN enthalten ist zb. Button in WindowsForms10.BUTTON.app.0.378734a2
		;die Groß- und Kleinschreibung ist nicht zu beachten
	*/

	/* function info: english
		;Caution: sometimes 2 and more different elements in a gui can contain the same name, therefore the function has an additional parameter: "fromElement"
		;it examines whether the element specified here is contained in the ClassNN, eg. Button in WindowsForms10.BUTTON.app.0.378734a2
		;this function is: case-insensitive
	*/

	WinGet, CtrlList, ControlList, ahk_id %WinID%

	Loop, Parse, CtrlList, `n
	{
			classnn:= A_LoopField
			ControlGetText, Name, %classnn% , ahk_id %WinID%
			If Instr(Name, ElementName, false) and Instr(classnn, fromElement, false)
																				break
			;sleep, 2000
		}


return classNN
}
;<
FindChildWindow(Parent, ChildWinTitle, DetectHiddenWindow="On") {						;-- finds child window hwnds of the parent window

/* 																						READ THIS FOR MORE INFORMATIONS																														|
												a function from AHK-Forum : https://autohotkey.com/board/topic/46786-enumchildwindows/																					|
																			it has been modified by IXIKO last change on May 10, 2018																										|
																																																																			|
	-finds childWindow handles from a parent window by using Name and/or class or only the WinID of the parentWindow																					   		|
	-it returns a comma separated list of hwnds or nothing if there's no match																																								|
																																																																			|
	-Parent parameter is an array. Pass the following {Key:Value} pairs like this - WinTitle: "Name of window", WinClass: "Class (NN) Name", WinID: ParentWinID									|
																																																																			*/

		detect:= A_DetectHiddenWindows
		global SearchChildTitle
		global ChildHwnds =

		;build ParentWinTitle parameter from ParentObject
		If Parent.WinID {
				id:= Parent.WinID
				ParentWinTitle:= "ahk_id " . id
		} else {
			ParentWinTitle:= Parent.WinTitle
			If Parent.WinClass
					ParentWinTitle.= " ahk_class " Parent.WinClass
		}

		WinGet, active_id, ID, %ParentWinTitle%

		DetectHiddenWindows %DetectHiddenWindows%  ; Due to fast-mode, this setting will go into effect for the callback too.

		; For performance and memory conservation, call RegisterCallback() only once for a given callback:
		if not EnumAddress  ; Fast-mode is okay because it will be called only from this thread:
			EnumAddress := RegisterCallback("EnumChildWindow") ; , "Fast")

		; Pass control to EnumWindows(), which calls the callback repeatedly:
		SearchChildTitle = %ChildWinTitle%

		result:= DllCall("EnumChildWindows", UInt, active_id, UInt, EnumAddress, UInt, 0)

		DetectHiddenWindows %detect%

		ChildHwnds:= SubStr(ChildHwnds, 1, StrLen(ChildHwnds)-1)

		return ChildHwnds
}

EnumChildWindow(hwnd, lParam) { 																			;-- sub function of FindChildWindow

	global ChildHwnds
	global SearchChildTitle

	WinGetTitle, childtitle, ahk_id %hwnd%
	If InStr(childtitle, SearchChildTitle) {
			ChildHwnds.= hwnd . "`;"
		}

    return true  ; Tell EnumWindows() to continue until all windows have been enumerated.
}
;>
WinGetMinMaxState(hwnd) {																						;-- get state if window ist maximized or minimized

	;; this function is from AHK-Forum: https://autohotkey.com/board/topic/13020-how-to-maximize-a-childdocument-window/
	;; it returns z for maximized("zoomed") or i for minimized("iconic")
	;; it's also work on MDI Windows - use hwnd you can get from FindChildWindow()

	; Check if maximized
	zoomed := DllCall("IsZoomed", "UInt", hwnd)
	; Check if minimized
	iconic := DllCall("IsIconic", "UInt", hwnd)

	return (zoomed>iconic) ? "z":"i"
}

;}

;{ MENU - get
GetMenu(hWnd) {																										;-- returns hMenu handle
	;; only wraps DllCall(GetMenu)
    Return DllCall("GetMenu", "Ptr", hWnd)
}

GetSubMenu(hMenu, nPos) {																						;--
    Return DllCall("GetSubMenu", "Ptr", hMenu, "Int", nPos)
}

GetMenuItemCount(hMenu) {																					;--
    Return DllCall("GetMenuItemCount", "Ptr", hMenu)
}

GetMenuItemID(hMenu, nPos) {																					;--
    Return DllCall("GetMenuItemID", "Ptr", hMenu, "Int", nPos)
}

GetMenuString(hMenu, uIDItem) {																				;--
    ; uIDItem: the zero-based relative position of the menu item
    Local lpString, MenuItemID
    VarSetCapacity(lpString, 4096)
    If !(DllCall("GetMenuString", "Ptr", hMenu, "UInt", uIDItem, "Str", lpString, "Int", 4096, "UInt", 0x400)) {
        MenuItemID := GetMenuItemID(hMenu, uIDItem)
        If (MenuItemID > -1) {
            Return "SEPARATOR"
        } Else {
            Return (GetSubMenu(hMenu, uIDItem)) ? "SUBMENU" : "ERROR"
        }
    }
    Return lpString
}

MenuGetAll(hwnd) {																									;-- this function and MenuGetAll_sub return all Menu commands from the choosed menu

    if !menu := DllCall("GetMenu", "ptr", hwnd, "ptr")
        return ""
    MenuGetAll_sub(menu, "", cmds)
    return cmds

}

MenuGetAll_sub(menu, prefix, ByRef cmds) {																;-- described above

    Loop % DllCall("GetMenuItemCount", "ptr", menu) {

        VarSetCapacity(itemString, 2000)

        if !DllCall("GetMenuString", "ptr", menu, "int", A_Index-1, "str", itemString, "int", 1000, "uint", 0x400)
            continue

        StringReplace itemString, itemString, &
        itemID := DllCall("GetMenuItemID", "ptr", menu, "int", A_Index-1)
        if (itemID = -1)
        if subMenu := DllCall("GetSubMenu", "ptr", menu, "int", A_Index-1, "ptr") {

            MenuGetAll_sub(subMenu, prefix itemString " > ", cmds)
            continue

        }
        cmds .= itemID "`t" prefix RegExReplace(itemString, "`t.*") "`n"
    }
}

; these 5 belongs together
GetContextMenuState(hWnd, Position) {																		;-- returns the state of a menu entry
  WinGetClass, WindowClass, ahk_id %hWnd%
  if WindowClass <> #32768
  {
   return -1
  }
  SendMessage, 0x01E1, , , , ahk_id %hWnd%
  ;Errorlevel is set by SendMessage. It contains the handle to the menu
  hMenu := errorlevel

  ;We need to allocate a struct
  VarSetCapacity(MenuItemInfo, 60, 0)
  ;Set Size of Struct to the first member
  InsertInteger(48, MenuItemInfo, 0, 4)
  ;Get only Flags from dllcall GetMenuItemInfo MIIM_TYPE = 1
  InsertInteger(1, MenuItemInfo, 4, 4)

  ;GetMenuItemInfo: Handle to Menu, Index of Position, 0=Menu identifier / 1=Index
  InfoRes := DllCall("user32.dll\GetMenuItemInfo",UInt,hMenu, Uint, Position, uint, 1, "int", &MenuItemInfo)

  InfoResError := errorlevel
  LastErrorRes := DllCall("GetLastError")
  if InfoResError <> 0
     return -1
  if LastErrorRes != 0
     return -1

  ;Get Flag from struct
  GetMenuItemInfoRes := ExtractInteger(MenuItemInfo, 12, false, 4)
  /*
  IsEnabled = 1
  if GetMenuItemInfoRes > 0
     IsEnabled = 0
  return IsEnabled
  */
  return GetMenuItemInfoRes
}

GetContextMenuID(hWnd, Position) {																			;-- returns the ID of a menu entry
  WinGetClass, WindowClass, ahk_id %hWnd%
  if WindowClass <> #32768
  {
   return -1
  }
  SendMessage, 0x01E1, , , , ahk_id %hWnd%
  ;Errorlevel is set by SendMessage. It contains the handle to the menu
  hMenu := errorlevel

  ;UINT GetMenuItemID(          HMENU hMenu,    int nPos);
  InfoRes := DllCall("user32.dll\GetMenuItemID",UInt,hMenu, Uint, Position)

  InfoResError := errorlevel
  LastErrorRes := DllCall("GetLastError")
  if InfoResError <> 0
     return -1
  if LastErrorRes != 0
     return -1

  return InfoRes
}

GetContextMenuText(hWnd, Position) {																		;-- returns the text of a menu entry (standard windows context menus only!!!)
  WinGetClass, WindowClass, ahk_id %hWnd%
  if WindowClass <> #32768
  {
   return -1
  }
  SendMessage, 0x01E1, , , , ahk_id %hWnd%
  ;Errorlevel is set by SendMessage. It contains the handle to the menu
  hMenu := errorlevel

  ;We need to allocate a struct
  VarSetCapacity(MenuItemInfo, 200, 0)
  ;Set Size of Struct (48) to the first member
  InsertInteger(48, MenuItemInfo, 0, 4)
  ;Retrieve string MIIM_STRING = 0x40 = 64 (/ MIIM_TYPE = 0x10 = 16)
  InsertInteger(64, MenuItemInfo, 4, 4)
  ;Set type - Get only size of string we need to allocate
  ;InsertInteger(0, MenuItemInfo, 8, 4)
  ;GetMenuItemInfo: Handle to Menu, Index of Position, 0=Menu identifier / 1=Index
  InfoRes := DllCall("user32.dll\GetMenuItemInfo",UInt,hMenu, Uint, Position, uint, 1, "int", &MenuItemInfo)
  if InfoRes = 0
     return -1

  InfoResError := errorlevel
  LastErrorRes := DllCall("GetLastError")
  if InfoResError <> 0
     return -1
  if LastErrorRes <> 0
     return -1

  ;Get size of string from struct
  GetMenuItemInfoRes := ExtractInteger(MenuItemInfo, 40, false, 4)
  ;If menu is empty return
  If GetMenuItemInfoRes = 0
     return "{Empty String}"

  ;+1 should be enough, we'll use 2
  GetMenuItemInfoRes += 2
  ;Set capacity of string that will be filled by windows
  VarSetCapacity(PopupText, GetMenuItemInfoRes, 0)
  ;Set Size plus 0 terminator + security ;-)
  InsertInteger(GetMenuItemInfoRes, MenuItemInfo, 40, 4)
  InsertInteger(&PopupText, MenuItemInfo, 36, 4)

  InfoRes := DllCall("user32.dll\GetMenuItemInfo",UInt,hMenu, Uint, Position, uint, 1, "int", &MenuItemInfo)
  if InfoRes = 0
     return -1

  InfoResError := errorlevel
  LastErrorRes := DllCall("GetLastError")
  if InfoResError <> 0
     return -1
  if LastErrorRes <> 0
     return -1

  return PopupText
}


;}

;{ MISC

ChooseColor(ByRef Color, hOwner := 0) {																	;--
    rgbResult := ((Color & 0xFF) << 16) + (Color & 0xFF00) + ((Color >> 16) & 0xFF)

    VarSetCapacity(CUSTOM, 64, 0)
    NumPut(VarSetCapacity(CHOOSECOLOR, A_PtrSize * 9, 0), CHOOSECOLOR, 0)
    NumPut(hOwner, CHOOSECOLOR, A_PtrSize)
    NumPut(rgbResult, CHOOSECOLOR, A_PtrSize * 3)
    NumPut(&CUSTOM, CHOOSECOLOR, A_PtrSize * 4) ; COLORREF *lpCustColors
    NumPut(0x103, CHOOSECOLOR, A_PtrSize * 5) ; Flags: CC_ANYCOLOR | CC_RGBINIT | CC_FULLOPEN

    RetVal := DllCall("comdlg32\ChooseColorA", "Str", CHOOSECOLOR)
    If (ErrorLevel != 0 || RetVal == 0) {
        Return False
    }

    rgbResult := NumGet(CHOOSECOLOR, A_PtrSize * 3)
    Color := (rgbResult & 0xFF00) + ((rgbResult & 0xFF0000) >> 16) + ((rgbResult & 0xFF) << 16)
    Color := Format("0x{:06X}", Color)
    Return True
}

GetWindowIcon(hWnd, Class, TopLevel := False) {														;--

	Static Classes := {0:0
    , "#32770": 3
    , "Button": 4
    , "CheckBox": 5
    , "ComboBox": 6
    , "SysDateTimePick32": 7
    , "Edit": 8
    , "GroupBox": 9
    , "msctls_hotkey32": 10
    , "Icon": 11
    , "SysLink": 12
    , "ListBox": 13
    , "SysListView32": 14
    , "SysMonthCal32": 15
    , "Picture": 16
    , "msctls_progress32": 17
    , "Radio": 18
    , "RebarWindow32": 25
    , "RichEdit": 19
    , "Separator": 20
    , "msctls_trackbar32": 21
    , "msctls_statusbar32": 22
    , "SysTabControl32": 23
    , "Static": 24
    , "ToolbarWindow32": 25
    , "tooltips_class32": 26
    , "SysTreeView32": 27
    , "msctls_updown32": 28
    , "Internet Explorer_Server": 29
    , "Scintilla": 30
    , "ScrollBar": 31
    , "SysHeader32": 32}

    If (Class == "Button") {
        WinGet Style, Style, ahk_id %hWnd%
        Type := Style & 0xF
        If (Type == 7) {
            Class := "GroupBox"
        } Else If (Type ~= "2|3|5|6") {
            Class := "CheckBox"
        } Else If (Type ~= "4|9") {
            Class := "Radio"
        } Else {
            Class := "Button"
        }
    } Else If (Class == "Static") {
        WinGet Style, Style, ahk_id %hWnd%
        Type := Style & 0x1F ; SS_TYPEMASK
        If (Type == 3) {
            Class := "Icon"
        } Else If (Type == 14) {
            Class := "Picture"
        } Else If (Type == 0x10) {
            Class := "Separator"
        } Else {
            Class := "Static"
        }
    } Else If (InStr(Class, "RICHED", True) == 1) {
        Class := "RichEdit" ; RICHEDIT50W
    }

    Icon := Classes[Class]
    If (Icon != "") {
        Return Icon
    }

    SendMessage 0x7F, 2, 0,, ahk_id %hWnd% ; WM_GETICON, ICON_SMALL2
    hIcon := ErrorLevel

    If (hIcon == 0 && TopLevel) {
        WinGet ProcessPath, ProcessPath, ahk_id %hWnd%
        hIcon := GetFileIcon(ProcessPath)
    }

    IconIndex := (hIcon) ? IL_Add(ImageList, "HICON: " . hIcon) : 1
    Return IconIndex
}

GetImageType(PID) {																									;--

	; PROCESS_QUERY_INFORMATION
    hProc := DllCall("OpenProcess", "UInt", 0x400, "Int", False, "UInt", PID, "Ptr")
    If (!hProc) {
        Return "N/A"
    }

    If (A_Is64bitOS) {
        ; Determines whether the specified process is running under WOW64.
        Try DllCall("IsWow64Process", "Ptr", hProc, "Int*", Is32Bit := True)
    } Else {
        Is32Bit := True
    }

    DllCall("CloseHandle", "Ptr", hProc)

    Return (Is32Bit) ? "32-bit" : "64-bit"
}

GetStatusBarText(hWnd) {																							;--
    SB_Text := ""
    hParentWnd := GetParent(hWnd)

    SendMessage 0x406, 0, 0,, ahk_id %hWnd% ; SB_GETPARTS
    Count := ErrorLevel
    If (Count != "FAIL") {
        Loop %Count% {
            StatusBarGetText PartText, %A_Index%, ahk_id %hParentWnd%
            SB_Text .= PartText . "|"
        }
    }

    Return SubStr(SB_Text, 1, -1)
}

GetAncestor(hWnd, Flag := 2) {																					;--
    Return DllCall("GetAncestor", "Ptr", hWnd, "UInt", Flag)
}

OnMessage(0x24, "MinMaxInfo")
MinMaxInfo(W, L, M, H) {																							;--
	Static MIEX := 0, Dummy := NumPut(VarSetCapacity(MIEX, 40 + (32 << !!A_IsUnicode)), MIEX, 0, "UInt")
	Critical
	If (HMON := DllCall("User32.dll\MonitorFromWindow", "Ptr", H, "UInt", 0, "UPtr")) {
		If DllCall("User32.dll\GetMonitorInfo", "Ptr", HMON, "Ptr", &MIEX) {
			W := NumGet(MIEX, 28, "Int") - NumGet(MIEX, 20, "Int")
			H := NumGet(MIEX, 32, "Int") - NumGet(MIEX, 24, "Int")
			NumPut(W - NumGet(L + 16, "Int"), L + 8, "Int")
			NumPut(H - NumGet(L + 20, "Int"), L + 12, "Int")
		}
	}
}

;}

;}

    ;{Gui - interacting
SureControlClick(CName, WinTitle, WinText="") { 														;--Window Activation + ControlDelay to -1 + checked if control received the click
		;by Ixiko 2018
		Critical
		WinActivate, %WTitle%, %WinText%
			WinWaitActive, %WTitle%, %WinText%, 3

		SetControlDelay -1
			ControlClick, %CName%, %WinTitle%, %WinText%,,, NA		;If the click does not work then he tries a little differently
				If ErrorLevel
					ControlClick, %CName%, %WinTitle%, %WinText%

		SetControlDelay 20


	return ErrorLevel
}

SureControlCheck(CName, WinTitle, WinText="") { 													;-- Window Activation + ControlDelay to -1 + Check if the control is really checked now
	;by Ixiko 2018
	;BlockInput, On
		Critical
		WinActivate, %WTitle%, %WinText%
			WinWaitActive, %WTitle%, %WinText%, 1

		SetControlDelay -1
			Loop {
				Control, Check, , %CName%, %WinTitle%, %WinText%
					sleep, 10
				ControlGet, isornot, checked, ,  %CName%, %WinTitle%, %WinText%
			} until (isornot = 1)

		SetControlDelay 20

	;BlockInput, Off

	return ErrorLevel
}

;{ControlClick Double Click Example
ControlClick2(X, Y, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")  {			;--
  hwnd:=ControlFromPoint(X, Y, WinTitle, WinText, cX, cY
                             , ExcludeTitle, ExcludeText)
  PostMessage, 0x201, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDOWN
  PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP
  PostMessage, 0x203, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDBLCLCK
  PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP
}

ControlFromPoint(X, Y, WinTitle="", WinText="", ByRef cX="", ByRef cY="", ExcludeTitle="", ExcludeText="") {	;--
    static EnumChildFindPointProc=0
    if !EnumChildFindPointProc
        EnumChildFindPointProc := RegisterCallback("EnumChildFindPoint","Fast")

    if !(target_window := WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText))
        return false

    VarSetCapacity(rect, 16)
    DllCall("GetWindowRect","uint",target_window,"uint",&rect)
    VarSetCapacity(pah, 36, 0)
    NumPut(X + NumGet(rect,0,"int"), pah,0,"int")
    NumPut(Y + NumGet(rect,4,"int"), pah,4,"int")
    DllCall("EnumChildWindows","uint",target_window,"uint",EnumChildFindPointProc,"uint",&pah)
    control_window := NumGet(pah,24) ? NumGet(pah,24) : target_window
    DllCall("ScreenToClient","uint",control_window,"uint",&pah)
    cX:=NumGet(pah,0,"int"), cY:=NumGet(pah,4,"int")
    return control_window
}

EnumChildFindPoint(aWnd, lParam) {																		;--
    if !DllCall("IsWindowVisible","uint",aWnd)
        return true
    VarSetCapacity(rect, 16)
    if !DllCall("GetWindowRect","uint",aWnd,"uint",&rect)
        return true
    pt_x:=NumGet(lParam+0,0,"int"), pt_y:=NumGet(lParam+0,4,"int")
    rect_left:=NumGet(rect,0,"int"), rect_right:=NumGet(rect,8,"int")
    rect_top:=NumGet(rect,4,"int"), rect_bottom:=NumGet(rect,12,"int")
    if (pt_x >= rect_left && pt_x <= rect_right && pt_y >= rect_top && pt_y <= rect_bottom)
    {
        center_x := rect_left + (rect_right - rect_left) / 2
        center_y := rect_top + (rect_bottom - rect_top) / 2
        distance := Sqrt((pt_x-center_x)**2 + (pt_y-center_y)**2)
        update_it := !NumGet(lParam+24)
        if (!update_it)
        {
            rect_found_left:=NumGet(lParam+8,0,"int"), rect_found_right:=NumGet(lParam+8,8,"int")
            rect_found_top:=NumGet(lParam+8,4,"int"), rect_found_bottom:=NumGet(lParam+8,12,"int")
            if (rect_left >= rect_found_left && rect_right <= rect_found_right
                && rect_top >= rect_found_top && rect_bottom <= rect_found_bottom)
                update_it := true
            else if (distance < NumGet(lParam+28,0,"double")
                && (rect_found_left < rect_left || rect_found_right > rect_right
                 || rect_found_top < rect_top || rect_found_bottom > rect_bottom))
                 update_it := true
        }
        if (update_it)
        {
            NumPut(aWnd, lParam+24)
            DllCall("RtlMoveMemory","uint",lParam+8,"uint",&rect,"uint",16)
            NumPut(distance, lParam+28, 0, "double")
        }
    }
    return true
}
;}

WinWaitForMinimized(ByRef winID, timeOut = 1000) {												;--
  ; Function:  WinWaitForMinimized
;              waits for the window winID to minimize or until timeout,
;              whichever comes first (used to delay other actions until a
;              minimize message is handled and completed)
; Parm1:     winID - ID of window to wait for minimization
; Parm2:     timeOut - optional - timeout in milliseconds to wait
; wait until minimized (or timeOut)
   iterations := timeOut/10
   loop,%iterations%
   {
      WinGet,winMinMax,MinMax,ahk_id %winID%
      if (winMinMax = -1)
         break
      sleep 10
   }
}

CenterWindow(aWidth,aHeight) {																				;--
  ; Given a the window's width and height, calculates where to position its upper-left corner
  ; so that it is centered EVEN IF the task bar is on the left side or top side of the window.
  ; This does not currently handle multi-monitor systems explicitly, since those calculations
  ; require API functions that don't exist in Win95/NT (and thus would have to be loaded
  ; dynamically to allow the program to launch).  Therefore, windows will likely wind up
  ; being centered across the total dimensions of all monitors, which usually results in
  ; half being on one monitor and half in the other.  This doesn't seem too terrible and
  ; might even be what the user wants in some cases (i.e. for really big windows).

	static rect:=Struct("left,top,right,bottom"),SPI_GETWORKAREA:=48,pt:=Struct("x,y")
	DllCall("SystemParametersInfo","Int",SPI_GETWORKAREA,"Int", 0,"PTR", rect[],"Int", 0)  ; Get desktop rect excluding task bar.
	; Note that rect.left will NOT be zero if the taskbar is on docked on the left.
	; Similarly, rect.top will NOT be zero if the taskbar is on docked at the top of the screen.
	pt.x := rect.left + (((rect.right - rect.left) - aWidth) / 2)
	pt.y := rect.top + (((rect.bottom - rect.top) - aHeight) / 2)
	return pt
}

GuiCenterButtons(strWindow, intInsideHorizontalMargin := 10, 									;--
intInsideVerticalMargin := 0, intDistanceBetweenButtons := 20, arrControls*) {
; This is a variadic function. See: http://ahkscript.org/docs/Functions.htm#Variadic
;------------------------------------------------------------

	DetectHiddenWindows, On
	Gui, Show, Hide
	WinGetPos, , , intWidth, , %strWindow%

	intMaxControlWidth := 0
	intMaxControlHeight := 0
	for intIndex, strControl in arrControls
	{
		GuiControlGet, arrControlPos, Pos, %strControl%
		if (arrControlPosW > intMaxControlWidth)
			intMaxControlWidth := arrControlPosW
		if (arrControlPosH > intMaxControlHeight)
			intMaxControlHeight := arrControlPosH
	}

	intMaxControlWidth := intMaxControlWidth + intInsideHorizontalMargin
	intButtonsWidth := (arrControls.MaxIndex() * intMaxControlWidth) + ((arrControls.MaxIndex()  - 1) * intDistanceBetweenButtons)
	intLeftMargin := (intWidth - intButtonsWidth) // 2

	for intIndex, strControl in arrControls
		GuiControl, Move, %strControl%
			, % "x" . intLeftMargin + ((intIndex - 1) * intMaxControlWidth) + ((intIndex - 1) * intDistanceBetweenButtons)
			. " w" . intMaxControlWidth
			. " h" . intMaxControlHeight + intInsideVerticalMargin
}

CenterControl(hWnd,hCtrl,X=1,Y=1) {																		;--
;------------------------------------------------------------------------------------------------------------------------
;Function:    CenterControl (by Banane: http://de.autohotkey.com/forum/viewtopic.php?p=67802#67802)
;Parameters:  hWnd  = Handle of a Window (can be obtained using "WinExist()")
;             hCtrl = Handle of a Control (can be obtained using the "Hwnd" option when creating the control)
;             X     = Center the Control horizontally if X is 1
;             Y     = Center the Control vertically if Y is 1
;Description: Moves the specified control within the center of the specified window
;Returnvalue: 0 - Invalid Window / Control Handle, or the Window / Control has a size of 0
;------------------------------------------------------------------------------------------------------------------------

 static Border,CaptionSmall,CaptionNormal

  ;Retrieve Size of Border and Caption, if this is the first time this function is called
  If (!CaptionNormal) {
    SysGet, Border, 5        ;Border Width
    SysGet, CaptionNormal, 4 ;Window Caption
    SysGet, CaptionSmall, 51 ;Window Caption with Toolwindow Style
  }

  ;Only continue if valid handles passed
  If (!hWnd || !hCtrl)
    Return 0

  ;Retrieve the size of the control and window
  ControlGetPos,,, cW, cH,, % "ahk_id " hCtrl
  WinGetPos,,, wW, wH, % "ahk_id " hWnd
  ;Only continue if the control and window are visible (and don't have a size of 0)
  If ((cW = "" || cH = "") || (wW = "" || wH = ""))
    Return 0

  ;Retrieve the window styles
  WinGet, Styles, Style, % "ahk_id " hWnd
  WinGet, ExStyles, ExStyle, % "ahk_id " hWnd

  ;Calculate the offset
  If (Styles & 0xC00000) ;If window has the "Caption" flag
    If (ExStyles & 0x00000080) ;If window has the "Toolwindow" flag
      Caption := CaptionSmall
    Else Caption := CaptionNormal
  Else Caption := 1

  ;Calculate the new position and apply it to the control
  ControlMove,, % (X = 1) ? Round((wW - cW + Border) / 2) : "", % (Y = 1) ? Round((wH - cH + Caption) / 2) : "",,, % "ahk_id " hCtrl

  ;Redraw the windows content
  WinSet, Redraw,, % "ahk_id " hWnd

  Return 1
}

Result := DllCall("SetWindowPos", "UInt", Gui2, "UInt", Gui1, "Int", Gui1X + 300, "Int", Gui1Y, "Int", "", "Int", "", "Int", 0x01)

SetWindowIcon(hWnd, Filename, Index := 1) {															;--
    Local hIcon := LoadPicture(Filename, "w16 Icon" . Index, ErrorLevel)
    SendMessage 0x80, 0, hIcon,, ahk_id %hWnd% ; WM_SETICON
    Return ErrorLevel
}

SetWindowPos(hWnd, x, y, w, h, hWndInsertAfter := 0, uFlags := 0x40) {					;--
    Return DllCall("SetWindowPos", "Ptr", hWnd, "Ptr", hWndInsertAfter, "Int", x, "Int", y, "Int", w, "Int", h, "UInt", uFlags)
}

TryKillWin(win) {																										;--
	static funcs := ["Win32_SendMessage", "Win32_TaskKill", "Win32_Terminate"]

	if(IsClosed(win, 0.5)) {
		IdleGui("Window is already closed", "", 3, true)
		return
	}

	for i, v in funcs {
		IdleGui("Trying " . v . "...", "Closing...", 10, false)
		if(%v%(win)) {
			IdleGuiClose()
			return true
		}
	}
	return false
}

Win32_SendMessage(win) {																						;--
	static wm_msgs := {"WM_CLOSE":0x0010, "WM_QUIT":0x0012, "WM_DESTROY":0x0002}
	for k, v in wm_msgs {
		SendMessage, %v%, 0, 0,, ahk_id %win%
		if(IsClosed(win, 1))
			break
	}
	if(IsClosed(win, 1))
		return true
	return false
}

Win32_TaskKill(win) {																								;--
	WinGet, win_pid, PID, ahk_id %win%
	cmdline := "taskkill /pid " . win_pid . " /f"
	Run, %cmdline%,, Hide UseErrorLevel
	if(ErrorLevel != 0 or !IsClosed(win, 5))
		return false
	return true
}

Win32_Terminate(win) {																							;--
	WinGet, win_pid, PID, ahk_id %win%
	handle := DllCall("Kernel32\OpenProcess", UInt, 0x0001, UInt, 0, UInt, win_pid)
	if(!handle)
		return false
	result := DllCall("Kernel32\TerminateProcess", UInt, handle, Int, 0)
	if(!result)
		return false
	return IsClosed(win, 5)
}

TabActivate(no) {																										;--
	global GuiWinTitle
	SendMessage, 0x1330, %no%,, SysTabControl321, %GuiWinTitle%
	Sleep 50
	SendMessage, 0x130C, %no%,, SysTabControl321, %GuiWinTitle%
	return
}

FocuslessScroll(Function inside) {																				;--
;Directives
#NoEnv
#SingleInstance Force
#MaxHotkeysPerInterval 100 ;Avoid warning when mouse wheel turned very fast
;Autoexecute code
MinLinesPerNotch := 1
MaxLinesPerNotch := 5
AccelerationThreshold := 100
AccelerationType := "L" ;Change to "P" for parabolic acceleration
StutterThreshold := 10
;Function definitions
;See above for details
FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold) {
	SetBatchLines, -1 ;Run as fast as possible
	CoordMode, Mouse, Screen ;All coords relative to screen

	;Stutter filter: Prevent stutter caused by cheap mice by ignoring successive WheelUp/WheelDown events that occur to close together.
	If(A_TimeSincePriorHotkey < StutterThreshold) ;Quickest succession time in ms
		If(A_PriorHotkey = "WheelUp" Or A_PriorHotkey ="WheelDown")
			Return

	MouseGetPos, m_x, m_y,, ControlClass2, 2
	ControlClass1 := DllCall( "WindowFromPoint", "int64", (m_y << 32) | (m_x & 0xFFFFFFFF), "Ptr") ;32-bit and 64-bit support

	lParam := (m_y << 16) | (m_x & 0x0000FFFF)
	wParam := (120 << 16) ;Wheel delta is 120, as defined by MicroSoft

	;Detect WheelDown event
	If(A_ThisHotkey = "WheelDown" Or A_ThisHotkey = "^WheelDown" Or A_ThisHotkey = "+WheelDown" Or A_ThisHotkey = "*WheelDown")
		wParam := -wParam ;If scrolling down, invert scroll direction

	;Detect modifer keys held down (only Shift and Control work)
	If(GetKeyState("Shift","p"))
		wParam := wParam | 0x4
	If(GetKeyState("Ctrl","p"))
		wParam := wParam | 0x8

	;Adjust lines per notch according to scrolling speed
	Lines := LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)

	If(ControlClass1 != ControlClass2)
	{
		Loop %Lines%
		{
			SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass1%
			SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass2%
		}
	}
	Else ;Avoid using Loop when not needed (most normal controls). Greately improves momentum problem!
	{
		SendMessage, 0x20A, wParam * Lines, lParam,, ahk_id %ControlClass1%
	}
}
LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType) {
	T := A_TimeSincePriorHotkey
	;All parameters are the same as the parameters of FocuslessScroll()
	;Return value: Returns the number of lines to be scrolled calculated from the current scroll speed.
	;Normal slow scrolling, separationg between scroll events is greater than AccelerationThreshold miliseconds.
	If((T > AccelerationThreshold) Or (T = -1)) ;T = -1 if this is the first hotkey ever run
	{
		Lines := MinLinesPerNotch
	}
	;Fast scrolling, use acceleration
	Else
	{
		If(AccelerationType = "P")
		{
			;Parabolic scroll speed curve
			;f(t) = At^2 + Bt + C
			A := (MaxLinesPerNotch-MinLinesPerNotch)/(AccelerationThreshold**2)
			B := -2 * (MaxLinesPerNotch - MinLinesPerNotch)/AccelerationThreshold
			C := MaxLinesPerNotch
			Lines := Round(A*(T**2) + B*T + C)
		}
		Else
		{
			;Linear scroll speed curve
			;f(t) = Bt + C
			B := (MinLinesPerNotch-MaxLinesPerNotch)/AccelerationThreshold
			C := MaxLinesPerNotch
			Lines := Round(B*T + C)
		}
	}
	Return Lines
}
;All hotkeys with the same parameters can use the same instance of FocuslessScroll(). No need to have separate calls unless each hotkey requires different parameters (e.g. you want to disable acceleration for Ctrl-WheelUp and Ctrl-WheelDown).
;If you want a single set of parameters for all scrollwheel actions, you can simply use *WheelUp:: and *WheelDown:: instead.
#MaxThreadsPerHotkey 6 ;Adjust to taste. The lower the value, the lesser the momentum problem on certain smooth-scrolling GUI controls (e.g. AHK helpfile main pane, WordPad...), but also the lesser the acceleration feel. The good news is that this setting does no affect most controls, only those that exhibit the momentum problem. Nice.
;Scroll with acceleration
WheelUp::
WheelDown::FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
;Ctrl-Scroll zoom with no acceleration (MaxLinesPerNotch = MinLinesPerNotch).
^WheelUp::
^WheelDown::FocuslessScroll(MinLinesPerNotch, MinLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
;If you want zoom acceleration, replace above line with this:
;FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
#MaxThreadsPerHotkey 1 ;Restore AHK's default  value i.e. 1
;End: Focusless Scroll
}

FocuslessScrollHorizontal(MinLinesPerNotch, MaxLinesPerNotch, 									;--
AccelerationThreshold, AccelerationType, StutterThreshold) {
    SetBatchLines, -1 ;Run as fast as possible
    CoordMode, Mouse, Screen ;All coords relative to screen

    ;Stutter filter: Prevent stutter caused by cheap mice by ignoring successive WheelUp/WheelDown events that occur to close together.
    If(A_TimeSincePriorHotkey < StutterThreshold) ;Quickest succession time in ms
        If(A_PriorHotkey = "WheelUp" Or A_PriorHotkey ="WheelDown")
            Return

    MouseGetPos, m_x, m_y,, ControlClass2, 2
    ControlClass1 := DllCall( "WindowFromPoint", "int64", (m_y << 32) | (m_x & 0xFFFFFFFF), "Ptr") ;32-bit and 64-bit support

    ctrlMsg := 0x114    ; WM_HSCROLL
    wParam := 0         ; Left

    ;Detect WheelDown event
    If(A_ThisHotkey = "WheelDown" Or A_ThisHotkey = "^WheelDown" Or A_ThisHotkey = "+WheelDown" Or A_ThisHotkey = "*WheelDown")
        wParam := 1 ; Right

    ;Adjust lines per notch according to scrolling speed
    Lines := LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)

    Loop %Lines%
    {
        SendMessage, ctrlMsg, wParam, 0,, ahk_id %ControlClass1%
        If(ControlClass1 != ControlClass2)
            SendMessage, ctrlMsg, wParam, 0,, ahk_id %ControlClass2%
    }
}

Menu_Show( hMenu, hWnd=0, mX="", mY="", Flags=0x1 ) {										;--
 ; http://ahkscript.org/boards/viewtopic.php?p=7088#p7088
 ; Flags: TPM_RECURSE := 0x1, TPM_RETURNCMD := 0x100, TPM_NONOTIFY := 0x80
 VarSetCapacity( POINT, 8, 0 ), DllCall( "GetCursorPos", UInt,&Point )
 mX := ( mX <> "" ) ? mX : NumGet( Point,0 )
 mY := ( mY <> "" ) ? mY : NumGet( Point,4 )
Return DllCall( "TrackPopupMenu", UInt,hMenu, UInt,Flags ; TrackPopupMenu()  goo.gl/CosNig
               , Int,mX, Int,mY, UInt,0, UInt,hWnd ? hWnd : WinActive("A"), UInt,0 )

/*
..but the catch is: To get handle ( hMenu ) for a Menuname, it has to be attached to a MenuBar.
There already is a function from lexikos, which does this: MI_GetMenuHandle(), and can be used as follows:


Code: [Alles ausw�hlen] [Download] (Script.ahk)GeSHi � Codebox Plus

hViewmenu := MI_GetMenuHandle( "view" ) ; Get it from: http://www.autohotkey.net/~Lexikos/lib/MI.ahk
...
...
GuiContextMenu:
 Menu_Show( hViewMenu )
Return
*/
}

CatMull_ControlMove( px0, py0, px1, py1, px2, py2, 													;-- Moves the mouse through 4 points (without control point "gaps")
px3, py3, Segments=8, Rel=0, Speed=2 ) {
; Function by [evandevon]. Moves the mouse through 4 points (without control point "gaps"). Inspired by VXe's
;cubic bezier curve function (with some borrowed code).
   MouseGetPos, px0, py0
   If Rel
      px1 += px0, px2 += px0, px3 += px0, py1 += py0, py2 += py0, py3 += py0
   Loop % Segments - 1
   {
	;CatMull Rom Spline - Working
	  u := 1 - t := A_Index / Segments
	  cmx := Round(0.5*((2*px1) + (-px0+px2)*t + (2*px0 - 5*px1 +4*px2 - px3)*t**2 + (-px0 + 3*px1 - 3*px2 + px3)*t**3) )
	  cmy := Round(0.5*((2*py1) + (-py0+py2)*t + (2*py0 - 5*py1 +4*py2 - py3)*t**2 + (-py0 + 3*py1 - 3*py2 + py3)*t**3) )

	  MouseMove, cmx, cmy, Speed,

   }
   MouseMove, px3, py3, Speed
} ; CatMull_MouseMove( px1, py1, px2, py2, px3, py3, Segments=5, Rel=0, Speed=2 ) -------------------


;}
;}
; ------------------------------------------------------------------------------	  #Custom Gui Elements#		----------------------------------------------------------------------------------------
; HtmlBox()						|	EditBox()							|	Popup()								|	PIC_GDI_GUI()						|	SplitButton()						|
; AddToolTip()					|	BetterBox()						|	BtnBox()								|	LoginBox()							|	MultiBox()						|
; PassBox()						|	CreateHotkeyWindow()		|
;
; ------------------------------------------------------------------------------	 #Gui - changing functions#	----------------------------------------------------------------------------------------
; FadeGui()						|	ShadowBorder()				|	FrameShadow() - 2 versions		|	RemoveWindowFromTaskbar()	|	ToggleTitleMenuBar()			|
; ToggleFakeFullscreen()		|	ListView_HeaderFontSet()	|	CreateFont()						|	FullScreenToggleUnderMouse()	|	SetTaskbarProgress() x 2		|
;
; ------------------------------------------------------------------------------	   #control type functions#		----------------------------------------------------------------------------------------
; Edit_Standard_Params()	|	Edit_TextIsSelected()			|	Edit_GetSelection()				|	Edit_Select()							|	Edit_SelectLine()				|
; Edit_DeleteLine()				|
;#---- GDI control functions ---#
; ControlCreateGradient()	|	AddGraphicButtonPlus()		|
;#---- IMAGELIST functions ----#
; IL_LoadIcon()					|	IL_GuiButtonIcon()				|
;#----- LISTVIEW functions -----#
; LVGetCount()					|	LV_SetSelColors()				|	LV_Select()							|	LV_GetItemText()					|	LV_GetText()					|
;#---- TabControl functions ----#
; TabCtrl_GetCurSel()			|	TabCtrl_GetItemText()		|
;#----- TREEVIEW functions ----#
; TV_Find()						|	TV_Load()						|
;
; ------------------------------------------------------------------------------ #Gui - retreaving informations#	----------------------------------------------------------------------------------------
; screenDims()					|	DPIFactor()						|
; ControlExists()				|	GetFocusedControl()			|	GetControls()						|	GetOtherControl()					|	ListControls()					|
; Control_GetClassNN()		|	ControlGetClassNN()			|	Control_GetFont()					|	IsControlFocused()					|	IsOverTitleBar()					|
; WinGetPosEx()				|	GetParent()						|	GetWindow()						|	GetForegroundWindow()			|	IsWindowVisible()				|
; IsFullScreen()					|	IsClosed()						|	getProcessBaseAddress()			|	GetClassLong()						|	GetWindowLong()				|
; GetClassStyles()				|	GetTabOrderIndex()			|	GetCursor()							|	GetExtraStyle()						|	GetToolbarItems()				|
; ControlGetTabs()				|	GetHeaderInfo()				|	GetClientCoords()					|	GetWindowCoords()				|	GetWindowPos()				|
; GetWindowPlacement()		|	GetWindowInfo()				|	GetOwner()							|	FindWindow()						|	ShowWindow()					|
; IsWindow()					|	IsWindowVisible()				|	GetClassName()					|	WinForms_GetClassNN()			|	FindChildWindow()			|
; WinGetMinMaxState()		|
; getControlNameByHwnd()	|	getByControlName()			|	TabCtrl_GetCurSel()				|	TabCtrl_GetItemText()			|
;
; ------------------------------------------------------------------------------		  #Menu functions#			----------------------------------------------------------------------------------------
; GetMenu()						|	GetSubMenu()					|	GetMenuItemCount()				|	GetMenuItemID()					|	GetMenuString()				|
; MenuGetAll()					|	MenuGetAll_sub()				|
; GetContextMenuState()		|	GetContextMenuID()			|	GetContextMenuText()			|	ExtractInteger()						|	InsertInteger()					|
;
; ------------------------------------------------------------------------------	  #interacting functions#		----------------------------------------------------------------------------------------
; ChooseColor()				|	GetWindowIcon()				|	GetImageType()					|	GetStatusBarText()					|	GetAncestor()					|
; MinMaxInfo()					|	OnMessage( "MinMaxInfo")	|	SureControlClick()					|	SureControlCheck()				|	WinWaitForMinimized()		|
; CenterWindow()				|	GuiCenterButtons()			|	CenterControl()						|	SetWindowIcon()					|	SetWindowPos()				|
; TryKillWin()					|	Win32_SendMessage()		|	Win32_TaskKill()					|	Win32_Terminate()				|	TabActivate()					|
; FocuslessScroll()				|	FocuslessScrollHorizontal()	|	Menu_Show()						|	CatMull_ControlMove()			|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Filesystem (17)
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
InvokeVerb(path, menu, validate=True) {											;-- Executes the context menu item of the given path

    ;by A_Samurai
    ;v 1.0.1 http://sites.google.com/site/ahkref/custom-functions/invokeverb

	/*											Description

		Executes the context menu item of the given path.

		Remarks
		This should be used with #Persistent since closing the script causes an unexpected termination of the invoked action, such as when invoking
		the Copy menu item, if the script exits, the copied item will be canceled. Invoking Properties behaves similarly.

		Requirements
		AutoHotkey_L Revision 53 or later.

		License
		Public Domain.

		Format
		InvokeVerb(path, menu, validate=True)
		Parameters
		path: the path of the file / directory to invoke the context menu.
		menu: the menu item to invoke.
		validate: if this is set to True, the function checks if the given menu item exists. It's True by default.

		Return Value
		True if the menu item is invoked; otherwise, False. If the validate option is set to False, nothing will be returned.

	*/

	/*											Example

		#persistent
		;this is the same as right clicking on the folder and selecting Copy.
		if InvokeVerb(A_MyDocuments "\AutoHotkey", "Copy")
			msgbox copied
		else
			msgbox not copied

		;Opens the property window of Recycle Bin
		InvokeVerb("::{645ff040-5081-101b-9f08-00aa002f954e}", "Properties")


		path := A_ScriptDir "\Test"
		FileCreateDir, % path
		;this is the same as right clicking on the folder and selecting Delete.
		InvokeVerb(path, "Delete")

	*/

    objShell := ComObjCreate("Shell.Application")
    if InStr(FileExist(path), "D") || InStr(path, "::{") {
        objFolder := objShell.NameSpace(path)
        objFolderItem := objFolder.Self
    } else {
        SplitPath, path, name, dir
        objFolder := objShell.NameSpace(dir)
        objFolderItem := objFolder.ParseName(name)
    }
    if validate {
        colVerbs := objFolderItem.Verbs
        loop % colVerbs.Count {
            verb := colVerbs.Item(A_Index - 1)
            retMenu := verb.name
            StringReplace, retMenu, retMenu, &
            if (retMenu = menu) {
                verb.DoIt
                Return True
            }
        }
        Return False
    } else
        objFolderItem.InvokeVerbEx(Menu)

}

Function_Eject(Drive){																		;-- ejects a drive medium
	Try
	{

		hVolume := DllCall("CreateFile"
		    , Str, "\\.\" . Drive
		    , UInt, 0x80000000 | 0x40000000  ; GENERIC_READ | GENERIC_WRITE
		    , UInt, 0x1 | 0x2  ; FILE_SHARE_READ | FILE_SHARE_WRITE
		    , UInt, 0
		    , UInt, 0x3  ; OPEN_EXISTING
		    , UInt, 0, UInt, 0)
		if hVolume <> -1
		{
		    DllCall("DeviceIoControl"
		        , UInt, hVolume
		        , UInt, 0x2D4808   ; IOCTL_STORAGE_EJECT_MEDIA
		        , UInt, 0, UInt, 0, UInt, 0, UInt, 0
		        , UIntP, dwBytesReturned  ; Unused.
		        , UInt, 0)
		    DllCall("CloseHandle", UInt, hVolume)

		}

		Return 1
	}
	Catch
	{

		Return 0
	}
}

FileGetDetail(FilePath, Index) { 															;-- Get specific file property by index
   Static MaxDetails := 350
   SplitPath, FilePath, FileName , FileDir
   If (FileDir = "")
      FileDir := A_WorkingDir
   Shell := ComObjCreate("Shell.Application")
   Folder := Shell.NameSpace(FileDir)
   Item := Folder.ParseName(FileName)
   Return Folder.GetDetailsOf(Item, Index)
}

FileGetDetails(FilePath) { 																	;-- Create an array of concrete file properties
   Static MaxDetails := 350
   Shell := ComObjCreate("Shell.Application")
   Details := []
   SplitPath, FilePath, FileName , FileDir
   If (FileDir = "")
      FileDir := A_WorkingDir
   Folder := Shell.NameSpace(FileDir)
   Item := Folder.ParseName(FileName)
   Loop, %MaxDetails% {
      If (Value := Folder.GetDetailsOf(Item, A_Index - 1))
         Details[A_Index - 1] := [Folder.GetDetailsOf(0, A_Index - 1), Value]
   }
   Return Details
}

DirExist(dirPath) {																				;-- Checks if a directory exists
   return InStr(FileExist(dirPath), "D") ? 1 : 0
}

GetDetails() { 																					;-- Create an array of possible file properties
   Static MaxDetails := 350
   Shell := ComObjCreate("Shell.Application")
   Details := []
   Folder := Shell.NameSpace(A_ScriptDir)
   Loop, %MaxDetails% {
      If (Value := Folder.GetDetailsOf(0, A_Index - 1)) {
         Details[A_Index - 1] := Value
         Details[Value] := A_Index - 1
      }
   }
   Return Details
}

Start(Target, Minimal = false, Title = "") { 											;-- Start programs or scripts easier
   cPID = -1
   if Minimal
      Run %ComSpec% /c "%Target%", A_WorkingDir, Min UseErrorLevel, cPID
   else
      Run %ComSpec% /c "%Target%", A_WorkingDir, UseErrorLevel, cPID
   if ErrorLevel = 0
   {
      if (Title <> "")
      {
         WinWait ahk_pid %cPID%,,,2
         WinSetTitle, %Title%
      }
      return, 0
   }
   else
      return, -1
}

IsFileEqual(filename1, filename2) { 													;-- Returns whether or not two files are equal
    ;TODO make this work for big files, too (this version reads it all into memory first)
   FileRead, file1, %filename1%
   FileRead, file2, %filename2%

   return file1==file2
}

WatchDirectory(p*) {  																		;-- Watches a directory/file for file changes

    ;By HotKeyIt
    ;Docs: http://www.autohotkey.com/forum/viewtopic.php?p=398565#398565

    global _Struct
   ;Structures
   static FILE_NOTIFY_INFORMATION:="DWORD NextEntryOffset,DWORD Action,DWORD FileNameLength,WCHAR FileName[1]"
   static OVERLAPPED:="ULONG_PTR Internal,ULONG_PTR InternalHigh,{struct{DWORD offset,DWORD offsetHigh},PVOID Pointer},HANDLE hEvent"
   ;Variables
   static running,sizeof_FNI=65536,WatchDirectory:=RegisterCallback("WatchDirectory","F",0,0) ;,nReadLen:=VarSetCapacity(nReadLen,8)
   static timer,ReportToFunction,LP,nReadLen:=VarSetCapacity(LP,(260)*(A_PtrSize/2),0)
   static @:=Object(),reconnect:=Object(),#:=Object(),DirEvents,StringToRegEx="\\\|.\.|+\+|[\[|{\{|(\(|)\)|^\^|$\$|?\.?|*.*"
   ;ReadDirectoryChanges related
   static FILE_NOTIFY_CHANGE_FILE_NAME=0x1,FILE_NOTIFY_CHANGE_DIR_NAME=0x2,FILE_NOTIFY_CHANGE_ATTRIBUTES=0x4
         ,FILE_NOTIFY_CHANGE_SIZE=0x8,FILE_NOTIFY_CHANGE_LAST_WRITE=0x10,FILE_NOTIFY_CHANGE_CREATION=0x40
         ,FILE_NOTIFY_CHANGE_SECURITY=0x100
   static FILE_ACTION_ADDED=1,FILE_ACTION_REMOVED=2,FILE_ACTION_MODIFIED=3
         ,FILE_ACTION_RENAMED_OLD_NAME=4,FILE_ACTION_RENAMED_NEW_NAME=5
   static OPEN_EXISTING=3,FILE_FLAG_BACKUP_SEMANTICS=0x2000000,FILE_FLAG_OVERLAPPED=0x40000000
         ,FILE_SHARE_DELETE=4,FILE_SHARE_WRITE=2,FILE_SHARE_READ=1,FILE_LIST_DIRECTORY=1
   If p.MaxIndex(){
      If (p.MaxIndex()=1 && p.1=""){
         for i,folder in #
            DllCall("CloseHandle","Uint",@[folder].hD),DllCall("CloseHandle","Uint",@[folder].O.hEvent)
            ,@.Remove(folder)
         #:=Object()
         DirEvents:=new _Struct("HANDLE[1000]")
         DllCall("KillTimer","Uint",0,"Uint",timer)
         timer=
         Return 0
      } else {
         if p.2
            ReportToFunction:=p.2
         If !IsFunc(ReportToFunction)
            Return -1 ;DllCall("MessageBox","Uint",0,"Str","Function " ReportToFunction " does not exist","Str","Error Missing Function","UInt",0)
         RegExMatch(p.1,"^([^/\*\?<>\|""]+)(\*)?(\|.+)?$",dir)
         if (SubStr(dir1,0)="\")
            StringTrimRight,dir1,dir1,1
         StringTrimLeft,dir3,dir3,1
         If (p.MaxIndex()=2 && p.2=""){
            for i,folder in #
               If (dir1=SubStr(folder,1,StrLen(folder)-1))
                  Return 0 ,DirEvents[i]:=DirEvents[#.MaxIndex()],DirEvents[#.MaxIndex()]:=0
                           @.Remove(folder),#[i]:=#[#.MaxIndex()],#.Remove(i)
            Return 0
         }
      }
      if !InStr(FileExist(dir1),"D")
         Return -1 ;DllCall("MessageBox","Uint",0,"Str","Folder " dir1 " does not exist","Str","Error Missing File","UInt",0)
      for i,folder in #
      {
         If (dir1=SubStr(folder,1,StrLen(folder)-1) || (InStr(dir1,folder) && @[folder].sD))
               Return 0
         else if (InStr(SubStr(folder,1,StrLen(folder)-1),dir1 "\") && dir2){ ;replace watch
            DllCall("CloseHandle","Uint",@[folder].hD),DllCall("CloseHandle","Uint",@[folder].O.hEvent),reset:=i
         }
      }
      LP:=SubStr(LP,1,DllCall("GetLongPathName","Str",dir1,"Uint",&LP,"Uint",VarSetCapacity(LP))) "\"
      If !(reset && @[reset]:=LP)
         #.Insert(LP)
      @[LP,"dir"]:=LP
      @[LP].hD:=DllCall("CreateFile","Str",StrLen(LP)=3?SubStr(LP,1,2):LP,"UInt",0x1,"UInt",0x1|0x2|0x4
                  ,"UInt",0,"UInt",0x3,"UInt",0x2000000|0x40000000,"UInt",0)
      @[LP].sD:=(dir2=""?0:1)

      Loop,Parse,StringToRegEx,|
         StringReplace,dir3,dir3,% SubStr(A_LoopField,1,1),% SubStr(A_LoopField,2),A
      StringReplace,dir3,dir3,%A_Space%,\s,A
      Loop,Parse,dir3,|
      {
         If A_Index=1
            dir3=
         pre:=(SubStr(A_LoopField,1,2)="\\"?2:0)
         succ:=(SubStr(A_LoopField,-1)="\\"?2:0)
         dir3.=(dir3?"|":"") (pre?"\\\K":"")
               . SubStr(A_LoopField,1+pre,StrLen(A_LoopField)-pre-succ)
               . ((!succ && !InStr(SubStr(A_LoopField,1+pre,StrLen(A_LoopField)-pre-succ),"\"))?"[^\\]*$":"") (succ?"$":"")
      }
      @[LP].FLT:="i)" dir3
      @[LP].FUNC:=ReportToFunction
      @[LP].CNG:=(p.3?p.3:(0x1|0x2|0x4|0x8|0x10|0x40|0x100))
      If !reset {
         @[LP].SetCapacity("pFNI",sizeof_FNI)
         @[LP].FNI:=new _Struct(FILE_NOTIFY_INFORMATION,@[LP].GetAddress("pFNI"))
         @[LP].O:=new _Struct(OVERLAPPED)
      }
      @[LP].O.hEvent:=DllCall("CreateEvent","Uint",0,"Int",1,"Int",0,"UInt",0)
      If (!DirEvents)
         DirEvents:=new _Struct("HANDLE[1000]")
      DirEvents[reset?reset:#.MaxIndex()]:=@[LP].O.hEvent
      DllCall("ReadDirectoryChangesW","UInt",@[LP].hD,"UInt",@[LP].FNI[],"UInt",sizeof_FNI
               ,"Int",@[LP].sD,"UInt",@[LP].CNG,"UInt",0,"UInt",@[LP].O[],"UInt",0)
      Return timer:=DllCall("SetTimer","Uint",0,"UInt",timer,"Uint",50,"UInt",WatchDirectory)
   } else {
      Sleep, 0
      for LP in reconnect
      {
         If (FileExist(@[LP].dir) && reconnect.Remove(LP)){
            DllCall("CloseHandle","Uint",@[LP].hD)
            @[LP].hD:=DllCall("CreateFile","Str",StrLen(@[LP].dir)=3?SubStr(@[LP].dir,1,2):@[LP].dir,"UInt",0x1,"UInt",0x1|0x2|0x4
                  ,"UInt",0,"UInt",0x3,"UInt",0x2000000|0x40000000,"UInt",0)
            DllCall("ResetEvent","UInt",@[LP].O.hEvent)
            DllCall("ReadDirectoryChangesW","UInt",@[LP].hD,"UInt",@[LP].FNI[],"UInt",sizeof_FNI
               ,"Int",@[LP].sD,"UInt",@[LP].CNG,"UInt",0,"UInt",@[LP].O[],"UInt",0)
         }
      }
      if !( (r:=DllCall("MsgWaitForMultipleObjectsEx","UInt",#.MaxIndex()
               ,"UInt",DirEvents[],"UInt",0,"UInt",0x4FF,"UInt",6))>=0
               && r<#.MaxIndex() ){
         return
      }
      DllCall("KillTimer", UInt,0, UInt,timer)
      LP:=#[r+1],DllCall("GetOverlappedResult","UInt",@[LP].hD,"UInt",@[LP].O[],"UIntP",nReadLen,"Int",1)
      If (A_LastError=64){ ; ERROR_NETNAME_DELETED - The specified network name is no longer available.
         If !FileExist(@[LP].dir) ; If folder does not exist add to reconnect routine
            reconnect.Insert(LP,LP)
      } else
         Loop {
            FNI:=A_Index>1?(new _Struct(FILE_NOTIFY_INFORMATION,FNI[]+FNI.NextEntryOffset)):(new _Struct(FILE_NOTIFY_INFORMATION,@[LP].FNI[]))
            If (FNI.Action < 0x6){
               FileName:=@[LP].dir . StrGet(FNI.FileName[""],FNI.FileNameLength/2,"UTF-16")
               If (FNI.Action=FILE_ACTION_RENAMED_OLD_NAME)
                     FileFromOptional:=FileName
               If (@[LP].FLT="" || RegExMatch(FileName,@[LP].FLT) || FileFrom)
                  If (FNI.Action=FILE_ACTION_ADDED){
                     FileTo:=FileName
                  } else If (FNI.Action=FILE_ACTION_REMOVED){
                     FileFrom:=FileName
                  } else If (FNI.Action=FILE_ACTION_MODIFIED){
                     FileFrom:=FileTo:=FileName
                  } else If (FNI.Action=FILE_ACTION_RENAMED_OLD_NAME){
                     FileFrom:=FileName
                  } else If (FNI.Action=FILE_ACTION_RENAMED_NEW_NAME){
                     FileTo:=FileName
                  }
          If (FNI.Action != 4 && (FileTo . FileFrom) !="")
                  @[LP].Func(FileFrom=""?FileFromOptional:FileFrom,FileTo)
            }
         } Until (!FNI.NextEntryOffset || ((FNI[]+FNI.NextEntryOffset) > (@[LP].FNI[]+sizeof_FNI-12)))
      DllCall("ResetEvent","UInt",@[LP].O.hEvent)
      DllCall("ReadDirectoryChangesW","UInt",@[LP].hD,"UInt",@[LP].FNI[],"UInt",sizeof_FNI
               ,"Int",@[LP].sD,"UInt",@[LP].CNG,"UInt",0,"UInt",@[LP].O[],"UInt",0)
      timer:=DllCall("SetTimer","Uint",0,"UInt",timer,"Uint",50,"UInt",WatchDirectory)
      Return
   }
   Return
}

WatchDirectory(WatchFolder="", WatchSubDirs=true) {						;-- it's different from above not tested

	;--https://autohotkey.com/board/topic/41653-watchdirectory/page-2

	/*				DESCRIPTION
	;Parameters
	; WatchFolder - Specify a valid path to watch for changes in.
	; - can be directory or drive (e.g. c:\ or c:\Temp)
	; - can be network path e.g. \\192.168.2.101\Shared)
	; - can include last backslash. e.g. C:\Temp\ (will be reported same form)
	;
	; WatchSubDirs - Specify whether to search in subfolders
	;
	;StopWatching - THIS SHOULD BE DONE BEFORE EXITING SCRIPT AT LEAST (OnExit)
	; Call WatchDirectory() without parameters to stop watching all directories
	;
	;ReportChanges
	; Call WatchDirectory("ReportingFunctionName") to process registered changes.
	; Syntax of ReportingFunctionName(Action,Folder,File)
	*/

	/*					EXAMPLE

	#Persistent
	OnExit,Exit
	WatchDirectory("C:\Windows",1)
	SetTimer,WatchFolder,100
	Return
	WatchFolder:
	WatchDirectory("RegisterChanges")
	Return
	RegisterChanges(action,folder,file){
	static
	#1:="New File", #2:="Deleted", #3:="Modified", #4:="Renamed From", #5:="Renamed To"
	ToolTip % #%Action% "`n" folder . (SubStr(folder,0)="" ? "" : "") . file
	}
	Exit:
	WatchDirectory()
	ExitApp

	*/

	static
	local hDir, hEvent, r, Action, FileNameLen, pFileName, Restart, CurrentFolder, PointerFNI, option
	static nReadLen := 0, _SizeOf_FNI_:=65536
	If (Directory=""){
		Gosub, StopWatchingDirectories
		SetTimer,TimerDirectoryChanges,Off
	} else if (Directory=Chr(2) or IsFunc(Directory) or IsLabel(Directory)){
		Gosub, ReportDirectoryChanges
	} else {
		Loop % (DirIdx) {
			If InStr(Directory, Dir%A_Index%Path){
				If (Dir%A_Index%Subdirs)
					Return
			} else if InStr(Dir%A_Index%Path, Directory) {
				If (SubDirs){
					DllCall( "CloseHandle", UInt,Dir%A_Index% )
					DllCall( "CloseHandle", UInt,NumGet(Dir%A_Index%Overlapped, 16) )
					Restart := DirIdx, DirIdx := A_Index
				}
			}
		}
		If !Restart
			DirIdx += 1
		r:=DirIdx
		hDir := DllCall( "CreateFile"
					 , Str  , Directory
					 , UInt , ( FILE_LIST_DIRECTORY := 0x1 )
					 , UInt , ( FILE_SHARE_READ     := 0x1 )
							| ( FILE_SHARE_WRITE    := 0x2 )
							| ( FILE_SHARE_DELETE   := 0x4 )
					 , UInt , 0
					 , UInt , ( OPEN_EXISTING := 0x3 )
					 , UInt , ( FILE_FLAG_BACKUP_SEMANTICS := 0x2000000  )
							| ( FILE_FLAG_OVERLAPPED       := 0x40000000 )
					 , UInt , 0 )
		Dir%r%         := hDir
		Dir%r%Path     := Directory
		Dir%r%Subdirs  := SubDirs
		If (options!="")
			Loop,Parse,options,%A_Space%
				If (option:= SubStr(A_LoopField,1,1))
					Dir%r%%option%:= SubStr(A_LoopField,2)
		VarSetCapacity( Dir%r%FNI, _SizeOf_FNI_ )
		VarSetCapacity( Dir%r%Overlapped, 20, 0 )
		DllCall( "CloseHandle", UInt,hEvent )
		hEvent := DllCall( "CreateEvent", UInt,0, Int,true, Int,false, UInt,0 )
		NumPut( hEvent, Dir%r%Overlapped, 16 )
		if ( VarSetCapacity(DirEvents) < DirIdx*4 and VarSetCapacity(DirEvents, DirIdx*4 + 60))
			Loop %DirIdx%
			{
				If (SubStr(Dir%A_Index%Path,1,1)!="-"){
					action++
					NumPut( NumGet( Dir%action%Overlapped, 16 ), DirEvents, action*4-4 )
				}
			}
		NumPut( hEvent, DirEvents, DirIdx*4-4)
		Gosub, ReadDirectoryChanges
		If Restart
			DirIdx = %Restart%
		If (Dir%r%T!="")
			SetTimer,TimerDirectoryChanges,% Dir%r%T
	}
	Return
	TimerDirectoryChanges:
		WatchDirectory(Chr(2))
	Return
	ReportDirectoryChanges:
		r := DllCall("MsgWaitForMultipleObjectsEx", UInt, DirIdx, UInt, &DirEvents, UInt, -1, UInt, 0x4FF, UInt, 0x6) ;Timeout=-1
		if !(r >= 0 && r < DirIdx)
			Return
		r += 1
		CurrentFolder := Dir%r%Path
		PointerFNI := &Dir%r%FNI
		DllCall( "GetOverlappedResult", UInt, hDir, UInt, &Dir%r%Overlapped, UIntP, nReadLen, Int, true )
		Loop {
			pNext   	:= NumGet( PointerFNI + 0  )
			Action      := NumGet( PointerFNI + 4  )
			FileNameLen := NumGet( PointerFNI + 8  )
			pFileName :=       ( PointerFNI + 12 )
			If (Action < 0x6){
				VarSetCapacity( FileNameANSI, FileNameLen )
				DllCall( "WideCharToMultiByte",UInt,0,UInt,0,UInt,pFileName,UInt,FileNameLen,Str,FileNameANSI,UInt,FileNameLen,UInt,0,UInt,0)
				path:=CurrentFolder . (SubStr(CurrentFolder,0)="\" ? "" : "\") . SubStr( FileNameANSI, 1, FileNameLen/2 )
				SplitPath,path,,,EXT
				SplitPath,frompath,,,EXTFrom
				If ((FileExist(path) and InStr(FileExist(path),"D") and Dir%r%E!="" and Dir%r%E!="?") or (Dir%r%A!="" and !InStr(Dir%r%A, action)) or (FileExist(path) and !InStr(FileExist(path),"D") and Dir%r%E="?")){
					If (!pNext or pNext = 4129024)
						Break
					Else
						frompath:=path, PointerFNI := (PointerFNI + pNext)
					Continue
				}
				option:=Dir%r%E="" ? "|" : Dir%r%E
				Loop,Parse,option,.
					If (Dir%r%E="" or Dir%r%E="?" or Dir%r%E="*" or A_LoopField=EXT or A_LoopField=ExtFrom){
						If action in 2,3
							before:=path,after:=(action=3 ? path : "")
						else if action in 1,5
							before:=(action=5 ? frompath : ""),after:=path
						If (Directory and IsFunc(Directory))
							%Directory%(action,path)
						else if (action!=4){
							If IsFunc(Dir%r%F){
								F:=Dir%r%F
								%F%(before,after)
							}
						}
						If IsLabel(Dir%r%G){
								ErrorLevel:=action . "|" . path
								Gosub % Dir%r%G
							}
						break
					}
			}
			If (!pNext or pNext = 4129024)
				Break
			Else
				frompath:=path, PointerFNI := (PointerFNI + pNext)
		}
		DllCall( "ResetEvent", UInt,NumGet( Dir%r%Overlapped, 16 ) )
		Gosub, ReadDirectoryChanges
	Return
	StopWatchingDirectories:
		Loop % (DirIdx) {
			DllCall( "CloseHandle", UInt,Dir%A_Index% )
			DllCall( "CloseHandle", UInt,NumGet(Dir%A_Index%Overlapped, 16) )
			DllCall( "CloseHandle", UInt, NumGet(Dir%A_Index%Overlapped,16) )
			VarSetCapacity(Dir%A_Index%Overlapped,0)
			Dir%A_Index%=
			Dir%A_Index%Path=
			Dir%A_Index%Subdirs=
			Dir%A_Index%FNI=
		}
		DirIdx=
		VarSetCapacity(DirEvents,0)
	Return
	ReadDirectoryChanges:
		DllCall( "ReadDirectoryChangesW"
			, UInt , Dir%r%
			, UInt , &Dir%r%FNI
			, UInt , _SizeOf_FNI_
			, UInt , Dir%r%SubDirs
			, UInt , ( FILE_NOTIFY_CHANGE_FILE_NAME   := 0x1   )
					| ( FILE_NOTIFY_CHANGE_DIR_NAME    := 0x2   )
					| ( FILE_NOTIFY_CHANGE_ATTRIBUTES  := 0x4   )
					| ( FILE_NOTIFY_CHANGE_SIZE        := 0x8   )
					| ( FILE_NOTIFY_CHANGE_LAST_WRITE  := 0x10  )
					| ( FILE_NOTIFY_CHANGE_CREATION    := 0x40  )
					| ( FILE_NOTIFY_CHANGE_SECURITY    := 0x100 )
			, UInt , 0
			, UInt , &Dir%r%Overlapped
			, UInt , 0  )
	Return
}

GetFileIcon(File, SmallIcon := 1) {

    VarSetCapacity(SHFILEINFO, cbFileInfo := A_PtrSize + 688)
    If (DllCall("Shell32.dll\SHGetFileInfoW"
        , "WStr", File
        , "UInt", 0
        , "Ptr" , &SHFILEINFO
        , "UInt", cbFileInfo
        , "UInt", 0x100 | SmallIcon)) { ; SHGFI_ICON
        Return NumGet(SHFILEINFO, 0, "Ptr")
    }
}

ExtractAssociatedIcon(ByRef ipath, ByRef idx) {										;-- Extracts the associated icon's index for the file specified in path

	; http://msdn.microsoft.com/en-us/library/bb776414(VS.85).aspx
	; shell32.dll
	; Extracts the associated icon's index for the file specified in path
	; Requires path and icon index
	; Icon must be destroyed when no longer needed (see below)

		hInst=0	; reserved, must be zero
		hIcon := DllCall("ExtractAssociatedIcon", "UInt", hInst, "UInt", &ipath, "UShortP", idx)
		return ErrorLevel

}

ExtractAssociatedIconEx(ByRef ipath, ByRef idx, ByRef iID) {					;-- Extracts the associated icon's index and ID for the file specified in path

		; http://msdn.microsoft.com/en-us/library/bb776415(VS.85).aspx
		; shell32.dll
		; Extracts the associated icon's index and ID for the file specified in path
		; Requires path, icon index and ID
		; Icon must be destroyed when no longer needed (see below)

			hInst=0	; reserved, must be zero
			hIcon := DllCall("ExtractAssociatedIconEx", "UInt", hInst, "UInt", &ipath, "UShortP", idx, "UShortP", iID)
			return ErrorLevel
}

DestroyIcon(hIcon) {																			;--
	DllCall("DestroyIcon", UInt, hIcon)
}

listfunc(file){																						;-- list all functions inside ahk scripts

	fileread, z, % file
	StringReplace, z, z, `r, , All			; important
	z := RegExReplace(z, "mU)""[^`n]*""", "") ; strings
	z := RegExReplace(z, "iU)/\*.*\*/", "") ; block comments
	z := RegExReplace(z, "m);[^`n]*", "")  ; single line comments
	p:=1 , z := "`n" z
	while q:=RegExMatch(z, "iU)`n[^ `t`n,;``\(\):=\?]+\([^`n]*\)[ `t`n]*{", o, p)
		lst .= Substr( RegExReplace(o, "\(.*", ""), 2) "`n"
		, p := q+Strlen(o)-1

	Sort, lst
	return lst
}

CreateOpenWithMenu(FilePath, Recommended := True, 					;--
ShowMenu := False, MenuName := "OpenWithMenu", Others := "Others") {

	; ==================================================================================================================================
	; Creates an 'open with' menu for the passed file.
	; Parameters:
	;     FilePath    -  Fully qualified path of a single file.
	;     Recommended -  Show only recommended apps (True/False).
	;                    Default: True
	;     ShowMenu    -  Immediately show the menu (True/False).
	;                    Default: False
	;     MenuName    -  The name of the menu.
	;                    Default: OpenWithMenu
	;     Others      -  Name of the submenu holding not recommended apps (if Recommended has been set to False).
	;                    Default: Others
	; Return values:
	;     On success the function returns the menu's name unless ShowMenu has been set to True.
	;     If the menu couldn't be created, the function returns False.
	; Remarks:
	;     Requires AHK 1.1.23.07+ and Win Vista+!!!
	;     The function registers itself as the menu handler.
	; Credits:
	;     Based on code by querty12 -> autohotkey.com/boards/viewtopic.php?p=86709#p86709.
	;     I hadn't even heard anything about the related API functions before.
	; MSDN:
	;     SHAssocEnumHandlers -> msdn.microsoft.com/en-us/library/bb762109%28v=vs.85%29.aspx
	;     SHCreateItemFromParsingName -> msdn.microsoft.com/en-us/library/bb762134%28v=vs.85%29.aspx
	; ==================================================================================================================================


   Static RecommendedHandlers := []
        , OtherHandlers := []
        , HandlerID := A_TickCount
        , HandlerFunc := 0
        , ThisMenuName := ""
        , ThisOthers := ""
   ; -------------------------------------------------------------------------------------------------------------------------------
   Static IID_IShellItem := 0, BHID_DataObject := 0, IID_IDataObject := 0
        , Init := VarSetCapacity(IID_IShellItem, 16, 0) . VarSetCapacity(BHID_DataObject, 16, 0)
          . VarSetCapacity(IID_IDataObject, 16, 0)
          . DllCall("Ole32.dll\IIDFromString", "WStr", "{43826d1e-e718-42ee-bc55-a1e261c37bfe}", "Ptr", &IID_IShellItem)
          . DllCall("Ole32.dll\IIDFromString", "WStr", "{B8C0BD9F-ED24-455c-83E6-D5390C4FE8C4}", "Ptr", &BHID_DataObject)
          . DllCall("Ole32.dll\IIDFromString", "WStr", "{0000010e-0000-0000-C000-000000000046}", "Ptr", &IID_IDataObject)
   ; -------------------------------------------------------------------------------------------------------------------------------
   ; Handler call
   If (Recommended = HandlerID) {
      AssocHandlers := A_ThisMenu = ThisMenuName ? RecommendedHandlers : OtherHandlers
      If (AssocHandler := AssocHandlers[A_ThisMenuItemPos]) && FileExist(FilePath) {
         AssocHandlerInvoke := NumGet(NumGet(AssocHandler + 0, "UPtr"), A_PtrSize * 8, "UPtr")
         If !DllCall("Shell32.dll\SHCreateItemFromParsingName", "WStr", FilePath, "Ptr", 0, "Ptr", &IID_IShellItem, "PtrP", Item) {
            BindToHandler := NumGet(NumGet(Item + 0, "UPtr"), A_PtrSize * 3, "UPtr")
            If !DllCall(BindToHandler, "Ptr", Item, "Ptr", 0, "Ptr", &BHID_DataObject, "Ptr", &IID_IDataObject, "PtrP", DataObj) {
               DllCall(AssocHandlerInvoke, "Ptr", AssocHandler, "Ptr", DataObj)
               ObjRelease(DataObj)
            }
            ObjRelease(Item)
         }
      }
      Try Menu, %ThisMenuName%, DeleteAll
      For Each, AssocHandler In RecommendedHandlers
         ObjRelease(AssocHandler)
      For Each, AssocHandler In OtherHandlers
         ObjRelease(AssocHandler)
      RecommendedHandlers:= []
      OtherHandlers:= []
      Return
   }
   ; -------------------------------------------------------------------------------------------------------------------------------
   ; User call
   If !FileExist(FilePath)
      Return False
   ThisMenuName := MenuName
   ThisOthers := Others
   SplitPath, FilePath, , , Ext
   For Each, AssocHandler In RecommendedHandlers
      ObjRelease(AssocHandler)
   For Each, AssocHandler In OtherHandlers
      ObjRelease(AssocHandler)
   RecommendedHandlers:= []
   OtherHandlers:= []
   Try Menu, %ThisMenuName%, DeleteAll
   Try Menu, %ThisOthers%, DeleteAll
   ; Try to get the default association
   Size := VarSetCapacity(FriendlyName, 520, 0) // 2
   DllCall("Shlwapi.dll\AssocQueryString", "UInt", 0, "UInt", 4, "Str", "." . Ext, "Ptr", 0, "Str", FriendlyName, "UIntP", Size)
   HandlerID := A_TickCount
   HandlerFunc := Func(A_ThisFunc).Bind(FilePath, HandlerID)
   Filter := !!Recommended ; ASSOC_FILTER_NONE = 0, ASSOC_FILTER_RECOMMENDED = 1
   ; Enumerate the apps and build the menu
   If DllCall("Shell32.dll\SHAssocEnumHandlers", "WStr", "." . Ext, "UInt", Filter, "PtrP", EnumHandler)
      Return False
   EnumHandlerNext := NumGet(NumGet(EnumHandler + 0, "UPtr"), A_PtrSize * 3, "UPtr")
   While (!DllCall(EnumHandlerNext, "Ptr", EnumHandler, "UInt", 1, "PtrP", AssocHandler, "UIntP", Fetched) && Fetched) {
      VTBL := NumGet(AssocHandler + 0, "UPtr")
      AssocHandlerGetUIName := NumGet(VTBL + 0, A_PtrSize * 4, "UPtr")
      AssocHandlerGetIconLocation := NumGet(VTBL + 0, A_PtrSize * 5, "UPtr")
      AssocHandlerIsRecommended := NumGet(VTBL + 0, A_PtrSize * 6, "UPtr")
      UIName := ""
      If !DllCall(AssocHandlerGetUIName, "Ptr", AssocHandler, "PtrP", StrPtr, "UInt") {
         UIName := StrGet(StrPtr, "UTF-16")
         DllCall("Ole32.dll\CoTaskMemFree", "Ptr", StrPtr)
      }
      If (UIName <> "") {
         If !DllCall(AssocHandlerGetIconLocation, "Ptr", AssocHandler, "PtrP", StrPtr, "IntP", IconIndex := 0, "UInt") {
            IconPath := StrGet(StrPtr, "UTF-16")
            DllCall("Ole32.dll\CoTaskMemFree", "Ptr", StrPtr)
         }
         If (SubStr(IconPath, 1, 1) = "@") {
            VarSetCapacity(Resource, 4096, 0)
            If !DllCall("Shlwapi.dll\SHLoadIndirectString", "WStr", IconPath, "Ptr", &Resource, "UInt", 2048, "PtrP", 0)
               IconPath := StrGet(&Resource, "UTF-16")
         }
         ItemName := StrReplace(UIName, "&", "&&")
         If (Recommended || !DllCall(AssocHandlerIsRecommended, "Ptr", AssocHandler, "UInt")) {
            If (UIName = FriendlyName) {
               If RecommendedHandlers.Length() {
                  Menu, %ThisMenuName%, Insert, 1&, %ItemName%, % HandlerFunc
                  RecommendedHandlers.InsertAt(1, AssocHandler)
               }
               Else {
                  Menu, %ThisMenuName%, Add, %ItemName%, % HandlerFunc
                  RecommendedHandlers.Push(AssocHandler)
               }
               Menu, %ThisMenuName%, Default, %ItemName%
            }
            Else {
               Menu, %ThisMenuName%, Add, %ItemName%, % HandlerFunc
               RecommendedHandlers.Push(AssocHandler)
            }
            Try Menu, %ThisMenuName%, Icon, %ItemName%, %IconPath%, %IconIndex%
         }
         Else {
            Menu, %ThisOthers%, Add, %ItemName%, % HandlerFunc
            OtherHandlers.Push(AssocHandler)
            Try Menu, %ThisOthers%, Icon, %ItemName%, %IconPath%, %IconIndex%
         }
      }
      Else
         ObjRelease(AssocHandler)
   }
   ObjRelease(EnumHandler)
   ; All done
   If !RecommendedHandlers.Length() && !OtherHandlers.Length()
      Return False
   If OtherHandlers.Length()
      Menu, %ThisMenuName%, Add, %ThisOthers%, :%ThisOthers%
   If (ShowMenu)
      Menu, %ThisMenuName%, Show
   Else
      Return ThisMenuName
}

FileCount(filter) {																				;-- count matching files in the working directory

   loop,files,%filter%
     Count := A_Index
   return Count

}

GetImageTypeW(File) {																		;-- Identify the image type (UniCode)

/* Description: Identify the image type

	; AHK version: B:1.0.48.5 L:1.0.92.0
	; Language: Chinese/English, Platform: Win7, Author: Pirate <healthlolicon@gmail.com>,

	;Type 0 Unknow
	;Type 1 BMP *.bmp
	;Type 2 JPEG *.jpg *.jpeg
	;Type 3 PNG *.png
	;Type 4 gif *.gif
	;Type 5 TIFF *.tif

*/


	hFile:=FileOpen(File,"r")
	hFile.seek(0)
	FileHead_hex:=hfile.ReadUint()
	hFile.Close()

	If FileHead_hex = 0x474E5089; small end of the actual data is 89 50 4E 47 under the same PNG file header actually has 8 bytes
	    Type=3 ; png
	Else If FileHead_hex=0x38464947 ; gif file header 6 bytes
	    Type=4 ; gif
	Else
	{
	    Filehead_hex&=0xFFFF
	    If FileHead_hex=0x4D42; BMP file header only 2 bytes
	        Type=1 ; bmp
	    Else if FileHead_hex=0xD8FF ; JPG file header is only 2 bytes
	        Type=2 ; jpg/jpeg
	    Else If FileHead_hex=0x4949 ; TIFF file header 2 bytes II
	        Type=5 ; tif
	    Else If FileHead_hex=0x4D4D ;MM
	        Type=5 ; tif
	    Else
	        Type=0 ; Unknow
	    }

Return,Type
}

;}
; InvokeVerb()					|	Function_Eject()				|	FileGetDetail()						|	FileGetDetails()						|	DirExist()							|
; GetDetails()					|	Start()	 -scripts					|	IsFileEqual()							|	WatchDirectory()	x 2			|	GetFileIcon()					|
; ExtractAssociatedIcon()		|	ExtractAssociatedIconEx()	|	DestroyIcon()						|
; listfunc()						|	CreateOpenWithMenu()		|	FileCount()							|	IdentifyImageTypW()				|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Hooks-Messaging (7)

OnMessageEx(MsgNumber, params*) {												;-- Allows multiple functions to be called automatically when the script receives the specified message

    ;version 1.0.2 by A_Samurai http://sites.google.com/site/ahkref/custom-functions/onmessageex

	/*													Description

		Allows multiple functions to be called automatically when the script receives the specified message.

		Remarks
		The parameter, MaxThreads, of the original OnMessage() function is not supported.

		Requirements
		AutoHotkey_L 1.0.97.00 or later.  Tested on: Windows 7 64bit, AutoHotkey 32bit Unicode 1.1.05.01.

		License
		Public Domain.

		Format
		OnMessageEx(MsgNumber, FunctionName=False, Priority=1)

		Parameters
		MsgNumber: 	same as the first parameter of OnMessage()
		FunctionName: 	same as the second parameter of OnMessage(). To remove the function from monitoring the system message, specify 0 in the
								next parameter Priority. To remove the function in lowest priority from monitoring the system message, specify "" (blank).
		Object Method: [v1.0.1+] In order to specify an object method, pass an array consisting of three elements. e.g. [&myobj, "MyMethod", False]
		Object Address: the address of the object. It can be retrieved with the & operator. e.g. &myobj
		MethodName: 	the name of the method.
		AutoRemove: 	decides whether to remove the method if the object no longer exists. True to enable it; otherwise, set it to False. False by default.
		Priority: 			specify a whole number to set the priority of the registering function to be called. 1 is the highest and as the number increases
								the priority gets lowered. 0 is to remove the function from the list.

		Return Value

		If FunctionName and Priority is omitted, it returns the name of the function of the lowest priority in the function list. If FunctionName is explicitly
		blank (e.g. ""), it returns the name of the removed function. If FunctionName has a value and Priority is set to 0, it returns the name of the
		removed function. If FunctionName has a value and it is successfully added in the function list, it returns the name of the function of the highest
		priority in the list before the new function is added.

	*/

	/*													Examples

		#Persistent
		Gui, Font, s20
		Gui, Margin, 30, 30
		Gui, Add, Text,, Click Here
		Gui, Show
		OnMessage(0x200, "MyFuncA")     ;a function registered via OnMessage() will be added in the list when OnMessageEx() is called for the first time.
		OnMessageEx(0x200, "MyFuncB")
		OnMessageEx(0x200, "MyFuncC")
		OnMessageEx(0x201, "MyFuncD")
		OnMessageEx(0x201, "MyFuncE")
		OnMessageEx(0x201, "MyFuncF")
		OnMessageEx(0x201, "MyFuncD")   ;a duplicated item will be removed and the function is inserted again
		Return
		GuiClose:
		ExitApp

		F1::msgbox % "Function Removed: " OnMessageEx(0x200, "")    ;removes the function in the lowest priority for 0x200
		F2::msgbox % "Function Removed: " OnMessageEx(0x201, "")    ;removes the function in the lowest priority for 0x201
		F3::msgbox % "The lowest priority function for 0x200 is: " OnMessageEx(0x200)
		F4::msgbox % "The lowest priority function for 0x201 is: " OnMessageEx(0x201)
		F5::msgbox % "Function Removed: " OnMessageEx(0x201, "MyFuncF", 0)    ;removes MyFuncF from 0x201

		MyFuncA(wParam, lParam, msg, hwnd) {
			display := A_ThisFunc "`nwParam :`t" wParam "`nlParam :`t`t" lParam "`nMessage :`t" msg "`nHwnd :`t`t" hwnd
			mousegetpos, mousex, mousey
			tooltip, % display, mousex - 200, , 1
			SetTimer, RemoveToolTipA, -1000
			Return
			RemoveToolTipA:
				tooltip,,,,1
			Return
		}
		MyFuncB(wParam, lParam, msg, hwnd) {
			display := A_ThisFunc "`nwParam :`t" wParam "`nlParam :`t`t" lParam "`nMessage :`t" msg "`nHwnd :`t`t" hwnd
			mousegetpos, mousex, mousey
			tooltip, % display, mousex,, 2
			SetTimer, RemoveToolTipB, -1000
			Return
			RemoveToolTipB:
				tooltip,,,,2
			Return
		}
		MyFuncC(wParam, lParam, msg, hwnd) {
			display := A_ThisFunc "`nwParam :`t" wParam "`nlParam :`t`t" lParam "`nMessage :`t" msg "`nHwnd :`t`t" hwnd
			mousegetpos, mousex, mousey
			tooltip, % display, mousex + 200 ,, 3
			SetTimer, RemoveToolTipC, -1000
			Return
			RemoveToolTipC:
				tooltip,,,,3
			Return
		}
		MyFuncD(wParam, lParam, msg, hwnd) {
			display := A_ThisFunc "`nwParam :`t" wParam "`nlParam :`t`t" lParam "`nMessage :`t" msg "`nHwnd :`t`t" hwnd
			mousegetpos, mousex, mousey
			tooltip, % display, mousex - 200, mousey - 80, 4
			SetTimer, RemoveToolTipD, -1000
			Return
			RemoveToolTipD:
				tooltip,,,,4
			Return
		}
		MyFuncE(wParam, lParam, msg, hwnd) {
			display := A_ThisFunc "`nwParam :`t" wParam "`nlParam :`t`t" lParam "`nMessage :`t" msg "`nHwnd :`t`t" hwnd
			mousegetpos, mousex, mousey
			tooltip, % display, mousex, mousey - 80, 5
			SetTimer, RemoveToolTipE, -1000
			Return
			RemoveToolTipE:
				tooltip,,,,5
			Return
		}
		MyFuncF(wParam, lParam, msg, hwnd) {
			display := A_ThisFunc "`nwParam :`t" wParam "`nlParam :`t`t" lParam "`nMessage :`t" msg "`nHwnd :`t`t" hwnd
			mousegetpos, mousex, mousey
			tooltip, % display, mousex + 200 , mousey - 80, 6
			SetTimer, RemoveToolTipF, -1000
			Return
			RemoveToolTipF:
				tooltip,,,,6
			Return
		}

		more example can be found at page linked above

	*/

	Static Functions := {}

    ;determine whether this is an on-message call
    FunctionName := params.1, OnMessage := True, DHW := A_DetectHiddenWindows
    DetectHiddenWindows, ON
    if ObjMaxIndex(params) <> 3            ;if the number of optional parameters are not three
        OnMessage := False
    else if FunctionName not between 0 and 4294967295    ;if the second parameter is not between 0 to 4294967295
        OnMessage := False
    else if !WinExist("ahk_id " params.3)    ;if the third parameter is not an existing Hwnd of a window/control
        OnMessage := False
    DetectHiddenWindows, % DHW

    if !OnMessage {
    ;if the function is manually called,
        Priority := params.2 ? params.2 : (params.2 = 0) ? 0 : 1
        If FunctionName    {
            ;if FunctionName is specified, it means to register it or if the priority is set to 0, remove it

            ;prepare for the function stack object
            Functions[MsgNumber] := Functions[MsgNumber] ? Functions[MsgNumber] : []

            ;check if there is already the same function in the stack object
            For index, oFunction in Functions[MsgNumber] {
                if (oFunction.Func = FunctionName) {
                    oRemoved := ObjRemove(Functions[MsgNumber], Index)
                    Break
                }
            }
            ;if the priority is 0, it means to remvoe the function
            if (Priority = 0)
                Return oRemoved.Func

            ;check if there is a function already registered for this message
            if (PrevFunc := OnMessage(MsgNumber)) && (PrevFunc <> A_ThisFunc) {
                ;this means there is one, so add this function to the stack object
                ObjInsert(Functions[MsgNumber], {Func: PrevFunc, Priority: 1})
            }

            ;find out the priority in each registered function and insert it before the element of the same priority
            IndexToInsert := 1
            For Index, oFunction in Functions[MsgNumber] {
                IndexToInsert := Index
            } Until (oFunction.Priority = Priority)

            ;retrieve the function name in the first priority for the return value
            FirstFunc := Functions[MsgNumber][ObjMinIndex(Functions[MsgNumber])].Func

            ;insert the given function in the function stack object
            if IsObject(FunctionName) {
                ;an object is passed for the second parameter
                ThisObj := Object(FunctionName.1), ThisMethod := FunctionName.2, AutoRemove := ObjHasKey(FunctionName, 3) ? FunctionName.3 : False
                If IsFunc(ThisObj[ThisMethod])    ;chceck if the method exists
                    ObjInsert(Functions[MsgNumber], IndexToInsert, {Func: FunctionName.2, Priority: Priority, ObjectAddress: FunctionName.1, AutoRemove: AutoRemove})
                else         ;if the passed function name is not a function, return false
                    return False
            } else {
                if IsFunc(FunctionName)    ;chceck if the function exists
                    ObjInsert(Functions[MsgNumber], IndexToInsert, {Func: FunctionName, Priority: Priority})
                else        ;if the passed function name is not a function, return false
                    return False
            }

            ;register it
            if (PrevFunc <> A_ThisFunc)
                OnMessage(MsgNumber, A_ThisFunc)

            Return FirstFunc
        } Else if ObjHasKey(params, 1) && (FunctionName = "") {
            ;if FunctionName is explicitly empty, remove the function and return its name

            ;remove the lowest priority function (the last element) in the object of the specified message.
            oRemoved := ObjRemove(Functions[MsgNumber], ObjMaxIndex(Functions[MsgNumber]))

            ;if there are no more registered functions, remove the registration of this function for this message
            if !ObjMaxIndex(Functions[MsgNumber])
                OnMessage(MsgNumber, "")

            Return oRemoved.Func
        } Else     ;return the registered function of the lowest priority for this message
            Return Functions[MsgNumber][ObjMaxIndex(Functions[MsgNumber])].Func
    } Else {
    ;if this is an on-message call,
        wParam := MsgNumber, lParam := params.1, msg := params.2, Hwnd := params.3
        For Index, Function in Functions[msg] {
            ThisFunc := Function.Func
            if ObjHasKey(Function, "ObjectAddress") {
                ;if it is an object method
                ThisObj := Object(Function.ObjectAddress)
                ThisObj[ThisFunc](wParam, lParam, msg, Hwnd)
                if Function.AutoRemove {        ;this means if the method no longer exists, remove it
                    If !IsFunc(ThisFunc) {
                        ObjRemove(Functions[MsgNumber], ThisFunc)

                        ;if there are no more registered functions, remove the registration of this function for this message
                        if !ObjMaxIndex(Functions[MsgNumber])
                            OnMessage(MsgNumber, "")
                    }
                }
            } else     ;if it is a function
                %ThisFunc%(wParam, lParam, msg, Hwnd)
        }
    }
}

ReceiveData(wParam, lParam) {															;--  By means of OnMessage(), this function has been set up to be called automatically whenever new data arrives on the connection.

   global ShowRecieved
   global ReceivedData

   Gui, Submit, NoHide
   socket := wParam

    ReceivedDataSize = 4096 ; Large in case a lot of data gets buffered due to delay in processing previous data.
    Loop  ; This loop solves the issue of the notification message being discarded due to thread-already-running.
    {
        VarSetCapacity(ReceivedData, ReceivedDataSize, 0)  ; 0 for last param terminates string for use with recv().
        ReceivedDataLength := DllCall("Ws2_32\recv", "UInt", socket, "Str", ReceivedData, "Int", ReceivedDataSize, "Int", 0)
        if ReceivedDataLength = 0  ; The connection was gracefully closed,
            ExitApp  ; The OnExit routine will call WSACleanup() for us.
        if ReceivedDataLength = -1
        {
            WinsockError := DllCall("Ws2_32\WSAGetLastError")
            if WinsockError = 10035  ; WSAEWOULDBLOCK, which means "no more data to be read".
                return 1
            if WinsockError <> 10054 ; WSAECONNRESET, which happens when Network closes via system shutdown/logoff.
                ; Since it's an unexpected error, report it.  Also exit to avoid infinite loop.
                MsgBox % "recv() indicated Winsock error " . WinsockError
            ExitApp  ; The OnExit routine will call WSACleanup() for us.
        }
        ; Otherwise, process the data received.
        ; Msgbox %ReceivedData%
        Loop, parse, ReceivedData, `n, `r
        {
           	ReceivedData=%A_LoopField%
           	if (ReceivedData!="")
           	{
				GoSub ParseData
				GoSub UseData
			}
        }
	}
    return 1  ; Tell the program that no further processing of this message is needed.
}

HDrop(fnames,x=0,y=0) {																;-- Drop files to another app

	/*						Description

		Return a handle to a structure describing files to be droped.
		Use it with PostMessage to send WM_DROPFILES messages to windows.
		fnames is a list of paths delimited by `n or `r`n
		x and y are the coordinates where files are droped in the window.
		Eg. :
		; Open autoexec.bat in an existing Notepad window.
		PostMessage, 0x233, HDrop("C:\autoexec.bat"), 0,, ahk_class Notepad
		PostMessage, 0x233, HDrop(A_MyDocuments), 0,, ahk_class MSPaintApp

	*/
	fns:=RegExReplace(fnames,"\n$")
   fns:=RegExReplace(fns,"^\n")
   hDrop:=DllCall("GlobalAlloc","UInt",0x42,"UInt",20+StrLen(fns)+2)
   p:=DllCall("GlobalLock","UInt",hDrop)
   NumPut(20, p+0)  ;offset
   NumPut(x,  p+4)  ;pt.x
   NumPut(y,  p+8)  ;pt.y
   NumPut(0,  p+12) ;fNC
   NumPut(0,  p+16) ;fWide
   p2:=p+20
   Loop,Parse,fns,`n,`r
   {
      DllCall("RtlMoveMemory","UInt",p2,"Str",A_LoopField,"UInt",StrLen(A_LoopField))
      p2+=StrLen(A_LoopField)+1
   }
   DllCall("GlobalUnlock","UInt",hDrop)
   Return hDrop
}

WM_MOVE(wParam, lParam, nMsg, hWnd) { 									;-- UpdateLayeredWindow

If   A_Gui
&&   DllCall("UpdateLayeredWindow", "Uint", hWnd, "Uint", 0, "int64P", (lParam<<48>>48)&0xFFFFFFFF|(lParam&0xFFFF0000)<<32>>16, "Uint", 0, "Uint", 0, "Uint", 0, "Uint", 0, "Uint", 0, "Uint", 0)
WinGetPos, GuiX, GuiY,,, WinTitle
if (GuiY)
Gui, 2: Show, x%GuiX% y%GuiY%
else
Gui, 2: Show, Center
Return   0
}

OnMessage(0x46, "WM_WINDOWPOSCHANGING")
WM_WINDOWPOSCHANGING(wParam, lParam) {							;-- two different examples of handling a WM_WINDOWPOSCHANGING

    if (A_Gui = 1 && !(NumGet(lParam+24) & 0x2)) ; SWP_NOMOVE=0x2
    {
        x := NumGet(lParam+8),  y := NumGet(lParam+12)
        x += 10,  y += 30
        Gui, 2:Show, X%x% Y%y% NA
    }
}
; or
WM_WINDOWPOSCHANGING(wParam, lParam) {

	global

	If (A_Gui = 1 && !(NumGet(lParam+24) & 0x2))
	{
		x := NumGet(lParam+8),  y := NumGet(lParam+12)

		Result := DllCall("SetWindowPos", "UInt", Gui2, "UInt", Gui1, "Int", x-50, "Int", y-50, "Int", "", "Int", "", "Int", 0x01)
	}
	SetTimer, OnTop, 10

	Result := DllCall("SetWindowPos", "UInt", Gui1, "UInt", Gui2, "Int", "", "Int", "", "Int", "", "Int", "", "Int", 0x03)
	;Tooltip, %Result%
	Return

}

CallNextHookEx(nCode, wParam, lParam, hHook = 0) {						;-- Passes the hook information to the next hook procedure in the current hook chain. A hook procedure can call this function either before or after processing the hook information
   Return DllCall("CallNextHookEx", "Uint", hHook, "int", nCode, "Uint", wParam, "Uint", lParam)
}

WM_DEVICECHANGE( wParam, lParam) { 										;-- Detects whether a CD has been inserted instead and also outputs the drive - global drv

Global Drv
 global DriveNotification
 Static DBT_DEVICEARRIVAL := 0x8000 ; http://msdn2.microsoft.com/en-us/library/aa363205.aspx
 Static DBT_DEVTYP_VOLUME := 0x2    ; http://msdn2.microsoft.com/en-us/library/aa363246.aspx

 /*
    When wParam is DBT_DEVICEARRIVAL lParam will be a pointer to a structure identifying the
    device inserted. The structure consists of an event-independent header,followed by event
    -dependent members that describe the device. To use this structure,  treat the structure
    as a DEV_BROADCAST_HDR structure, then check its dbch_devicetype member to determine the
    device type.
 */

 dbch_devicetype := NumGet(lParam+4) ; dbch_devicetype is member 2 of DEV_BROADCAST_HDR

 If ( wParam = DBT_DEVICEARRIVAL AND dbch_devicetype = DBT_DEVTYP_VOLUME )
 {

 ; Confirmed lParam is a pointer to DEV_BROADCAST_VOLUME and should retrieve Member 4
 ; which is dbcv_unitmask

   dbcv_unitmask := NumGet(lParam+12 )

 ; The logical unit mask identifying one or more logical units. Each bit in the mask corres
 ; ponds to one logical drive.Bit 0 represents drive A, Bit 1 represents drive B, and so on

   Loop 32                                           ; Scan Bits from LSB to MSB
     If ( ( dbcv_unitmask >> (A_Index-1) & 1) = 1 )  ; If Bit is "ON"
      {
        Drv := Chr(64+A_Index)                       ; Set Drive letter
        Break
      }
   DriveNotification:=DriveData(Drv)
 }
Return TRUE
}


;}
; OnMessageEx()				|	ReceiveData()					|	HDrop()								|	WM_MOVE()				|	WM_WINDOWPOSCHANGING()	|
; CallNextHookEx()			|	WM_DEVICECHANGE()		|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Internet / Network - Functions (18)

DownloadFile(url, file, info="") {														;--
    static vt
    if !VarSetCapacity(vt)
    {
        VarSetCapacity(vt, A_PtrSize*11), nPar := "31132253353"
        Loop Parse, nPar
            NumPut(RegisterCallback("DL_Progress", "F", A_LoopField, A_Index-1), vt, A_PtrSize*(A_Index-1))
    }
    global _cu, descr
    SplitPath file, dFile
    SysGet m, MonitorWorkArea, 1
    y := mBottom-62-2, x := mRight-330-2, VarSetCapacity(_cu, 100), VarSetCapacity(tn, 520)
    , DllCall("shlwapi\PathCompactPathEx", "str", _cu, "str", url, "uint", 50, "uint", 0)
    descr := (info = "") ? _cu : info . ": " _cu
    Progress Hide CWFAFAF7 CT000020 CB445566 x%x% y%y% w330 h62 B1 FS8 WM700 WS700 FM8 ZH12 ZY3 C11,, %descr%, AutoHotkeyProgress, Tahoma
    if (0 = DllCall("urlmon\URLDownloadToCacheFile", "ptr", 0, "str", url, "str", tn, "uint", 260, "uint", 0x10, "ptr*", &vt))
        FileCopy %tn%, %file%
    else
        ErrorLevel := -1
    Progress Off
    return ErrorLevel
}

NewLinkMsg(VideoSite, VideoName = "") {										;--

   global lng

   TmpMsg := % lng.MSG_NEW_LINK_FOUND . VideoSite . "`r`n"
   if (VideoName <> "")
      TmpMsg := TmpMsg . lng.MSG_NEW_LINK_FILENAME . VideoName . "`r`n`r`n"

	MsgBox 36, %ProgramName%, % TmpMsg lng.MSG_NEW_LINK_ASK, 50
	IfMsgBox Yes
		return, 0
	else
		return, -1

}

TimeGap(ntp="de.pool.ntp.org")	{												;-- Determine by what amount the local system time differs to that of an ntp server

		;Bobo's function
		;https://autohotkey.com/boards/viewtopic.php?f=10&t=34806
		RunWait,% ComSpec " /c w32tm /stripchart /computer:" ntp " /period:1 /dataonly /samples:1 | clip",, Hide ; Query is stored in the clipboard
		array := StrSplit(ClipBoard,"`n")					;disassemble the returned answer after lines
		Return % SubStr(array[4], 10)		                ; difference of time/gap ...

}

GetSourceURL( str ) {																		;--

    FragIdent := RegExReplace( str, "i).*<b.*?>(.*?<!--s\w{11}t-->).*", "$1" )

    For Each, Ident in ( StrSplit( FragIdent, " " ), IdentObj := {} )
        if InStr( Ident, mStr := "SourceURL:" )
            SourceURL := SubStr( Ident, StrLen( mStr )+1 )

    Return SourceURL

}

DNS_QueryName(IP, ByRef NameArray := "") {								;--

   Static OffRR := (A_PtrSize * 2) + 16 ; offset of resource record (RR) within the DNS_RECORD structure
   HDLL := DllCall("LoadLibrary", "Str", "Dnsapi.dll", "UPtr")
   NameArray := []
   IPArray := StrSplit(IP, ".")
   RevIP := IPArray.4 . "." . IPArray.3 . "." . IPArray.2 . "." . IPArray.1 . ".IN-ADDR.ARPA"
   If !DllCall("Dnsapi.dll\DnsQuery_", "Str", RevIP, "Short", 0x0C, "UInt", 0, "Ptr", 0, "PtrP", PDNSREC, "Ptr", 0, "Int") {
      REC_TYPE := NumGet(PDNSREC + 0, A_PtrSize * 2, "UShort")
      If (REC_TYPE = 0x0C) { ; DNS_TYPE_PTR = 0x0C
         PDR := PDNSREC
         While (PDR) {
            Name := StrGet(NumGet(PDR + 0, OffRR, "UPtr"))
            NameArray.Insert(Name)
            PDR := NumGet(PDR + 0, "UPtr")
         }
      }
      DllCall("Dnsapi.dll\DnsRecordListFree", "Ptr", PDNSREC, "Int", 1) ; DnsFreeRecordList = 1
   }
   DllCall("FreeLibrary", "Ptr", HDLL)
   Return NameArray[1] ; returnes the first name from the NameArray on success, otherwise an empty string

}

	;this 4 belongs together
GetHTMLFragment() {																	;--

    FmtArr := EnumClipFormats(), NmeArr := GetClipFormatNames( FmtArr )

    While ( a_index <= NmeArr.Length() && !ClpPtr )
        if ( NmeArr[ a_index ] = "HTML Format" )
            ClpPtr := DllCall( "GetClipboardData", uInt, FmtArr[ a_index ] )

    DllCall( "CloseClipboard" )

    if ( !ClpPtr )
    {
        MsgBox, 0x10, Whoops!, Please Copy Some HTML From a Browser Window!
        Exit
    }

    Return ScrubFragmentIdents( StrGet( ClpPtr, "UTF-8" ) )

}
ScrubFragmentIdents( HTMFrag ) {													;--

    HTMObj := ComObjCreate( "HTMLFile" ), HTMObj.Write( HTMFrag )
    MarkUp := HTMObj.getElementsByTagName( "HTML" )[ 0 ].OuterHtml

    For Needle, Replace in { "(y>).*?(<\w)" : "$1$2", "<!--(s|e).*?-->" : "" }
        MarkUp := RegExReplace( MarkUp, "si)" Needle, Replace )

    Return MarkUp
}
EnumClipFormats() {																		;--
    FmtArr := [], DllCall( "OpenClipboard" )

    While ( DllCall( "CountClipboardFormats" ) >= a_index )
        FmtArr.Push( fmt := DllCall( "EnumClipboardFormats", uint, a_index = 1 ? 0 : fmt ) )

    Return FmtArr
}
GetClipFormatNames( FmtArr ) {													;--
    if ( FmtArr.Length() = False )
    {
        DllCall( "CloseClipboard" )
        Throw "Empty Clipboard Format Array!"
    }

    For Each, Fmt in ( FmtArr, FmtNmArr := [], VarSetCapacity( Buf, 256 ) )
    {
        DllCall( "GetClipboardFormatName", uInt, Fmt, str, Buf, int, 128 )

        if ( Asc( StrGet( &buf ) ) != False  )
            FmtNmArr.Push( StrGet( &buf ) )
    }

    Return FmtNmArr
}
	;------------------------------

GoogleTranslate(phrase,LangIn,LangOut) {									;--

		Critical
		base := "https://translate.google.com.tw/?hl=en&tab=wT#"
		path := base . LangIn . "/" . LangOut . "/" . phrase
		IE := ComObjCreate("InternetExplorer.Application")
		;~ IE.Visible := true
		IE.Navigate(path)

		While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
				Sleep 50

		Result := IE.document.all.result_box.innertext
		IE.Quit

return Result

}

getText(byref html) {																		;-- get text from html

	html:=RegExReplace(html,"[\n\r\t]+","")

	html:=regexreplace(html,"\s{2,}<"," <")
	html:=regexreplace(html,">\s{2,}","> ")
	html:=regexreplace(html,">\s+<","><")

	html:=RegExReplace(html,"is)<script[^>]*>.*?<\s*\/\s*script\s*>","")

	html:=regexreplace(html,"<[^<>]+>","")
	html:=regexreplace(html,"i)&nbsp;"," ")
	return html
}

getHtmlById(byref html,id,outer=false) {											;--
	RegExMatch(html,"is)<([^>\s]+)[^>]*\sid=(?:(?:""" id """)|(?:'" id "')|(?:" id "))[^>]*>(.*?)<\s*\/\s*\1\s*>",match)
	return outer ? match : match2
}

getTextById(byref html,id,trim=true) {												;--
	return trim ? trim(s:=getText(getHtmlById(html,id))) : s
}

getHtmlByTagName(byref html,tagName,outer=false) {					;--
	arr:=[]
	i:=0
	while i:=regexmatch(html,"is)<" tagName "(?:\s[^>]*)?>(.*?)<\s*\/\s*" tagName "\s*>",match,i+1)
		outer ? arr.insert(match) : arr.insert(match1)
	return arr
}

getTextByTagName(byref html,tagName,trim=true) {						;--
	arr:=getHtmlByTagName(html,tagName)
	arr2:=[]
	for k,v in arr
		trim ? arr2.insert(trim(s:=getText(v))) : arr2.insert(s)
	return arr2
}

CreateGist(content, description:="", filename:="file1.ahk", 				;--
token:="", public:=true) {

	url := "https://api.github.com/gists"
	obj := { "description": description
	       , "public": (public ? "true" : "false")
	       , "files": { (filename): {"content": content} } }

	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("POST", url)
	whr.SetRequestHeader("Content-Type", "application/json; charset=utf-8")
	if token {
		whr.SetRequestHeader("Authorization", "token " token)
	}
	whr.Send( JSON_FromObj(obj) )

	if retUrl := JSON_ToObj(whr.ResponseText).html_url
		return retUrl
	else
		throw, whr.ResponseText
}

GetAllResponseHeaders(Url, RequestHeaders := "", 						;-- Gets the values of all HTTP headers
NO_AUTO_REDIRECT := false, NO_COOKIES := false) {

	static INTERNET_OPEN_TYPE_DIRECT := 1
	     , INTERNET_SERVICE_HTTP := 3
	     , HTTP_QUERY_RAW_HEADERS_CRLF := 22
	     , CP_UTF8 := 65001
	     , Default_UserAgent := "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko"

	hModule := DllCall("LoadLibrary", "str", "wininet.dll", "ptr")

	if !hInternet := DllCall("wininet\InternetOpen", "ptr", &Default_UserAgent, "uint", INTERNET_OPEN_TYPE_DIRECT
		, "str", "", "str", "", "uint", 0)
		return
	; -----------------------------------------------------------------------------------
	if !InStr(Url, "://")
		Url := "http://" Trim(Url)

	regex := "(?P<protocol>\w+)://((?P<user>\w+):(?P<pwd>\w+)@)?(?P<host>[\w.]+)(:(?P<port>\d+))?(?P<path>.*)"
	RegExMatch(Url, regex, v_)

	if (v_protocol = "ftp") {
		throw, "ftp is not supported."
	}
	if (v_port = "") {
		v_port := (v_protocol = "https") ? 443 : 80
	}
	; -----------------------------------------------------------------------------------
	Internet_Flags := 0
	                | 0x400000   ; INTERNET_FLAG_KEEP_CONNECTION
	                | 0x80000000 ; INTERNET_FLAG_RELOAD
	                | 0x20000000 ; INTERNET_FLAG_NO_CACHE_WRITE
	if (v_protocol = "https") {
		Internet_Flags |= 0x1000  ; INTERNET_FLAG_IGNORE_CERT_CN_INVALID
		               | 0x2000   ; INTERNET_FLAG_IGNORE_CERT_DATE_INVALID
		               | 0x800000 ; INTERNET_FLAG_SECURE ; Technically, this is redundant for https
	}
	if NO_AUTO_REDIRECT
		Internet_Flags |= 0x00200000 ; INTERNET_FLAG_NO_AUTO_REDIRECT
	if NO_COOKIES
		Internet_Flags |= 0x00080000 ; INTERNET_FLAG_NO_COOKIES
	; -----------------------------------------------------------------------------------
	hConnect := DllCall("wininet\InternetConnect", "ptr", hInternet, "ptr", &v_host, "uint", v_port
		, "ptr", &v_user, "ptr", &v_pwd, "uint", INTERNET_SERVICE_HTTP, "uint", Internet_Flags, "uint", 0, "ptr")

	hRequest := DllCall("wininet\HttpOpenRequest", "ptr", hConnect, "str", "HEAD", "ptr", &v_path
		, "str", "HTTP/1.1", "ptr", 0, "ptr", 0, "uint", Internet_Flags, "ptr", 0, "ptr")

	nRet := DllCall("wininet\HttpSendRequest", "ptr", hRequest, "ptr", &RequestHeaders, "int", -1
		, "ptr", 0, "uint", 0)

	Loop, 2 {
		DllCall("wininet\HttpQueryInfoA", "ptr", hRequest, "uint", HTTP_QUERY_RAW_HEADERS_CRLF
			, "ptr", &pBuffer, "uint*", bufferLen, "uint", 0)
		if (A_Index = 1)
			VarSetCapacity(pBuffer, bufferLen, 0)
	}
	; -----------------------------------------------------------------------------------
	output := StrGet(&pBuffer, "UTF-8")
	; -----------------------------------------------------------------------------------
	DllCall("wininet\InternetCloseHandle", "ptr", hRequest)
	DllCall("wininet\InternetCloseHandle", "ptr", hConnect)
	DllCall("wininet\InternetCloseHandle", "ptr", hInternet)
	DllCall("FreeLibrary", "Ptr", hModule)

	return output

}

NetStat() {																						;--passes information over network connections similar to the netstat -an CMD command.

	/*	Description: a function by jNizM

		https://autohotkey.com/boards/viewtopic.php?t=4372

		this function returns an array:
		- array[x].proto ;(Das Protokoll der Verbindung -> TCP oder UDP)
		- array[x].ipv ;(Die IP-Version -> 4 oder 6)
		- array[x].localIP ;(Lokale IP Adresse)
		- array[x].localPort ;(Lokaler Port)
		- array[x].localScopeId ;(Lokale Scope ID... nur IPv6)
		- array[x].remoteIP ;(Remote IP Adresse... nur TCP)
		- array[x].remotePort ;(Remote Port :HeHe: ... nur TCP)
		- array[x].remoteScopeId ;(nur TCP/IPv6)
		- array[x].status ;(der Status der Verbindung -> LISTEN, ESTABLISHED, TIME-WAIT, etc...)

	*/

	c := 32
	static status := {1:"CLOSED", 2:"LISTEN", 3:"SYN-SENT", 4:"SYN-RECEIVED"
	, 5:"ESTABLISHED", 6:"FIN-WAIT-1", 7:"FIN-WAIT-2", 8:"CLOSE-WAIT"
	, 9:"CLOSING", 10:"LIST-ACK", 11:"TIME-WAIT", 12:"DELETE-TCB"}

	iphlpapi := DllCall("LoadLibrary", "str", "iphlpapi", "ptr")
	list := []

	VarSetCapacity(tbl, 4+(s := (20*c)), 0)
	while (DllCall("iphlpapi\GetTcpTable", "ptr", &tbl, "uint*", s, "uint", 1)=122)
	VarSetCapacity(tbl, 4+s, 0)

	Loop, % NumGet(tbl, 0, "uint")
	{
		o := 4+((A_Index-1)*20)
		t := {proto:"TCP", ipv:4}
		t.localIP := ((dw := NumGet(tbl, o+4, "uint"))&0xff) "." ((dw&0xff00)>>8) "." ((dw&0xff0000)>>16) "." ((dw&0xff000000)>>24)
		t.localPort := (((dw := NumGet(tbl, o+8, "uint"))&0xff00)>>8)|((dw&0xff)<<8)
		t.remoteIP := ((dw := NumGet(tbl, o+12, "uint"))&0xff) "." ((dw&0xff00)>>8) "." ((dw&0xff0000)>>16) "." ((dw&0xff000000)>>24)
		t.remotePort := (((dw := NumGet(tbl, o+16, "uint"))&0xff00)>>8)|((dw&0xff)<<8)
		t.status := status[NumGet(tbl, o, "uint")]
		list.insert(t)
	}

	if (DllCall("GetProcAddress", "ptr", iphlpapi, "astr", "GetTcp6Table", "ptr"))
	{
		VarSetCapacity(tbl, 4+(s := (52*c)), 0)
		while (DllCall("iphlpapi\GetTcp6Table", "ptr", &tbl, "uint*", s, "uint", 1)=122)
			VarSetCapacity(tbl, 4+s, 0)

		Loop, % NumGet(tbl, 0, "uint")
		{
			VarSetCapacity(str, 94, 0)
			o := 4+((A_Index-1)*52)
			t := {proto:"TCP", ipv:6}
			t.localIP := (DllCall("ws2_32\InetNtop", "uint", 23, "ptr", &tbl+o+4, "ptr", &str, "uint", 94)) ? StrGet(&str) : ""
			t.localScopeId := (((dw := NumGet(tbl, o+20, "uint"))&0xff)<<24) | ((dw&0xff00)<<8) | ((dw&0xff0000)>>8) | ((dw&0xff000000)>>24)
			t.localPort := (((dw := NumGet(tbl, o+24, "uint"))&0xff00)>>8)|((dw&0xff)<<8)
			t.remoteIP := (DllCall("ws2_32\InetNtop", "uint", 23, "ptr", &tbl+o+28, "ptr", &str, "uint", 94)) ? StrGet(&str) : ""
			t.remoteScopeId := (((dw := NumGet(tbl, o+44, "uint"))&0xff)<<24) | ((dw&0xff00)<<8) | ((dw&0xff0000)>>8) | ((dw&0xff000000)>>24)
			t.remotePort := (((dw := NumGet(tbl, o+48, "uint"))&0xff00)>>8)|((dw&0xff)<<8)
			t.status := status[NumGet(tbl, o, "uint")]
			list.insert(t)
		}
	}

	VarSetCapacity(tbl, 4+(s := (8*c)), 0)
	while (DllCall("iphlpapi\GetUdpTable", "ptr", &tbl, "uint*", s, "uint", 1)=122)
	VarSetCapacity(tbl, 4+s, 0)

	Loop, % NumGet(tbl, 0, "uint")
	{
		o := 4+((A_Index-1)*20)
		t := {proto:"UDP", ipv:4}
		t.localIP := ((dw := NumGet(tbl, o, "uint"))&0xff) "." ((dw&0xff00)>>8) "." ((dw&0xff0000)>>16) "." ((dw&0xff000000)>>24)
		t.localPort := (((dw := NumGet(tbl, o+4, "uint"))&0xff00)>>8)|((dw&0xff)<<8)
		list.insert(t)
	}

	if (DllCall("GetProcAddress", "ptr", iphlpapi, "astr", "GetUdp6Table", "ptr"))
	{
		VarSetCapacity(tbl, 4+(s := (52*c)), 0)
		while (DllCall("iphlpapi\GetUdp6Table", "ptr", &tbl, "uint*", s, "uint", 1)=122)
			VarSetCapacity(tbl, 4+s, 0)

		Loop, % NumGet(tbl, 0, "uint")
		{
			VarSetCapacity(str, 94, 0)
			o := 4+((A_Index-1)*52)
			t := {proto:"UDP", ipv:6}
			t.localIP := (DllCall("ws2_32\InetNtop", "uint", 23, "ptr", &tbl+o, "ptr", &str, "uint", 94)) ? StrGet(&str) : ""
			t.localScopeId := (((dw := NumGet(tbl, o+16, "uint"))&0xff)<<24) | ((dw&0xff00)<<8) | ((dw&0xff0000)>>8) | ((dw&0xff000000)>>24)
			t.localPort := (((dw := NumGet(tbl, o+20, "uint"))&0xff00)>>8)|((dw&0xff)<<8)
			list.insert(t)
		}
	}
	return list
}

;}
; DownloadFile()				|	NewLinkMsg()					|	TimeGap()							|	GetSourceURL()					|	DNS_QueryName()			|
; GetHTMLFragment()			|	ScrubFragmentIdents()		|	EnumClipFormats()				|	GetClipFormatNames()			|	GoogleTranslate()				|
; getText()						|	getHtmlById()					|	getTextById()						|	getHtmlByTagName()				|	getTextByTagName()			|
; DNS_QueryName()			|	CreateGist()						|	GetAllResponseHeaders()		|	NetStat()								|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Math functions (5)
Min(x, y) {																						;-- returns the smaller of 2 numbers
  return x < y ? x : y
}

Max(x, y) {																					;-- determines the larger number
  return x > y ? x : y
}

Mean(List) {																					;-- returns Average values in comma delimited list

	;https://autohotkey.com/board/topic/4858-mean-median-mode-functions/

	Loop, Parse, List , `,
	{
		Total += %A_LoopField%
		D = %A_Index%
	}
	R := Total/D

	Return R
}

Median(List) {																				;-- returns Median in a set of numbers from a list

	;https://autohotkey.com/board/topic/4858-mean-median-mode-functions/
	;list must be comma delimited

	Sort, List, N D,  ; Sort numerically, use comma as delimiter.

	;Create Array
	StringSplit, Set, List, `,

	;Figure if odd or even
	R := Set0 / 2
	StringSplit, B, R, .
	StringLeft, C, B2, 1

	;Even
	If (C = 0) {
		pt1 := B1 + 1
		Med := (Set%B1% + Set%pt1%) / 2
	} Else {				;Odd
		Med := Ceil(R)
		Med := Set%Med%
	}

	Return Med
}

Mode(List) {																					;-- returns the mode from a list of numbers

	;https://autohotkey.com/board/topic/4858-mean-median-mode-functions/

	StringSplit, Cont, List, `,

	Loop, %Cont0% {

		i := A_Index
		C := Cont%i%
		If ModeArr%C% =
			ModeArr%C% = 1
		Else {
			Amt := ModeArr%C%
			ModeArr%C% := Amt + 1
		}
	}

	Loop %i%	{
		LMC = %CMC%
		CMC := ModeArr%A_Index%
		If CMC > %LMC%
			Mode = %A_Index%
	}

	Return Mode

}

;}
; Min()							|	Max()								|	Mean()								|	Median()								|	Mode()							|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;{Object functions (3)

ObjMerge(OrigObj, MergingObj, MergeBase=True) {					;--

    If !IsObject(OrigObj) || !IsObject(MergingObj)
        Return False
    For k, v in MergingObj
        ObjInsert(OrigObj, k, v)
    if MergeBase && IsObject(MergingObj.base) {
        If !IsObject(OrigObj.base)
            OrigObj.base := []
        For k, v in MergingObj.base
            ObjInsert(OrigObj.base, k, v)
    }
    Return True

}

evalRPN(s) { 																					;-- Parsing/RPN calculator algorithm

	/*											Example

			evalRPN("3 4 2 * 1 5 - 2 3 ^ ^ / +")

	*/

	stack := []
	out := "For RPN expression: '" s "'`r`n`r`nTOKEN`t`tACTION`t`t`tSTACK`r`n"
	Loop Parse, s
		If A_LoopField is number
			t .= A_LoopField
		else
		{
			If t
				stack.Insert(t)
				, out .= t "`tPush num onto top of stack`t" stackShow(stack) "`r`n"
				, t := ""
			If InStr("+-/*^", l := A_LoopField)
			{
				a := stack.Remove(), b := stack.Remove()
				stack.Insert(	 l = "+" ? b + a
						:l = "-" ? b - a
						:l = "*" ? b * a
						:l = "/" ? b / a
						:l = "^" ? b **a
						:0	)
				out .= l "`tApply op " l " to top of stack`t" stackShow(stack) "`r`n"
			}
		}
	r := stack.Remove()
	out .= "`r`n The final output value is: '" r "'"
	clipboard := out
	return r
}
StackShow(stack){																			;--

	for each, value in stack
		out .= A_Space value
	return subStr(out, 2)

}


;}
; ObjMerge()					|	evalRPN()						|	StackShow()							|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{String - Array Operations (25)

Sort2DArray(Byref TDArray, KeyName, Order=1) {							;-- a two dimensional TDArray

   ;TDArray : a two dimensional TDArray
   ;KeyName : the key name to be sorted
   ;Order: 1:Ascending 0:Descending

    For index2, obj2 in TDArray {
        For index, obj in TDArray {
            if (lastIndex = index)
                break
            if !(A_Index = 1) &&  ((Order=1) ? (TDArray[prevIndex][KeyName] > TDArray[index][KeyName]) : (TDArray[prevIndex][KeyName] < TDArray[index][KeyName])) {
               tmp := TDArray[index][KeyName]
               TDArray[index][KeyName] := TDArray[prevIndex][KeyName]
               TDArray[prevIndex][KeyName] := tmp
            }
            prevIndex := index
        }
        lastIndex := prevIndex
    }
}

SortArray(Array, Order="A") {														;-- ordered sort: Ascending, Descending, Reverse

    ;Order A: Ascending, D: Descending, R: Reverse
    MaxIndex := ObjMaxIndex(Array)
    If (Order = "R") {
        count := 0
        Loop, % MaxIndex
            ObjInsert(Array, ObjRemove(Array, MaxIndex - count++))
        Return
    }
    Partitions := "|" ObjMinIndex(Array) "," MaxIndex
    Loop {
        comma := InStr(this_partition := SubStr(Partitions, InStr(Partitions, "|", False, 0)+1), ",")
        spos := pivot := SubStr(this_partition, 1, comma-1) , epos := SubStr(this_partition, comma+1)
        if (Order = "A") {
            Loop, % epos - spos {
                if (Array[pivot] > Array[A_Index+spos])
                    ObjInsert(Array, pivot++, ObjRemove(Array, A_Index+spos))
            }
        } else {
            Loop, % epos - spos {
                if (Array[pivot] < Array[A_Index+spos])
                    ObjInsert(Array, pivot++, ObjRemove(Array, A_Index+spos))
            }
        }
        Partitions := SubStr(Partitions, 1, InStr(Partitions, "|", False, 0)-1)
        if (pivot - spos) > 1    ;if more than one elements
            Partitions .= "|" spos "," pivot-1        ;the left partition
        if (epos - pivot) > 1    ;if more than one elements
            Partitions .= "|" pivot+1 "," epos        ;the right partition
    } Until !Partitions
}

GetNestedTag(data,tag,occurrence="1") {										;--

	; AHK Forum Topic : http://www.autohotkey.com/forum/viewtopic.php?t=77653
   ; Documentation   : http://www.autohotkey.net/~hugov/functions/GetNestedTag.html

	 Start:=InStr(data,tag,false,1,occurrence)
	 RegExMatch(tag,"i)<([a-z]*)",basetag) ; get yer basetag1 here
	 Loop
		{
		 Until:=InStr(data, "</" basetag1 ">", false, Start, A_Index) + StrLen(basetag1) + 3
 		 Strng:=SubStr(data, Start, Until - Start)

		 StringReplace, strng, strng, <%basetag1%, <%basetag1%, UseErrorLevel ; start counting to make match
		 OpenCount:=ErrorLevel
		 StringReplace, strng, strng, </%basetag1%, </%basetag1%, UseErrorLevel
		 CloseCount:=ErrorLevel
		 If (OpenCount = CloseCount)
		 	Break

		 If (A_Index > 250) ; for safety so it won't get stuck in an endless loop,
		 	{                 ; it is unlikely to have over 250 nested tags
		 	 strng=
		 	 Break
		 	}
		}
	 If (StrLen(strng) < StrLen(tag)) ; something went wrong/can't find it
	 	strng=
	 Return strng
	}

GetHTMLbyID(HTMLSource, ID, Format=0) {									;-- uses COM

	;Format 0:Text 1:HTML 2:DOM
	ComError := ComObjError(false), `(oHTML := ComObjCreate("HtmlFile")).write(HTMLSource)
	if (Format = 2) {
		if (innerHTML := oHTML.getElementById(ID)["innerHTML"]) {
			`(oDOM := ComObjCreate("HtmlFile")).write(innerHTML)
			Return oDOM, ComObjError(ComError)
		} else
			Return "", ComObjError(ComError)
	} else
	Return (result := oHTML.getElementById(ID)[(Format ? "innerHTML" : "innerText")]) ? result : "", ComObjError(ComError)

}

GetHTMLbyTag(HTMLSource, Tag, Occurrence=1, Format=0) {		;-- uses COM

	;Format 0:Text 1:HTML 2:DOM
	ComError := ComObjError(false), `(oHTML := ComObjCreate("HtmlFile")).write(HTMLSource)
	if (Format = 2) {
		if (innerHTML := oHTML.getElementsByTagName(Tag)[Occurrence-1]["innerHTML"]) {
			`(oDOM := ComObjCreate("HtmlFile")).write(innerHTML)
			Return oDOM, ComObjError(ComError)
		} else
			Return "", ComObjError(ComError)
	}
	return (result := oHTML.getElementsByTagName(Tag)[Occurrence-1][(Format ? "innerHTML" : "innerText")]) ? result : "", ComObjError(ComError)

}

GetXmlElement(xml, pathToElement) {											;-- RegEx function

   Loop, parse, pathToElement, .,
   {
      elementName:=A_LoopField
      regex=<%elementName%>(.*)</%elementName%>

      RegExMatch(xml, regex, xml)
      ;TODO switch to use xml1, instead of parsing stuff out
      ;errord("nolog", xml1)
      xml := StringTrimLeft(xml, strlen(elementName)+2)
      xml := StringTrimRight(xml, strlen(elementName)+3)
   }

   return xml

}

sXMLget( xml, node, attr = "" ) {														;--

	;  by infogulch - simple solution get information out of xml and html
	;  supports getting the values from a nested nodes; does NOT support decendant/ancestor or sibling
	;  for something more than a little complex, try Titan's xpath: http://www.autohotkey.com/forum/topic17549.html

	RegExMatch( xml
      , (attr ? ("<" node "\b[^>]*\b" attr "=""(?<match>[^""]*)""[^>]*>") : ("<" node "\b[^>/]*>(?<match>(?<tag>(?:[^<]*(?:<(\w+)\b[^>]*>(?&tag)</\3>)*)*))</" node ">"))
      , retval )
   return retvalMatch

}

ParseJsonStrToArr(json_data) {														;-- Parse Json string to an array

	;-----------------------------
	;
	; Function: ParseJsonStrToArr(v1.2.1)
	; Description:
	;		Parse Json string to an array
	; Syntax: ParseJsonStrToArr(json_data)
	; Parameters:
	;       json_data - json string
	; Return Value:
	;		return an array
	; Remarks:
	;		Each item in the array still is string type
	; Related:
	;		N/A
	; Example:
	;		j := "[{'id':'a1','subject':'s1'},{'id':'a2','subject':'s2},{'id':'a3','subject':'s3'}]"
	;		arr = ParseJsonStrToArr(j)
	;
	;-------------------------------------------------------------------------------


   arr := []
   pos :=1
   While pos:=RegExMatch(json_data,"((?:{)[\s\S][^{}]+(?:}))", j, pos+StrLen(j))
   {
	arr.Insert(j1)                      ; insert json string to array  arr=[{"id":"a1","subject":"s1"},{"id":"a2","subject":"s2"},{"id":"a3","subject":"s3"}]
   }
   return arr
}

parseJSON(txt) {																			;-- Parse Json string to an object

	out := {}
	Loop																				; Go until we say STOP
	{
		ind := A_index															; INDex number for whole array
		ele := strX(txt,"{",n,1, "}",1,1, n)									; Find next ELEment {"label":"value"}
		if (n > strlen(txt)) {
			break																	; STOP when we reach the end
		}
		sub := StrSplit(ele,",")												; Array of SUBelements for this ELEment
		Loop, % sub.MaxIndex()
		{
			StringSplit, key, % sub[A_Index] , : , `"					; Split each SUB into label (key1) and value (key2)
			out[ind,key1] := key2											; Add to the array
		}
	}
	return out

}

AddTrailingBackslash(ptext) {															;--

	if (SubStr(ptext, 0, 1) <> "\")
		return, ptext . "\"
	return, ptext

}

CheckQuotes(Path) {																		;--

   if (InStr(Path, A_Space, false) <> 0)
   {
      Path = "%Path%"
   }
   return, Path
}

ReplaceForbiddenChars(S_IN, ReplaceByStr = "") {							;--

   S_OUT := ""
   Replace_RegEx := "im)[\/:*?""<>|]*"

   S_OUT := RegExReplace(S_IN, Replace_RegEx, "")
   if (S_OUT = 0)
      return, S_IN
   if (ErrorLevel = 0) and (S_OUT <> "")
      return, S_OUT

}

cleanlines(ByRef txt) {																		;--

	Loop, Parse, txt, `n, `r
	{
		i := A_LoopField
		if !(i){
			continue
		}
		newtxt .= i "`n"
	}
	txt := newtxt
	return txt
}

cleancolon(txt) {																			;--

	if substr(txt,1,1)=":" {
		txt:=substr(txt,2)
		txt = %txt%
	}
	return txt

}

cleanspace(ByRef txt) {																	;--

	StringReplace txt,txt,`n`n,%A_Space%, All
	StringReplace txt,txt,%A_Space%.%A_Space%,.%A_Space%, All
	loop
	{
		StringReplace txt,txt,%A_Space%%A_Space%,%A_Space%, UseErrorLevel
		if ErrorLevel = 0
			break
	}
	return txt
}

uriEncode(str) { 																				;-- A function to escape characters like & for use in URLs.

    f = %A_FormatInteger%
    SetFormat, Integer, Hex
    If RegExMatch(str, "^\w+:/{0,2}", pr)
        StringTrimLeft, str, str, StrLen(pr)
    StringReplace, str, str, `%, `%25, All
    Loop
        If RegExMatch(str, "i)[^\w\.~%/:]", char)
           StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
        Else Break
    SetFormat, Integer, %f%
    Return, pr . str
}

EnsureEndsWith(string, char) {  														;-- Ensure that the string given ends with a given char

   if ( StringRight(string, strlen(char)) <> char )
      string .= char

   return string
}

EnsureStartsWith(string, char) { 														;-- Ensure that the string given starts with a given char
   if ( StringLeft(string, strlen(char)) <> char )
      string := char . string

   return string
}

StrPutVar(string, ByRef var, encoding) {    										;-- Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on
   ;{-------------------------------------------------------------------------------
    ;
    ; Function: StrPutVar
    ; Description:
    ;		Convert the data to some Enc, like UTF-8, UTF-16, CP1200 and so on
    ; Syntax: StrPutVar(Str, ByRef Var [, Enc = ""])
    ; Parameters:
    ;		Str - String
    ;		Var - The name of the variable
    ;		Enc - Encoding
    ; Return Value:
    ;		String in a particular encoding
    ; Example:
    ;		None
    ;
    ;-------------------------------------------------------------------------------
    ;}


    VarSetCapacity( var, StrPut(string, encoding)
        * ((encoding="cp1252"||encoding="utf-16") ? 2 : 1) )
    return StrPut(string, &var, encoding)
}

Ansi2Unicode(ByRef sString, ByRef wString, CP = 0) {						;--
     nSize := DllCall("MultiByteToWideChar"
      , "Uint", CP
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", 0
      , "int",  0)

   VarSetCapacity(wString, nSize * 2)

   DllCall("MultiByteToWideChar"
      , "Uint", CP
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", &wString
      , "int",  nSize)
}

Unicode2Ansi(ByRef wString, ByRef sString, CP = 0) {						;--
     nSize := DllCall("WideCharToMultiByte"
      , "Uint", CP
      , "Uint", 0
      , "Uint", &wString
      , "int",  -1
      , "Uint", 0
      , "int",  0
      , "Uint", 0
      , "Uint", 0)

   VarSetCapacity(sString, nSize)

   DllCall("WideCharToMultiByte"
      , "Uint", CP
      , "Uint", 0
      , "Uint", &wString
      , "int",  -1
      , "str",  sString
      , "int",  nSize
      , "Uint", 0
      , "Uint", 0)
}

QuickSort(Arr, Ascend = True, M*) {												;-- Sort array using QuickSort algorithm

	;******************************************************************************
	;                          QuickSort
	; 		Sort array using QuickSort algorithm
	;		https://autohotkey.com/boards/viewtopic.php?t=17312
	;
	;    	ARR - Array to be sorted or Matrix to be sorted (By Column)
	;     	ASCEND is TRUE if sort is in ascending order
	;     	*M => VET1,VET2, - Optional arrays of same size to be sorted accordingly
	;        or NCOL - Column number in ARR to be sorted if ARR is a matrix
	;
	; Limitation: Don't check if arrays are sparse arrays.
	;             Assume dense arrays or matrices with integer indices starting from 1.
	;******************************************************************************

	/*		EXAMPLES

	;******************************************************************************************
	;                       PrintMat
	; Sample for print examples
	;*******************************************************************************************
	PrintMat(VetG, bG = 0, cG = 0) 	{
	Local StOut := "", k, v
	If IsObject(VetG[1])
		for k, v in VetG {
			for j, w in v
				StOut := StOut . w  . " - "
			StOut := StOut . "@r@n"
		}
	Else  {
	  for k, v in VetG
		StOut := StOut . v  . ","
	  StOut := StOut . "@r@n"
	  If (bG<> 0) {
		for k, v in bG
		 StOut := StOut . v  . ","
		StOut := StOut . "@r@n"
	  }
	  If (cG<>0) {
		for k, v in cG
		  StOut := StOut . v  . ","
	   }
	}
	MsgBox 0, Example, % StOut
	}

	;**** FIRST EXAMPLE ****

	#EscapeChar @   ;  Changes escape character from ' (default) to  @
	aG := [2, 3, 1, 5, 4]
	bG := ["Butterfly", "Cat","Animal", "Zebra", "Elephant"]
	cG := ["B","C", "A","Z","E"]
	VetG := QuickSort(aG,False,bG,cG)
	PrintMat(VetG,bG,cG)

	;**** SECOND EXAMPLE ****

	#EscapeChar @   ;  Changes escape character from ' (default) to  @
	MatG := [ [2, "Animal", "Z" ],  [3, "Elephant", "E" ],  [1, "Cat", "C" ] ,  [5, "Butterfly", "B" ],  [4, "Zebra", "A" ] ]
	MatG := QuickSort(MatG,True,2)
	PrintMat(MatG)

	*/

	Local I, V, Out, L,  Rasc, N, LI, Multi, ComprM, NCol, Ind

	if (Arr.Length() <= 1) ; Array with size <= 1 is already sorted
		return Arr

	If (Not Isobject(Arr))
		return "First parameter needs to be a array"

	LenM := M.Length()    ; Number of parameters after ASCEND
	NCol := 0               ; Assumes initially no matrix
	HasOtherArrays := ( LenM > 0 )   ; TRUE if has other arrays or column number

	Multi := False
	IF HasOtherArrays {
	   Multi := Not IsObject(M[1])  ; True if ARR is bidimensional
	   If (Multi) {
		 NCol := M[1]                 ; Column number of bidimensional array
		 HasOtherArrays :=  False

		 If NCol is Not Integer
			return "Third parameter needs to be a valid column number"
		 If (Not IsObject(Arr(1)))
			return "First parameter needs to be a multidimensional array"
		 If ( (NCol<=0) or (NCol > Arr[1].Length()) )
			return "Third parameter needs to be a valid column number"
	   }
	}

	If (Not Multi)  {
	   If (IsObject(Arr[1]))
		 return "If first parameter is a bidimensional array, it demands a column number"
	}


	LI := 0
	N := 0
	IF (HasOtherArrays)  {
	   Loop % LenM {    ; Scan aditional array parameters
		 Ind := A_INDEX
		 V := M[Ind]
		 If (IsObject(V[1]))
			return  (Ind+2) . "o. parameter needs to be a single array"
	   }

	   LI := 1   ; Assumes 1 as the array/matrix start
	   N := Arr.Clone()   ; N : Array with same size than Array to be sorted
	   L := Arr.Length()  ; L : Array Size

	   Loop % L
		   N[A_INDEX] := A_INDEX  ; Starts with index number of each element from array
	}


	 ; Sort ARR with ASCEND, N is array with elements positions and
	 ;  LI is 1 if has additional arrays to be sorted
	 ;  NCOL is column number to be sorted if ARR is a bidimensional array
	Out :=  QuickAux(Arr, Ascend, N, LI, NCol)

	; Scan additional arrays storing the original position in sorted array
	If (HasOtherArrays)  {
		Loop % ComprM {
		   V := M[A_Index]  ; Current aditional array
		   Rasc := V.Clone()
		   Loop % L     ; Put its elements in the sorted order based on position of sorted elements in the original array
			   V[A_INDEX] := Rasc[N[A_Index]]
		}
	}

	Return Out
}
;{ sub -depending functions for QuickSort
QuickAux(Arr,Ascend, N, LI, NCol) {
;=================================================================
;                       QuickAux
; Auxiliary recursive function to make a Quicksort in a array ou matrix
;    ARR - Array or Matrix to be sorted
;    ASCEND - TRUE if sort is ascending
;    N   - Array with original elements position
;    LI  - Position of array ARR in the array from parent recursion
;    NCOL - Column number in Matrix to be sorted. O in array case.
;===================================================================

Local Bef, Aft, Mid
Local Before, Middle, After
Local Pivot, kInd, vElem, LAr, Met
Local LB := 0, LM := 0, LM := 0

LAr := Arr.Length()

if (LAr <= 1)
	return Arr

IF (LI>0) {    ; Has Another Arrays
   Bef := [],  Aft := [], Mid := []
}

Before := [], Middle := [], After := []


Met := LAr // 2    ; Regarding speed, halfway is the Best pivot element for almost sorted array and matrices

If (NCol > 0)
   Pivot := Arr[Met,NCol]
else
   Pivot := Arr[Met]  ; PIVOT is Random  element in array

; Classify array elems in 3 groups: Greater than PIVOT, Lower Than PIVOT and equal
for kInd, vElem in Arr     {
	if (NCol > 0)
		Ch := vElem[NCol]
	else
		Ch := vElem

	if ( Ascend ? Ch < Pivot : Ch > Pivot )  {
			Before.Push(vElem)    ; Append vElem at BEFORE
			IF (LI>0)             ; if has another arrays
		       Bef.Push(N[kInd+LI-1])     ; Append index to original element at BEF
		} else if ( Ascend ? Ch > Pivot : Ch < Pivot ) {
		    After.Push(vElem)
  		    IF (LI>0)
               Aft.Push(N[kInd+LI-1])
		} else  {
			Middle.Push(vElem)
  			IF (LI>0)
   		       Mid.Push(N[kInd+LI-1])
  	    }
}

;  Put pieces of array with index to elements together in N
IF (LI>0) {
	LB := Bef.Length()
	LM := Mid.Length()
	LA := Aft.Length()

	Loop % LB
	  N[LI + A_INDEX - 1] := Bef[A_INDEX]

	Loop % LM
	  N[LI + LB +  A_INDEX - 1] := Mid[A_INDEX]

	Loop % LA
	  N[LI + LB + LM + A_INDEX - 1] := Aft[A_INDEX]
}

; Concat BEFORE, MIDDLE and AFTER Arrays
; BEFORE and AFTER arrays need to be sorted before
; N stores the array position to be sorted in the original array
return Cat(QuickAux(Before,Ascend,N,LI,NCol), Middle, QuickAux(After,Ascend,N,LI+LB+LM,NCol)) ; So Concat the sorted BEFORE, MIDDLE and sorted AFTER arrays
}

Cat(Vet*) {

	;*************************************************************
	;                       Cat
	; Concat 2 or more arrays or matrices by rows
	;**************************************************************

	Local VRes := [] , L, i, V
	For I , V in Vet {
		L := VRes.Length()+1
		If ( V.Length() > 0 )
			VRes.InsertAt(L,V*)
	}
	Return VRes
}

CatCol(Vet*) {

	;***************************************************************************
	;                       CatCol
	; Concat 2 or more matrices by columns
	; Is a aditional function no used directly in QuickSort, but akin with Cat
	;*************************************************************************

	Local VRes := [] , L, I, V, VAux, NLins, NL, Aux, NC, NV, NCD

	NVets := Vet.Length()          ; Number of parameters
	NLins := Vet[1].Length()       ; Number of rows from matrix

	VRes := []

	Loop % NLins  {
		NL := A_INDEX      ; Current Row
		ColAcum := 0
		Loop % NVets  {
			NV := A_INDEX  ; Current Matrix
			NCols := Vet[NV,1].Length()
			Loop % NCols  {
				NC := A_INDEX  ; Current Column
				NCD := A_INDEX + ColAcum   ; Current Column in Destination
				Aux := Vet[NV,NL,NC]
				VRes[NL,NCD] := Aux
			}
			ColAcum := ColAcum + NCols
		}
	}
	Return VRes
}
;}

RegExSplit(ByRef psText, psRegExPattern, piStartPos:=1) {				;-- split a String by a regular expressin pattern and you will receive an array as a result

	;https://autohotkey.com/board/topic/123708-useful-functions-collection/ - ObiWanKenobi
	;Parameters for RegExSplit:
	;psText                      the text you want to split
	;psRegExPattern      the Regular Expression you want to use for splitting
	;piStartPos               start at this posiiton in psText (optional parameter)
	;function ExtractSE() is a helper-function to extract a string at a specific start and end position.

	aRet := []
	if (psText != "") 	{

		iStartPos := piStartPos
		while (iPos := RegExMatch(psText, "P)" . psRegExPattern, match, iStartPos)) {

			sFound := ExtractSE(psText, iStartPos, iPos-1)
			aRet.Push(sFound)
			iStartPos := iPos + match
		}
        sFound := ExtractSE(psText, iStartPos)
        aRet.Push(sFound)
	}
	return aRet
}
;{ sub -depending functions for RegExSplit
ExtractSE(ByRef psText, piPosStart, piPosEnd:="") {
	if (psText != "")
	{
		piPosEnd := piPosEnd != "" ? piPosEnd : StrLen(psText)
		return SubStr(psText, piPosStart, piPosEnd-(piPosStart-1))
	}
}
;}



;}
; Sort2DArray()					|	SortArray()						|	GetNestedTag()					|	GetHTMLbyID()					|	GetHTMLbyTag()				|
; GetXmlElement()				|	sXMLget()						|	ParseJsonStrToArr()				|	parseJSON()						|	AddTrailingBackslash()		|
; CheckQuotes()				|	ReplaceForbiddenChars()	|	cleanlines()							|	cleancolon()							|	cleanspace()					|
; uriEncode()					|	EnsureEndsWith()				|	EnsureStartsWith()					|	StrPutVar()							|
; Ansi2Unicode()				|	Unicode2Ansi()					|	QuickSort()							|	RegExSplit()							|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Keys - Hotkeys - Hotstring - functions (2)
DelaySend(Key, Interval=200, SendMethod="Send") { 					;-- Send keystrokes delayed

	/*
	Sends keystrokes with a specified delay. It will be useful for an application which does not accept key presses sent too quickly.
	Remarks
	It remembers the sent count and completes them all.
	Requirements
	AutoHotkey_L v1.1.01 or later.  Tested on: Windows 7 64bit, AutoHotkey 32bit Unicode 1.1.05.01.
	*/

	static KeyStack := []
    KeyStack[Key] := IsObject(KeyStack[Key]) ? KeyStack[Key] : {base: {LastTickCount: 0}}
    ObjInsert( KeyStack[Key], { Key: Key, Interval: Interval, SendMethod: SendMethod })
    Gosub, Label_DelaySend
    Return

    Label_DelaySend:
        For Key in KeyStack {
            if !(MinIndex := KeyStack[Key].MinIndex())
                Continue
            Span := A_TickCount - KeyStack[Key].LastTickCount
            if (Span < KeyStack[Key][MinIndex].Interval)    ;loaded too early
                SetTimer,, % -1 * (KeyStack[Key][KeyStack[Key].MinIndex()].Interval - Span)     ;[v1.1.01+]
            else {
                SendMethod := KeyStack[Key][MinIndex].SendMethod
                SendingKey := KeyStack[Key][MinIndex].Key
                if (SendMethod = "SendInput")
                    SendInput, % SendingKey
                Else if (SendMethod = "SendPlay")
                    SendPlay, % SendingKey
                Else if (SendMethod = "SendRaw")
                    SendRaw, % SendingKey
                Else if (SendMethod = "SendEvent")
                    SendEvent, % SendingKey
                Else
                    Send, % SendingKey

                ObjRemove(KeyStack[Key], MinIndex)    ;decrement other elements
                if KeyStack[Key].MinIndex() ;if there is a next queue
                    SetTimer,, % -1 * KeyStack[Key][KeyStack[Key].MinIndex()].Interval        ;[v1.1.01+]
                KeyStack[Key].base.LastTickCount := A_TickCount
            }
        }
    Return
}

SetLayout(layout, winid) {																;-- set a keyboard layout
    Result := (DllCall("LoadKeyboardLayout", "Str", layout, "UInt", "257"))
    DllCall("SendMessage", "UInt", winid, "UInt", "80", "UInt", "1", "UInt", Result)
}

;}
; DelaySend()					|	SetLayout()						|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{ToolTips - messages (1)
ShowTrayBalloon(TipTitle = "", TipText = "", ShowTime = 5000, TipType = 1) {	;--

   global cfg

   if (not cfg.ShowBalloons)
      return, 0
   gosub, RemoveTrayTip
   if (TipText <> "")
   {
      Title := (TipTitle <> "") ? TipTitle : ProgramName
      TrayTip, %Title%, %TipText%, 10, %TipType%+16
      SetTimer, RemoveTrayTip, %ShowTime%
   }
   else
   {
      gosub, RemoveTrayTip
      return, 0
   }
   return, 0

   RemoveTrayTip:
      SetTimer, RemoveTrayTip, Off
      TrayTip
   return
}


;}
; ShowTrayBalloon()			|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{System functions - binary handling in memory (18)

CreateNamedPipe(Name, OpenMode=3, PipeMode=0, MaxInstances=255) {		;--
    return DllCall("CreateNamedPipe","str","\\.\pipe\" Name,"uint",OpenMode
        ,"uint",PipeMode,"uint",MaxInstances,"uint",0,"uint",0,"uint",0,"uint",0)
}

RestoreCursors() {																									;--
   SPI_SETCURSORS := 0x57
   DllCall( "SystemParametersInfo", UInt,SPI_SETCURSORS, UInt,0, UInt,0, UInt,0 )
}

SetSystemCursor( Cursor = "", cx = 0, cy = 0 ) {														;--

	BlankCursor := 0, SystemCursor := 0, FileCursor := 0
	SystemCursors = 32512IDC_ARROW,32513IDC_IBEAM,32514IDC_WAIT,32515IDC_CROSS
		,32516IDC_UPARROW,32640IDC_SIZE,32641IDC_ICON,32642IDC_SIZENWSE
		,32643IDC_SIZENESW,32644IDC_SIZEWE,32645IDC_SIZENS,32646IDC_SIZEALL
		,32648IDC_NO,32649IDC_HAND,32650IDC_APPSTARTING,32651IDC_HELP
	If Cursor =
	{
		VarSetCapacity( AndMask, 32*4, 0xFF ), VarSetCapacity( XorMask, 32*4, 0 )
		BlankCursor = 1
	}
	Else If SubStr( Cursor,1,4 ) = "IDC_"
	{
		Loop, Parse, SystemCursors, `,
		{
			CursorName := SubStr( A_Loopfield, 6, 15 )
			CursorID := SubStr( A_Loopfield, 1, 5 )
			SystemCursor = 1
			If ( CursorName = Cursor )
			{
				CursorHandle := DllCall( "LoadCursor", Uint,0, Int,CursorID )
				Break
			}
		}
		If CursorHandle =
		{
			Msgbox,, SetCursor, Error: Invalid cursor name
			CursorHandle = Error
		}
	}
	Else If FileExist( Cursor )
	{
		SplitPath, Cursor,,, Ext
		If Ext = ico
			uType := 0x1
		Else If Ext in cur,ani
			uType := 0x2
		Else
		{
			Msgbox,, SetCursor, Error: Invalid file type
			CursorHandle = Error
		}
		FileCursor = 1
	}
	Else
	{
		Msgbox,, SetCursor, Error: Invalid file path or cursor name
		CursorHandle = Error
	}
	If CursorHandle != Error
	{
		Loop, Parse, SystemCursors, `,
		{
			If BlankCursor = 1
			{
				Type = BlankCursor
				%Type%%A_Index% := DllCall( "CreateCursor"
					, Uint,0, Int,0, Int,0, Int,32, Int,32, Uint,&AndMask, Uint,&XorMask )
				CursorHandle := DllCall( "CopyImage", Uint,%Type%%A_Index%, Uint,0x2, Int,0, Int,0, Int,0 )
				DllCall( "SetSystemCursor", Uint,CursorHandle, Int,SubStr( A_Loopfield, 1, 5 ) )
			}
			Else If SystemCursor = 1
			{
				Type = SystemCursor
				CursorHandle := DllCall( "LoadCursor", Uint,0, Int,CursorID )
				%Type%%A_Index% := DllCall( "CopyImage"
					, Uint,CursorHandle, Uint,0x2, Int,cx, Int,cy, Uint,0 )
				CursorHandle := DllCall( "CopyImage", Uint,%Type%%A_Index%, Uint,0x2, Int,0, Int,0, Int,0 )
				DllCall( "SetSystemCursor", Uint,CursorHandle, Int,SubStr( A_Loopfield, 1, 5 ) )
			}
			Else If FileCursor = 1
			{
				Type = FileCursor
				%Type%%A_Index% := DllCall( "LoadImageA"
					, UInt,0, Str,Cursor, UInt,uType, Int,cx, Int,cy, UInt,0x10 )
				DllCall( "SetSystemCursor", Uint,%Type%%A_Index%, Int,SubStr( A_Loopfield, 1, 5 ) )
			}
		}
	}
}

SystemCursor(OnOff=1) {  																					;-- hiding mouse cursor

	; Borrowed from Laszlo's post @ http://www.autohotkey.com/board/topic/5727-hiding-the-mouse-cursor/
	; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others

    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 	; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13  	; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   	; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "") {      			; init when requested or at first call

			$ = h                                          						; active default cursors
			VarSetCapacity( h_cursor,4444, 1 )
			VarSetCapacity( AndMask, 32*4, 0xFF )
			VarSetCapacity( XorMask, 32*4, 0 )
			system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
			StringSplit c, system_cursors, `,
			Loop %c0%
			{
				h_cursor   := DllCall( "LoadCursor", "uint",0, "uint",c%A_Index% )
				h%A_Index% := DllCall( "CopyImage",  "uint",h_cursor, "uint",2, "int",0, "int",0, "uint",0 )
				b%A_Index% := DllCall("CreateCursor","uint",0, "int",0, "int",0
					, "int",32, "int",32, "uint",&AndMask, "uint",&XorMask )
			}
    }

    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  																	; use blank cursors
    else
        $ = h  																	; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "uint",%$%%A_Index%, "uint",2, "int",0, "int",0, "uint",0 )
        DllCall( "SetSystemCursor", "uint",h_cursor, "uint",c%A_Index% )
    }

}

SetTimerF( Function, Period=0, ParmObject=0, Priority=0 ) {  								;-- Starts a timer that can call functions and object methods
 Static current,tmrs:=Object() ;current will hold timer that is currently running
 If IsFunc( Function ) || IsObject( Function ){
    if IsObject(tmr:=tmrs[Function]) ;destroy timer before creating a new one
       ret := DllCall( "KillTimer", UInt,0, UInt, tmr.tmr)
       , DllCall("GlobalFree", UInt, tmr.CBA)
       , tmrs.Remove(Function)
    if (Period = 0 || Period ? "off")
       return ret ;Return as we want to turn off timer
    ; create object that will hold information for timer, it will be passed trough A_EventInfo when Timer is launched
    tmr:=tmrs[Function]:=Object("func",Function,"Period",Period="on" ? 250 : Period,"Priority",Priority
                        ,"OneTime",(Period<0),"params",IsObject(ParmObject)?ParmObject:Object()
                        ,"Tick",A_TickCount)
    tmr.CBA := RegisterCallback(A_ThisFunc,"F",4,&tmr)
    return !!(tmr.tmr  := DllCall("SetTimer", UInt,0, UInt,0, UInt
                        , (Period && Period!="On") ? Abs(Period) : (Period := 250)
                        , UInt,tmr.CBA)) ;Create Timer and return true if a timer was created
            , tmr.Tick:=A_TickCount
 }
 tmr := Object(A_EventInfo) ;A_Event holds object which contains timer information
 if IsObject(tmr) {
    DllCall("KillTimer", UInt,0, UInt,tmr.tmr) ;deactivate timer so it does not run again while we are processing the function
    If (!tmr.active && tmr.Priority<(current.priority ? current.priority : 0)) ;Timer with higher priority is already current so return
       Return (tmr.tmr:=DllCall("SetTimer", UInt,0, UInt,0, UInt, 100, UInt,tmr.CBA)) ;call timer again asap
    current:=tmr
    tmr.tick:=ErrorLevel :=Priority ;update tick to launch function on time
    func := tmr.func.(tmr.params*) ;call function
    current= ;reset timer
    if (tmr.OneTime) ;One time timer, deactivate and delete it
       return DllCall("GlobalFree", UInt,tmr.CBA)
             ,tmrs.Remove(tmr.func)
    tmr.tmr:= DllCall("SetTimer", UInt,0, UInt,0, UInt ;reset timer
            ,((A_TickCount-tmr.Tick) > tmr.Period) ? 0 : (tmr.Period-(A_TickCount-tmr.Tick)), UInt,tmr.CBA)
 }
}

TaskDialog(Instruction, Content := "", Title := "", Buttons := 1, IconID := 0, IconRes := "", Owner := 0x10010) { ;--
    Local hModule, LoadLib, Ret

    If (IconRes != "") {
        hModule := DllCall("GetModuleHandle", "Str", IconRes, "Ptr")
        LoadLib := !hModule
            && hModule := DllCall("LoadLibraryEx", "Str", IconRes, "UInt", 0, "UInt", 0x2, "Ptr")
    } Else {
        hModule := 0
        LoadLib := False
    }

    DllCall("TaskDialog"
        , "Ptr" , Owner        ; hWndParent
        , "Ptr" , hModule      ; hInstance
        , "Ptr" , &Title       ; pszWindowTitle
        , "Ptr" , &Instruction ; pszMainInstruction
        , "Ptr" , &Content     ; pszContent
        , "Int" , Buttons      ; dwCommonButtons
        , "Ptr" , IconID       ; pszIcon
        , "Int*", Ret := 0)    ; *pnButton

    If (LoadLib) {
        DllCall("FreeLibrary", "Ptr", hModule)
    }

    Return {1: "OK", 2: "Cancel", 4: "Retry", 6: "Yes", 7: "No", 8: "Close"}[Ret]
}

TaskDialogDirect(Instruction, Content := "", Title := "", CustomButtons := "", CommonButtons := 0, MainIcon := 0, Flags := 0, Owner := 0x10010, VerificationText := "", ExpandedText := "", FooterText := "", FooterIcon := 0, Width := 0) { ;--
    Static x64 := A_PtrSize == 8, Button := 0, Checked := 0

    If (CustomButtons != "") {
        Buttons := StrSplit(CustomButtons, "|")
        cButtons := Buttons.Length()
        VarSetCapacity(pButtons, 4 * cButtons + A_PtrSize * cButtons, 0)
        Loop %cButtons% {
            iButtonText := &(b%A_Index% := Buttons[A_Index])
            NumPut(100 + A_Index, pButtons, (4 + A_PtrSize) * (A_Index - 1), "Int")
            NumPut(iButtonText, pButtons, (4 + A_PtrSize) * A_Index - A_PtrSize, "Ptr")
        }
    } Else {
        cButtons := 0
        pButtons := 0
    }

    NumPut(VarSetCapacity(TDC, (x64) ? 160 : 96, 0), TDC, 0, "UInt") ; cbSize
    NumPut(Owner, TDC, 4, "Ptr") ; hwndParent
    NumPut(Flags, TDC, (x64) ? 20 : 12, "Int") ; dwFlags
    NumPut(CommonButtons, TDC, (x64) ? 24 : 16, "Int") ; dwCommonButtons
    NumPut(&Title, TDC, (x64) ? 28 : 20, "Ptr") ; pszWindowTitle
    NumPut(MainIcon, TDC, (x64) ? 36 : 24, "Ptr") ; pszMainIcon
    NumPut(&Instruction, TDC, (x64) ? 44 : 28, "Ptr") ; pszMainInstruction
    NumPut(&Content, TDC, (x64) ? 52 : 32, "Ptr") ; pszContent
    NumPut(cButtons, TDC, (x64) ? 60 : 36, "UInt") ; cButtons
    NumPut(&pButtons, TDC, (x64) ? 64 : 40, "Ptr") ; pButtons
    NumPut(&VerificationText, TDC, (x64) ? 92 : 60, "Ptr") ; pszVerificationText
    NumPut(&ExpandedText, TDC, (x64) ? 100 : 64, "Ptr") ; pszExpandedInformation
    NumPut(FooterIcon, TDC, (x64) ? 124 : 76, "Ptr") ; pszFooterIcon
    NumPut(&FooterText, TDC, (x64) ? 132 : 80, "Ptr") ; pszFooter
    NumPut(Width, TDC, (x64) ? 156 : 92, "UInt") ; cxWidth

    If (DllCall("Comctl32.dll\TaskDialogIndirect", "Ptr", &TDC, "Int*", Button, "Int", 0, "Int*", Checked) == 0) {
        Return (VerificationText == "") ? Button : [Button, Checked]
    } Else {
        Return "ERROR"
    }
}

GlobalVarsScript(var="",size=102400,ByRef object=0) {	 ;--

  global
  static globalVarsScript
  If (var="")
    Return globalVarsScript
  else if !size {
    If !InStr(globalVarsScript,var ":= CriticalObject(" CriticalObject(object,1) "," CriticalObject(object,2) ")`n"){
      If !CriticalObject(object,1)
        object:=CriticalObject(object)
      globalVarsScript .= var ":= CriticalObject(" CriticalObject(object,1) "," CriticalObject(object,2) ")`n"
    }
  } else {
    Loop,Parse,Var,|
    If !InStr(globalVarsScript,"Alias(" A_LoopField "," GetVar(%A_LoopField%) ")`n"){
      %A_LoopField%:=""
      If size
        VarSetCapacity(%A_LoopField%,size)
      globalVarsScript:=globalVarsScript . "Alias(" A_LoopField "," GetVar(%A_LoopField%) ")`n"
    }
  }
  Return globalVarsScript
}

patternScan(pattern, haystackAddress, haystackSize) {		 ;--

		; Parameters
			; pattern
			;			A string of two digit numbers representing the hex value of each byte of the pattern. The '0x' hex-prefix is not required
			;			?? Represents a wildcard byte (can be any value)
			;			All of the digit groups must be 2 characters long i.e 05, 0F, and ??, NOT 5, F or ?
			;			Spaces, tabs, and 0x hex-prefixes are optional
			; haystackAddress
			;			The memory address of the binary haystack eg &haystack
			; haystackAddress
			;			The byte length of the binary haystack

			; Return values
			;  0  	Not Found
			; -1 	An odd number of characters were passed via pattern
			;		Ensure you use two digits to represent each byte i.e. 05, 0F and ??, and not 5, F or ?
			; -2   	No valid bytes in the needle/pattern
			; int 	The offset from haystackAddress of the start of the found pattern

		StringReplace, pattern, pattern, 0x,, All
		StringReplace, pattern, pattern, %A_Space%,, All
		StringReplace, pattern, pattern, %A_Tab%,, All
		pattern := RTrim(pattern, "?")				; can pass patterns beginning with ?? ?? - but why not just start the pattern with the first known byte
		loopCount := bufferSize := StrLen(pattern) / 2
		if Mod(StrLen(pattern), 2)
			return -1
		VarSetCapacity(binaryNeedle, bufferSize)
		aOffsets := [], startGap := 0
		loop, % loopCount
		{
			hexChar := SubStr(pattern, 1 + 2 * (A_Index - 1), 2)
			if (hexChar != "??") && (prevChar = "??" || A_Index = 1)
				binNeedleStartOffset := A_index - 1
			else if (hexChar = "??" && prevChar != "??" && A_Index != 1)
			{

				aOffsets.Insert({ "binNeedleStartOffset": binNeedleStartOffset
								, "binNeedleSize": A_Index - 1 - binNeedleStartOffset
								, "binNeedleGap": !aOffsets.MaxIndex() ? 0 : binNeedleStartOffset - startGap + 1}) ; equals number of wildcard bytes between two sub needles
				startGap := A_index
			}

			if (A_Index = loopCount) ; last char cant be ??
				aOffsets.Insert({ "binNeedleStartOffset": binNeedleStartOffset
								, "binNeedleSize": A_Index - binNeedleStartOffset
								, "binNeedleGap": !aOffsets.MaxIndex() ? 0 : binNeedleStartOffset - startGap + 1})
			prevChar := hexChar
			if (hexChar != "??")
			{
				numput("0x" . hexChar, binaryNeedle, A_index - 1, "UChar")
				realNeedleSize++
			}
		}
		if !realNeedleSize
			return -2 ; no valid bytes in the needle

		haystackOffset := 0
		aOffset := aOffsets[arrayIndex := 1]
		loop
		{
			if (-1 != foundOffset := scanInBuf(haystackAddress, &binaryNeedle + aOffset.binNeedleStartOffset, haystackSize, aOffset.binNeedleSize, haystackOffset))
			{
				; either the first subneedle was found, or the current subneedle is the correct distance from the previous subneedle
				; The scanInBuf returned 'foundOffset' is relative to haystackAddr regardless of haystackOffset
				if (arrayIndex = 1 || foundOffset = haystackOffset)
				{
					if (arrayIndex = 1)
					{
						currentStartOffstet := aOffset.binNeedleSize + foundOffset ; save the offset of the match for the first part of the needle - if remainder of needle doesn't match,  resume search from here
						tmpfoundAddress := foundOffset
					}
					if (arrayIndex = aOffsets.MaxIndex())
						return foundAddress := tmpfoundAddress - aOffsets[1].binNeedleStartOffset  ;+ haystackAddress ; deduct the first needles starting offset - in case user passed a pattern beginning with ?? eg "?? ?? 00 55"
					prevNeedleSize := aOffset.binNeedleSize
					aOffset := aOffsets[++arrayIndex]
					haystackOffset := foundOffset + prevNeedleSize + aOffset.binNeedleGap   ; move the start of the haystack ready for the next needle - accounting for previous needle size and any gap/wildcard-bytes between the two needles
					continue
				}
				; else the offset of the found subneedle was not the correct distance from the end of the previous subneedle
			}
			if (arrayIndex = 1) ; couldn't find the first part of the needle
				return 0
			; the subsequent subneedle couldn't be found.
			; So resume search from the address immediately next to where the first subneedle was found
			aOffset := aOffsets[arrayIndex := 1]
			haystackOffset := currentStartOffstet
		}

	}

scanInBuf(haystackAddr, needleAddr, haystackSize, needleSize, StartOffset = 0) {	;--
		;Doesn't WORK with AHK 64 BIT, only works with AHK 32 bit
	;taken from:
	;http://www.autohotkey.com/board/topic/23627-machine-code-binary-buffer-searching-regardless-of-null/
	; -1 not found else returns offset address (starting at 0)
	; The returned offset is relative to the haystackAddr regardless of StartOffset
		static fun

		; AHK32Bit a_PtrSize = 4 | AHK64Bit - 8 bytes
		if (a_PtrSize = 8)
		  return -1

		ifequal, fun,
		{
		  h =
		  (  LTrim join
		     5589E583EC0C53515256579C8B5D1483FB000F8EC20000008B4D108B451829C129D9410F8E
		     B10000008B7D0801C78B750C31C0FCAC4B742A4B742D4B74364B74144B753F93AD93F2AE0F
		     858B000000391F75F4EB754EADF2AE757F3947FF75F7EB68F2AE7574EB628A26F2AE756C38
		     2775F8EB569366AD93F2AE755E66391F75F7EB474E43AD8975FC89DAC1EB02895DF483E203
		     8955F887DF87D187FB87CAF2AE75373947FF75F789FB89CA83C7038B75FC8B4DF485C97404
		     F3A775DE8B4DF885C97404F3A675D389DF4F89F82B45089D5F5E5A595BC9C2140031C0F7D0
		     EBF0
		  )
		  varSetCapacity(fun, strLen(h)//2)
		  loop % strLen(h)//2
		     numPut("0x" . subStr(h, 2*a_index-1, 2), fun, a_index-1, "char")
		}

		return DllCall(&fun, "uInt", haystackAddr, "uInt", needleAddr
		              , "uInt", haystackSize, "uInt", needleSize, "uInt", StartOffset)
	}

hexToBinaryBuffer(hexString, byRef buffer) {	;--
	StringReplace, hexString, hexString, 0x,, All
	StringReplace, hexString, hexString, %A_Space%,, All
	StringReplace, hexString, hexString, %A_Tab%,, All
	if !length := strLen(hexString)
	{
		msgbox nothing was passed to hexToBinaryBuffer
		return 0
	}
	if mod(length, 2)
	{
		msgbox Odd Number of characters passed to hexToBinaryBuffer`nEnsure two digits are used for each byte e.g. 0E
		return 0
	}
	byteCount := length/ 2
	VarSetCapacity(buffer, byteCount)
	loop, % byteCount
		numput("0x" . substr(hexString, 1 + (A_index - 1) * 2, 2), buffer, A_index - 1, "UChar")
	return byteCount

}

TaskDialogMsgBox(Main, Extra, Title := "", Buttons := 0, Icon := 0, Parent := 0, TimeOut := 0) {		;--

	Static MBICON := {1: 0x30, 2: 0x10, 3: 0x40, WARN: 0x30, ERROR: 0x10, INFO: 0x40, QUESTION: 0x20}
		, TDBTNS := {OK: 1, YES: 2, NO: 4, CANCEL: 8, RETRY: 16}
	BTNS := 0
	if Buttons Is Integer
		BTNS := Buttons & 0x1F
	else
		For Each, Btn In StrSplit(Buttons, ["|", " ", ",", "`n"])
	BTNS |= (B := TDBTNS[Btn]) ? B : 0
	Options := 0
	Options |= (I := MBICON[Icon]) ? I : 0
	Options |= Parent = -1 ? 262144 : Parent > 0 ? 8192 : 0
	if ((BTNS & 14) = 14)
		Options |= 0x03 ; Yes/No/Cancel
	else if ((BTNS & 6) = 6)
		Options |= 0x04 ; Yes/No
	else if ((BTNS & 24) = 24)
		Options |= 0x05 ; Retry/Cancel
	else if ((BTNS & 9) = 9)
		Options |= 0x01 ; OK/Cancel
	Main .= Extra <> "" ? "`n`n" . Extra : ""
	MsgBox, % Options, %Title%, %Main%, %TimeOut%
	IfMsgBox, OK
		return 1
	IfMsgBox, Cancel
		return 2
	IfMsgBox, Retry
		return 4
	IfMsgBox, Yes
		return 6
	IfMsgBox, No
		return 7
	IfMsgBox, TimeOut
		return -1
	return 0

}

TaskDialogToUnicode(String, ByRef Var) {	;--

	VarSetCapacity(Var, StrPut(String, "UTF-16") * 2, 0)
	StrPut(String, &Var, "UTF-16")
	return &Var

}

TaskDialogCallback(H, N, W, L, D) {	;--

	Static TDM_Click_BUTTON := 0x0466
		, TDN_CREATED := 0
		, TDN_TIMER   := 4
	TD := Object(D)
	if (N = TDN_TIMER) && (W > TD.Timeout) {
		TD.TimedOut := True
		PostMessage, %TDM_Click_BUTTON%, 2, 0, , ahk_id %H% ; IDCANCEL = 2
	}
	else if (N = TDN_CREATED) && TD.AOT {
		DHW := A_DetectHiddenWindows
		DetectHiddenWindows, On
		WinSet, AlwaysOnTop, On, ahk_id %H%
		DetectHiddenWindows, %DHW%
	}
	return 0

}

RegRead64(sRootKey, sKeyName, sValueName = "", DataMaxSize=1024) {		;-- Provides RegRead64() and RegWrite64() functions that do not redirect to Wow6432Node on 64-bit machines

	; _reg64.ahk ver 0.1 by tomte
	; Script for AutoHotkey   ( http://www.autohotkey.com/ )
	;
	; Provides RegRead64() and RegWrite64() functions that do not redirect to Wow6432Node on 64-bit machines
	; RegRead64() and RegWrite64() takes the same parameters as regular AHK RegRead and RegWrite commands, plus one optional DataMaxSize param for RegRead64()
	;
	; RegRead64() can handle the same types of values as AHK RegRead:
	; REG_SZ, REG_EXPAND_SZ, REG_MULTI_SZ, REG_DWORD, and REG_BINARY
	; (values are returned in same fashion as with RegRead - REG_BINARY as hex string, REG_MULTI_SZ split with linefeed etc.)
	;
	; RegWrite64() can handle REG_SZ, REG_EXPAND_SZ and REG_DWORD only
	;
	; Usage:
	; myvalue := RegRead64("HKEY_LOCAL_MACHINE", "SOFTWARE\SomeCompany\Product\Subkey", "valuename")
	; RegWrite64("REG_SZ", "HKEY_LOCAL_MACHINE", "SOFTWARE\SomeCompany\Product\Subkey", "valuename", "mystring")
	; If the value name is blank/omitted the subkey's default value is used, if the value is omitted with RegWrite64() a blank/zero value is written
	;

	HKEY_CLASSES_ROOT	:= 0x80000000	; http://msdn.microsoft.com/en-us/library/aa393286.aspx
	HKEY_CURRENT_USER	:= 0x80000001
	HKEY_LOCAL_MACHINE	:= 0x80000002
	HKEY_USERS			:= 0x80000003
	HKEY_CURRENT_CONFIG	:= 0x80000005
	HKEY_DYN_DATA		:= 0x80000006
	HKCR := HKEY_CLASSES_ROOT
	HKCU := HKEY_CURRENT_USER
	HKLM := HKEY_LOCAL_MACHINE
	HKU	 := HKEY_USERS
	HKCC := HKEY_CURRENT_CONFIG

	REG_NONE 				:= 0	; http://msdn.microsoft.com/en-us/library/ms724884.aspx
	REG_SZ 					:= 1
	REG_EXPAND_SZ			:= 2
	REG_BINARY				:= 3
	REG_DWORD				:= 4
	REG_DWORD_BIG_ENDIAN	:= 5
	REG_LINK				:= 6
	REG_MULTI_SZ			:= 7
	REG_RESOURCE_LIST		:= 8

	KEY_QUERY_VALUE := 0x0001	; http://msdn.microsoft.com/en-us/library/ms724878.aspx
	KEY_WOW64_64KEY := 0x0100	; http://msdn.microsoft.com/en-gb/library/aa384129.aspx (do not redirect to Wow6432Node on 64-bit machines)
	KEY_SET_VALUE	:= 0x0002
	KEY_WRITE		:= 0x20006

	myhKey := %sRootKey%		; pick out value (0x8000000x) from list of HKEY_xx vars
	IfEqual,myhKey,, {		; Error - Invalid root key
		ErrorLevel := 3
		return ""
	}

	RegAccessRight := KEY_QUERY_VALUE + KEY_WOW64_64KEY

	DllCall("Advapi32.dll\RegOpenKeyExA", "uint", myhKey, "str", sKeyName, "uint", 0, "uint", RegAccessRight, "uint*", hKey)	; open key
	DllCall("Advapi32.dll\RegQueryValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint*", sValueType, "uint", 0, "uint", 0)		; get value type
	If (sValueType == REG_SZ or sValueType == REG_EXPAND_SZ) {
		VarSetCapacity(sValue, vValueSize:=DataMaxSize)
		DllCall("Advapi32.dll\RegQueryValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint", 0, "str", sValue, "uint*", vValueSize)	; get string or string-exp
	} Else If (sValueType == REG_DWORD) {
		VarSetCapacity(sValue, vValueSize:=4)
		DllCall("Advapi32.dll\RegQueryValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint", 0, "uint*", sValue, "uint*", vValueSize)	; get dword
	} Else If (sValueType == REG_MULTI_SZ) {
		VarSetCapacity(sTmp, vValueSize:=DataMaxSize)
		DllCall("Advapi32.dll\RegQueryValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint", 0, "str", sTmp, "uint*", vValueSize)	; get string-mult
		sValue := ExtractData(&sTmp) "`n"
		Loop {
			If (errorLevel+2 >= &sTmp + vValueSize)
				Break
			sValue := sValue ExtractData( errorLevel+1 ) "`n"
		}
	} Else If (sValueType == REG_BINARY) {
		VarSetCapacity(sTmp, vValueSize:=DataMaxSize)
		DllCall("Advapi32.dll\RegQueryValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint", 0, "str", sTmp, "uint*", vValueSize)	; get binary
		sValue := ""
		SetFormat, integer, h
		Loop %vValueSize% {
			hex := SubStr(Asc(SubStr(sTmp,A_Index,1)),3)
			StringUpper, hex, hex
			sValue := sValue hex
		}
		SetFormat, integer, d
	} Else {				; value does not exist or unsupported value type
		DllCall("Advapi32.dll\RegCloseKey", "uint", hKey)
		ErrorLevel := 1
		return ""
	}
	DllCall("Advapi32.dll\RegCloseKey", "uint", hKey)
	return sValue
}

RegWrite64(sValueType, sRootKey, sKeyName, sValueName = "", sValue = "") {	;--
	HKEY_CLASSES_ROOT	:= 0x80000000	; http://msdn.microsoft.com/en-us/library/aa393286.aspx
	HKEY_CURRENT_USER	:= 0x80000001
	HKEY_LOCAL_MACHINE	:= 0x80000002
	HKEY_USERS			:= 0x80000003
	HKEY_CURRENT_CONFIG	:= 0x80000005
	HKEY_DYN_DATA		:= 0x80000006
	HKCR := HKEY_CLASSES_ROOT
	HKCU := HKEY_CURRENT_USER
	HKLM := HKEY_LOCAL_MACHINE
	HKU	 := HKEY_USERS
	HKCC := HKEY_CURRENT_CONFIG

	REG_NONE 				:= 0	; http://msdn.microsoft.com/en-us/library/ms724884.aspx
	REG_SZ 					:= 1
	REG_EXPAND_SZ			:= 2
	REG_BINARY				:= 3
	REG_DWORD				:= 4
	REG_DWORD_BIG_ENDIAN	:= 5
	REG_LINK				:= 6
	REG_MULTI_SZ			:= 7
	REG_RESOURCE_LIST		:= 8

	KEY_QUERY_VALUE := 0x0001	; http://msdn.microsoft.com/en-us/library/ms724878.aspx
	KEY_WOW64_64KEY := 0x0100	; http://msdn.microsoft.com/en-gb/library/aa384129.aspx (do not redirect to Wow6432Node on 64-bit machines)
	KEY_SET_VALUE	:= 0x0002
	KEY_WRITE		:= 0x20006

	myhKey := %sRootKey%			; pick out value (0x8000000x) from list of HKEY_xx vars
	myValueType := %sValueType%		; pick out value (0-8) from list of REG_SZ,REG_DWORD etc. types
	IfEqual,myhKey,, {		; Error - Invalid root key
		ErrorLevel := 3
		return ErrorLevel
	}
	IfEqual,myValueType,, {	; Error - Invalid value type
		ErrorLevel := 2
		return ErrorLevel
	}

	RegAccessRight := KEY_QUERY_VALUE + KEY_WOW64_64KEY + KEY_WRITE

	DllCall("Advapi32.dll\RegCreateKeyExA", "uint", myhKey, "str", sKeyName, "uint", 0, "uint", 0, "uint", 0, "uint", RegAccessRight, "uint", 0, "uint*", hKey)	; open/create key
	If (myValueType == REG_SZ or myValueType == REG_EXPAND_SZ) {
		vValueSize := StrLen(sValue) + 1
		DllCall("Advapi32.dll\RegSetValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint", myValueType, "str", sValue, "uint", vValueSize)	; write string
	} Else If (myValueType == REG_DWORD) {
		vValueSize := 4
		DllCall("Advapi32.dll\RegSetValueExA", "uint", hKey, "str", sValueName, "uint", 0, "uint", myValueType, "uint*", sValue, "uint", vValueSize)	; write dword
	} Else {		; REG_MULTI_SZ, REG_BINARY, or other unsupported value type
		ErrorLevel := 2
	}
	DllCall("Advapi32.dll\RegCloseKey", "uint", hKey)
	return ErrorLevel
}

ExtractData(pointer) {	;--

	; Thanks Chris, Lexikos and SKAN
	; http://www.autohotkey.com/forum/topic37710-15.html
	; http://www.autohotkey.com/forum/viewtopic.php?p=235522
	 ; http://www.autohotkey.com/forum/viewtopic.php?p=91578#91578 SKAN

	Loop {
			errorLevel := ( pointer+(A_Index-1) )
			Asc := *( errorLevel )
			IfEqual, Asc, 0, Break ; Break if NULL Character
			String := String . Chr(Asc)
		}
	Return String
}

;{System functions - dll
GetDllBase(DllName, PID = 0) {		;--
    TH32CS_SNAPMODULE := 0x00000008
    INVALID_HANDLE_VALUE = -1
    VarSetCapacity(me32, 548, 0)
    NumPut(548, me32)
    snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", TH32CS_SNAPMODULE
                                                 , "Uint", PID)
    If (snapMod = INVALID_HANDLE_VALUE) {
        Return 0
    }
    If (DllCall("Module32First", "Uint", snapMod, "Uint", &me32)){
        while(DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)) {
            If !DllCall("lstrcmpi", "Str", DllName, "UInt", &me32 + 32) {
                DllCall("CloseHandle", "UInt", snapMod)
                Return NumGet(&me32 + 20)
            }
        }
    }
    DllCall("CloseHandle", "Uint", snapMod)
    Return 0
}

getProcBaseFromModules(process) {		;--

/*
	http://stackoverflow.com/questions/14467229/get-base-address-of-process
	Open the process using OpenProcess -- if successful, the value returned is a handle to the process, which is just an opaque token used by the kernel to identify a kernel object. Its exact integer value (0x5c in your case) has no meaning to userspace programs, other than to distinguish it from other handles and invalid handles.
	Call GetProcessImageFileName to get the name of the main executable module of the process.
	Use EnumProcessModules to enumerate the list of all modules in the target process.
	For each module, call GetModuleFileNameEx to get the filename, and compare it with the executable's filename.
	When you've found the executable's module, call GetModuleInformation to get the raw entry point of the executable.
*/


	_MODULEINFO := "
					(
					  LPVOID lpBaseOfDll;
					  DWORD  SizeOfImage;
					  LPVOID EntryPoint;
				  	)"
	Process, Exist, %process%
	if ErrorLevel 							; PROCESS_QUERY_INFORMATION + PROCESS_VM_READ
		hProc := DllCall("OpenProcess", "uint", 0x0400 | 0x0010 , "int", 0, "uint", ErrorLevel)
	if !hProc
		return -2
	VarSetCapacity(mainExeNameBuffer, 2048 * (A_IsUnicode ? 2 : 1))
	DllCall("psapi\GetModuleFileNameEx", "uint", hProc, "Uint", 0
				, "Ptr", &mainExeNameBuffer, "Uint", 2048 / (A_IsUnicode ? 2 : 1))
	mainExeName := StrGet(&mainExeNameBuffer)
	; mainExeName = main executable module of the process
	size := VarSetCapacity(lphModule, 4)
	loop
	{
		DllCall("psapi\EnumProcessModules", "uint", hProc, "Ptr", &lphModule
				, "Uint", size, "Uint*", reqSize)
		if ErrorLevel
			return -3, DllCall("CloseHandle","uint",hProc)
		else if (size >= reqSize)
			break
		else
			size := VarSetCapacity(lphModule, reqSize)
	}
	VarSetCapacity(lpFilename, 2048 * (A_IsUnicode ? 2 : 1))
	loop % reqSize / A_PtrSize ; sizeof(HMODULE) - enumerate the array of HMODULEs
	{
		DllCall("psapi\GetModuleFileNameEx", "uint", hProc, "Uint", numget(lphModule, (A_index - 1) * 4)
				, "Ptr", &lpFilename, "Uint", 2048 / (A_IsUnicode ? 2 : 1))
		if (mainExeName = StrGet(&lpFilename))
		{
			moduleInfo := struct(_MODULEINFO)
			DllCall("psapi\GetModuleInformation", "uint", hProc, "Uint", numget(lphModule, (A_index - 1) * 4)
				, "Ptr", moduleInfo[], "Uint", SizeOf(moduleInfo))
			;return moduleInfo.SizeOfImage, DllCall("CloseHandle","uint",hProc)
			return moduleInfo.lpBaseOfDll, DllCall("CloseHandle","uint",hProc)
		}
	}
	return -1, DllCall("CloseHandle","uint",hProc) ; not found
}

;}

;{System functions - using COMObjecte
getURL(t) {     ;-- using shell.application
	If	psh	:=	COM_CreateObject("Shell.Application") {
		If	psw	:=	COM_Invoke(psh,	"Windows") {
			Loop, %	COM_Invoke(psw,	"Count")
				If	url	:=	(InStr(COM_Invoke(psw,"Item[" A_Index-1 "].LocationName"),t) && InStr(COM_Invoke(psw,"Item[" A_Index-1 "].FullName"), "iexplore.exe")) ? COM_Invoke(psw,"Item[" A_Index-1 "].LocationURL") :
					Break
			COM_Release(psw)
		}
		COM_Release(psh)
	}
	Return	url
}

LoadFile(path, exe:="", exception_level:=-1) {													;-- Loads a script file as a child process and returns an object

	/*		DESCRIPTION

    LoadFile(Path [, EXE])

        Loads a script file as a child process and returns an object
        which can be used to call functions or get/set global vars.

    Path:
          The path of the script.
    EXE:
          The path of the AutoHotkey executable (defaults to A_AhkPath).

    Requirements:
      - AutoHotkey v1.1.17+    http://ahkscript.org/download/
      - ObjRegisterActive      http://goo.gl/wZsFLP
      - CreateGUID             http://goo.gl/obfmDc

    Version: 1.0
*/

    ObjRegisterActive(client := {}, guid := CreateGUID())
    code =
    (LTrim
    LoadFile.Serve("%guid%")
    #include %A_LineFile%
    #include %path%
    )
    try {
        exe := """" (exe="" ? A_AhkPath : exe) """"
        exec := ComObjCreate("WScript.Shell").Exec(exe " /ErrorStdOut *")
        exec.StdIn.Write(code)
        exec.StdIn.Close()
        while exec.Status = 0 && !client._proxy
            Sleep 10
        if exec.Status != 0 {
            err := exec.StdErr.ReadAll()
            ex := Exception("Failed to load file", exception_level)
            if RegExMatch(err, "Os)(.*?) \((\d+)\) : ==> (.*?)(?:\s*Specifically: (.*?))?\R?$", m)
                ex.Message .= "`n`nReason:`t" m[3] "`nLine text:`t" m[4] "`nFile:`t" m[1] "`nLine:`t" m[2]
            throw ex
        }
    }
    finally
        ObjRegisterActive(client, "")
    return client._proxy
}
;{sub LoadFile_class
class LoadFile {
    Serve(guid) {
        try {
            client := ComObjActive(guid)
            client._proxy := new this.Proxy
            client := ""
        }
        catch ex {
            stderr := FileOpen("**", "w")
            stderr.Write(format("{} ({}) : ==> {}`n     Specifically: {}"
                , ex.File, ex.Line, ex.Message, ex.Extra))
            stderr.Close()  ; Flush write buffer.
            ExitApp
        }
        ; Rather than sleeping in a loop, make the script persistent
        ; and then return so that the #included file is auto-executed.
        Hotkey IfWinActive, %guid%
        Hotkey vk07, #Persistent, Off
        #Persistent:
    }
    class Proxy {
        __call(name, args*) {
            if (name != "G")
                return %name%(args*)
        }
        G[name] { ; x.G[name] because x[name] via COM invokes __call.
            get {
                global
                return ( %name% )
            }
            set {
                global
                return ( %name% := value )
            }
        }
        __delete() {
            ExitApp
        }
    }
}
;}

;}

;}
; CreateNamedPipe()			|	RestoreCursors()				|	SetSystemCursor()					|	SystemCursor()					|	SetTimerF()						|
; TaskDialog()					|	ITaskDialogDirect()			|	IGlobalVarsScript()				|	patternScan()					|	scanInBuf()						|
; hexToBinaryBuffer()			|GetDllBase()						|	getProcBaseFromModules()		|	TaskDialogMsgBox()			|	TaskDialogToUnicode()		|
; TaskDialogCallback()		|	RegRead64()					|	RegWrite64()						|

; --- using COM Objects ---
; getURL()						|	LoadFile(()
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{UI Automation (4)
CreatePropertyCondition(propertyId, ByRef var, type :="Variant") {     ;I hope this one works
		If (A_PtrSize=8) {
			if (type!="Variant")
			UIA_Variant(var,type,var)
			return UIA_Hr(DllCall(this.__Vt(23), "ptr",this.__Value, "int",propertyId, "ptr",&var, "ptr*",out))? new UIA_PropertyCondition(out):
		} else {
			if (type<>8)
				return UIA_Hr(DllCall(this.__Vt(23), "ptr",this.__Value, "int",propertyId, "int64",type, "int64", var, "ptr*",out))? new UIA_PropertyCondition(out):
			else
			{
				vart:=DllCall("oleaut32\SysAllocString", "wstr",var,"ptr")
				return UIA_Hr(DllCall(this.__Vt(23), "ptr",this.__Value, "int",propertyId, "int64",type, "ptr", vart, "ptr", 0, "ptr*",out))? new UIA_PropertyCondition(out):
			}
		}
	}

CreatePropertyCondition(propertyId, ByRef var, type := "Variant") {        ;I hope this one is better
        ; CREDITS: Elgin, http://ahkscript.org/boards/viewtopic.php?f=5&t=6979&p=43985#p43985
        ; Parameters:
        ;   propertyId  - An ID number of the property to check.
        ;   var         - The value to check for.  Can be a variant, number, or string.
        ;   type        - The data type.  Can be the string "Variant", or one of standard
        ;                 variant type such as VT_I4, VT_BSTR, etc.
        local out:="", hr, bstr
        If (A_PtrSize = 8)
        {
            if (type!="Variant")
                UIA_Variant(var,type,var)
            hr := DllCall(this.__Vt(23), "ptr",this.__Value, "int",propertyId, "ptr",&var, "ptr*",out)
            if (type!="Variant")
                UIA_VariantClear(&var)
            return UIA_Hr(hr)? new UIA_PropertyCondition(out):
        }
        else ; 32-bit.
        {
            if (type <> 8)
                return UIA_Hr(DllCall(this.__Vt(23), "ptr",this.__Value, "int",propertyId
                            , "int64",type, "int64",var, "ptr*",out))? new UIA_PropertyCondition(out):
            else ; It's type is VT_BSTR.
            {
                bstr := DllCall("oleaut32\SysAllocString", "wstr",var, "ptr")
                hr := DllCall(this.__Vt(23), "ptr",this.__Value, "int",propertyId
                            , "int64",type, "ptr",bstr, "ptr",0, "ptr*",out)
                DllCall("oleaut32\SysFreeString", "ptr", bstr)
                return UIA_Hr(hr)? new UIA_PropertyCondition(out):
            }
        }
    }

CreatePropertyConditionEx(propertyId, ByRef var, type := "Variant", flags := 0x1) {	;--
        ; PropertyConditionFlags_IgnoreCase = 0x1
        local out:="", hr, bstr

        If (A_PtrSize = 8) {
            if (type!="Variant")
                UIA_Variant(var,type,var)
            hr := DllCall(this.__vt(24), "ptr",this.__Value, "int",propertyId
                        , "ptr",&var, "uint",flags, "ptr*",out)
            if (type!="Variant")
                UIA_VariantClear(&var)
            return UIA_Hr(hr)? new UIA_PropertyCondition(out):
        }
        else ; 32-bit.
        {
            if (type <> 8)
                return UIA_Hr(DllCall(this.__vt(24), "ptr",this.__Value, "int",propertyId
                            , "int64",type, "int64",var
                            , "uint",flags, "ptr*",out))? new UIA_PropertyCondition(out):
            else ; It's type is VT_BSTR.
            {
                bstr := DllCall("oleaut32\SysAllocString", "wstr",var, "ptr")
                hr := DllCall(this.__vt(24), "ptr",this.__Value, "int",propertyId
                            , "int64",type, "ptr",bstr, "ptr",0, "uint",flags, "ptr*",out)
                DllCall("oleaut32\SysFreeString", "ptr", bstr)
                return UIA_Hr(hr)? new UIA_PropertyCondition(out):
            }
        }
    }

getControlNameByHwnd(_, controlHwnd) {	;--
	UIAutomation := ComObjCreate("{ff48dba4-60ef-4201-aa87-54103eef594e}", "{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")
	DllCall(NumGet(NumGet(UIAutomation+0)+6*A_PtrSize), "Ptr", UIAutomation, "Ptr", controlHwnd, "Ptr*", IUIAutomationElement)
	DllCall(NumGet(NumGet(IUIAutomationElement+0)+29*A_PtrSize), "Ptr", IUIAutomationElement, "Ptr*", automationId)
	ret := StrGet(automationId,, "UTF-16")
	DllCall("oleaut32\SysFreeString", "Ptr", automationId)
	ObjRelease(IUIAutomationElement)
	ObjRelease(UIAutomation)
	return ret
}

;}
; CreatePropertyCondition()	|	CreatePropertyCondition()	|	CreatePropertyConditionEx()	|	getControlNameByHwnd()	|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{ACC (MSAA) - different methods (4)

Acc_Get(Cmd, ChildPath="", ChildID=0, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="") {		;--
	static properties := {Action:"DefaultAction", DoAction:"DoDefaultAction", Keyboard:"KeyboardShortcut"}
	AccObj :=   IsObject(WinTitle)? WinTitle
			:   Acc_ObjectFromWindow( WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText), 0 )
	if ComObjType(AccObj, "Name") != "IAccessible"
		ErrorLevel := "Could not access an IAccessible Object"
	else {
		StringReplace, ChildPath, ChildPath, _, %A_Space%, All
		AccError:=Acc_Error(), Acc_Error(true)
		Loop Parse, ChildPath, ., %A_Space%
			try {
				if A_LoopField is digit
					Children:=Acc_Children(AccObj), m2:=A_LoopField ; mimic "m2" output in else-statement
				else
					RegExMatch(A_LoopField, "(\D*)(\d*)", m), Children:=Acc_ChildrenByRole(AccObj, m1), m2:=(m2?m2:1)
				if Not Children.HasKey(m2)
					throw
				AccObj := Children[m2]
			} catch {
				ErrorLevel:="Cannot access ChildPath Item #" A_Index " -> " A_LoopField, Acc_Error(AccError)
				if Acc_Error()
					throw Exception("Cannot access ChildPath Item", -1, "Item #" A_Index " -> " A_LoopField)
				return
			}
		Acc_Error(AccError)
		StringReplace, Cmd, Cmd, %A_Space%, , All
		properties.HasKey(Cmd)? Cmd:=properties[Cmd]:
		try {
			if (Cmd = "Location")
				AccObj.accLocation(ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId)
			      , ret_val := "x" NumGet(x,0,"int") " y" NumGet(y,0,"int") " w" NumGet(w,0,"int") " h" NumGet(h,0,"int")
			else if (Cmd = "Object")
				ret_val := AccObj
			else if Cmd in Role,State
				ret_val := Acc_%Cmd%(AccObj, ChildID+0)
			else if Cmd in ChildCount,Selection,Focus
				ret_val := AccObj["acc" Cmd]
			else
				ret_val := AccObj["acc" Cmd](ChildID+0)
		} catch {
			ErrorLevel := """" Cmd """ Cmd Not Implemented"
			if Acc_Error()
				throw Exception("Cmd Not Implemented", -1, Cmd)
			return
		}
		return ret_val, ErrorLevel:=0
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
Acc_Error(p="") {		;--
   static setting:=0
   return p=""?setting:setting:=p
}
Acc_ChildrenByRole(Acc, Role) {		;--
   if ComObjType(Acc,"Name")!="IAccessible"
      ErrorLevel := "Invalid IAccessible Object"
   else {
      Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
      if DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
         Loop %cChildren% {
            i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i)
            if NumGet(varChildren,i-8)=9
               AccChild:=Acc_Query(child), ObjRelease(child), Acc_Role(AccChild)=Role?Children.Insert(AccChild):
            else
               Acc_Role(Acc, child)=Role?Children.Insert(child):
         }
         return Children.MaxIndex()?Children:, ErrorLevel:=0
      } else
         ErrorLevel := "AccessibleChildren DllCall Failed"
   }
   if Acc_Error()
      throw Exception(ErrorLevel,-1)
}
VARIANTstruct() { ;so wahrscheinlich nicht funktionsfähig
	DllCall("LoadLibrary",str,"oleacc", ptr)

	VarSetCapacity(Point, 8, 0)
	DllCall("GetCursorPos", ptr, &Point)

	DllCall("oleacc\AccessibleObjectFromPoint", "int64", NumGet(Point, 0, "int64"), ptrp, pAccessible, ptr, &varChild)

	; get vtable for IAccessible
	vtAccessible :=  NumGet(pAccessible+0, "ptr")

	; call get_accName() through the vtable
	hr := DllCall(NumGet(vtAccessible+0, 10*A_PtrSize, "ptr"), ptr, pAccessible,"int64", 3, "int64", 0,"int64", 0 ptrp, pvariant)
	; variant's type is VT_I4 = 3
	; variant's value is CHILDID_SELF = 0

	; get_accName returns the following hresult error with 64 bit ahk
	hr_facility := (0x07FF0000 & hr) >>16	; shows facility = 7 "win32"
	hr_code := 0x0000ffff & hr		; code 1780 "RPC_X_NULL_REF_POINTER"

}

listAccChildProperty(hwnd){	;--

	COM_AccInit()
	If	pacc :=	COM_AccessibleObjectFromWindow(hWnd)
	{
		;~ VarSetCapacity(l,4),VarSetCapacity(t,4),VarSetCapacity(w,4),VarSetCapacity(h,4)
		;~ COM_Invoke(pacc,"accLocation",l,t,w,h,0)
		;~ a:=COM_Invoke(pacc,"accParent")

		sResult	:="[Window]`n"
			. "Name:`t`t"		COM_Invoke(pacc,"accName",0) "`n"
			. "Value:`t`t"		COM_Invoke(pacc,"accValue",0) "`n"
			. "Description:`t"	COM_Invoke(pacc,"accDescription",0) "`n"
			. COM_Invoke(pacc,"accDefaultAction",0) "`n"
			. COM_Invoke(pacc,"accHelp",0) "`n"
			. COM_Invoke(pacc,"accKeyboardShortcut",0) "`n"
			. COM_Invoke(pacc,"accRole",0) "`n"
			. COM_Invoke(pacc,"accState",0) "`n"


		Loop, %	COM_AccessibleChildren(pacc, COM_Invoke(pacc,"accChildCount"), varChildren)
			If	NumGet(varChildren,16*(A_Index-1),"Ushort")=3 && idChild:=NumGet(varChildren,16*A_Index-8)
				sResult	.="[" A_Index "]`n"
					. "Name:`t`t"		COM_Invoke(pacc,"accName",idChild) "`n"
					. "Value:`t`t"		COM_Invoke(pacc,"accValue",idChild) "`n"
					. "Description:`t"	COM_Invoke(pacc,"accDescription",idChild) "`n"
					. COM_Invoke(pacc,"accParent",idChild) "`n"

			Else If	paccChild:=NumGet(varChildren,16*A_Index-8) {
				sResult	.="[" A_Index "]`n"
					. "Name:`t`t"		COM_Invoke(paccChild,"accName",0) "`n"
					. "Value:`t`t"		COM_Invoke(paccChild,"accValue",0) "`n"
					. "Description:`t"	COM_Invoke(paccChild,"accDescription",0) "`n"
				if a_index=3
				{
					numput(1,var,"UInt")
					COM_Invoke(pacc,"accSelect",1,paccChild)
				}
				 COM_Release(paccChild)
			}
		COM_Release(pacc)
	}
	COM_AccTerm()

	return sResult
}



;}
; Acc_Get()						|	Acc_Error()						|	Acc_ChildrenByRole()				|	listAccChildProperty()			|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Internet Explorer/Chrome/FireFox/HTML functions (2)
; AutoHotkey_L: von jethrow
IEGet(name="") {		;-- AutoHotkey_L
   IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame ; Get active window if no parameter
   Name := (Name="New Tab - Windows Internet Explorer")? "about:Tabs":RegExReplace(Name, " - (Windows|Microsoft) Internet Explorer")
   for WB in ComObjCreate("Shell.Application").Windows
      if WB.LocationName=Name and InStr(WB.FullName, "iexplore.exe")
         return WB
}
; AHK Basic:
IEGet(name="") {		;-- AutoHotkey_Basic
   IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame ; Get active window if no parameter
   Name := (Name="New Tab - Windows Internet Explorer") ? "about:Tabs":RegExReplace(Name, " - (Windows|Microsoft) Internet Explorer")
   oShell := COM_CreateObject("Shell.Application") ; Contains reference to all explorer windows
   Loop, % COM_Invoke(oShell, "Windows.Count") {
      if pwb := COM_Invoke(oShell, "Windows", A_Index-1)
         if COM_Invoke(pwb, "LocationName")=name and InStr(COM_Invoke(pwb, "FullName"), "iexplore.exe")
            Break
      COM_Release(pwb), pwb := ""
   }
   COM_Release(oShell)
   return, pwb
}
; AutoHotkey_L:
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) { ;-- AHK_L: based on ComObjQuery docs
	static	msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
	,	IID := "{0002DF05-0000-0000-C000-000000000046}" ; IID_IWebBrowserApp
;	,	IID := "{332C4427-26CB-11D0-B483-00C04FD90119}" ; IID_IHTMLWindow2
	SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%
	if (ErrorLevel != "FAIL") {
		lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
		if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
			DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
			return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
		}
	}
}
; AHK Basic:
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) { ;-- AHK_Basic: based on Sean's GetWebBrowser function
	static msg, IID := "{332C4427-26CB-11D0-B483-00C04FD90119}" ; IID_IWebBrowserApp
	if Not msg
		msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
	SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%
	if (ErrorLevel != "FAIL") {
		lResult:=ErrorLevel, GUID:=COM_GUID4String(IID_IHTMLDocument2,"{332C4425-26CB-11D0-B483-00C04FD90119}")
		DllCall("oleacc\ObjectFromLresult", "Uint",lResult, "Uint",GUID, "int",0, "UintP",pdoc)
		return COM_QueryService(pdoc,IID,IID), COM_Release(pdoc)
	}
}
;
wb := WBGet()				;inner HTML
MsgBox % wb.document.documentElement.innerHTML
WBGet(WinTitle="ahk_class IEFrame", Svr#=1) { ;-- based on ComObjQuery docs
   static   msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
         ,  IID := "{332C4427-26CB-11D0-B483-00C04FD90119}" ; IID_IWebBrowserApp
   SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%
   if (ErrorLevel != "FAIL") {
      lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
      if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
         DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
         return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
      }
   }
}
; Firefox
SetTitleMatchMode 2
MsgBox % Acc_Get("Value", "4.20.2.4.2", 0, "Firefox")
MsgBox % Acc_Get("Value", "application1.property_page1.tool_bar2.combo_box1.editable_text1", 0, "Firefox")



;}
; IEGet()							|	WBGet()							|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{Variables - Handling (3)
ComVar(Type:=0xC) { 														;-- Creates an object which can be used to pass a value ByRef.

    ;   ComVar: Creates an object which can be used to pass a value ByRef.
    ;   ComVar[] retrieves the value.
    ;   ComVar[] := Val sets the value.
    ;   ComVar.ref retrieves a ByRef object for passing to a COM function.

    static base := { __Get: "ComVarGet", __Set: "ComVarSet" }
    ; Create an array of 1 VARIANT.  This method allows built-in code to take
    ; care of all conversions between VARIANT and AutoHotkey internal types.
    arr := ComObjArray(Type, 1)
    ; Retrieve a pointer to the VARIANT.
    arr_data := NumGet(ComObjValue(arr)+8+A_PtrSize)
    ; Store the array and an object which can be used to pass the VARIANT ByRef.
    return { ref: ComObject(0x4000|Type, arr_data), _: arr, base: base }
}
ComVarGet(cv, p*) { 															;-- Called when script accesses an unknown field.
    if p.MaxIndex() = "" ; No name/parameters, i.e. cv[]
        return cv._[0]
}
ComVarSet(cv, v, p*) { 														;-- Called when script sets an unknown field.
    if p.MaxIndex() = "" ; No name/parameters, i.e. cv[]:=v
        return cv._[0] := v
}



;}
; ComVar()						|	ComVarGet()					|	ComVarSet()						|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;{other languages or MCode functions(1)
MCode_Bin2Hex(addr, len, ByRef hex) { 							;-- By Lexikos, http://goo.gl/LjP9Zq
	Static fun
	If (fun = "") {
		If Not A_IsUnicode
			h =
			( LTrim Join
				8B54240C85D2568B7424087E3A53578B7C24148A07478AC8C0E90480F9090F97C3F6
				DB80E30702D980C330240F881E463C090F97C1F6D980E10702C880C130880E464A75
				CE5F5BC606005EC3
			)
		Else
			h =
			( LTrim Join
				8B44240C8B4C240485C07E53568B74240C578BF88A168AC2C0E804463C090FB6C076
				066683C037EB046683C03066890180E20F83C10280FA09760C0FB6D26683C2376689
				11EB0A0FB6C26683C03066890183C1024F75BD33D25F6689115EC333C0668901C3
			)
		VarSetCapacity(fun, n := StrLen(h)//2)
		Loop % n
			NumPut("0x" . SubStr(h, 2 * A_Index - 1, 2), fun, A_Index - 1, "Char")
	}
	hex := ""
	VarSetCapacity(hex, A_IsUnicode ? 4 * len + 2 : 2 * len + 1)
	DllCall(&fun, "uint", &hex, "uint", addr, "uint", len, "cdecl")
	VarSetCapacity(hex, -1) ;update StrLen
}

;}
; MCode_Bin2Hex()			|
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;----- NOT SORTED FUNCTION OR FUNCTION I CANT IDENTIFY - but looks interesting

GetAllInputChars() {		;--
    Loop 256
        ChrStr .= Chr( a_index ) " "

    ChrStr .= "{down} {up} {right} {left} "

    Return ChrStr
}

CalcAddrHash(addr, length, algid, byref hash = 0, byref hashlength = 0) {		;--

    static h := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "A", "B", "C", "D", "E", "F"]
    static b := h.minIndex()
    o := ""
    if (DllCall("advapi32\CryptAcquireContext", "Ptr*", hProv, "Ptr", 0, "Ptr", 0, "UInt", 24, "UInt", 0xF0000000))
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
                        loop, % hashlength
                        {
                            v := NumGet(hash, A_Index - 1, "UChar")
                            o .= h[(v >> 4) + b] h[(v & 0xf) + b]
                        }
                    }
                }
            }
            DllCall("advapi32\CryptDestroyHash", "Ptr", hHash)
        }
        DllCall("advapi32\CryPtreleaseContext", "Ptr", hProv, "UInt", 0)
    }
    return o
}

CalcStringHash(string, algid, encoding = "utf-8", byref hash = 0, byref hashlength = 0) {		;--
    chrlength := (encoding = "cp1200" || encoding = "utf-16") ? 2 : 1
    length := (StrPut(string, encoding) - 1) * chrlength
    VarSetCapacity(data, length, 0)
    StrPut(string, &data, floor(length / chrlength), encoding)
    return CalcAddrHash(&data, length, algid, hash, hashlength)
}

getNetControl(winHwnd, controlName="", accName="", classNN="", accHelp="") {		;--

	winget, list, controllisthwnd, ahk_id %winHwnd%

	bufSize=1024
	winget, processID, pid, ahk_id %winHwnd%
	VarSetCapacity(var1,bufSize)
	getName:=DllCall( "RegisterWindowMessage", "str", "WM_GETCONTROLNAME" )
	dwResult:=DllCall("GetWindowThreadProcessId", "UInt", winHwnd)
	hProcess:=DllCall("OpenProcess", "UInt", 0x8 | 0x10 | 0x20, "Uint", 0, "UInt", processID)
	otherMem:=DllCall("VirtualAllocEx", "Ptr", hProcess, "Ptr", 0, "PTR", bufSize, "UInt", 0x3000, "UInt", 0x0004, "Ptr")

	count=0
	;~ static hModule := DllCall("LoadLibrary", "Str", "oleacc", "Ptr")
	;~ static hModule2 := DllCall("LoadLibrary", "Str", "Kernel32", "Ptr")
	;~ static AccessibleObjectFromWindowProc := DllCall("GetProcAddress", Ptr, DllCall("GetModuleHandle", Str, "oleacc", "Ptr"), AStr, "AccessibleObjectFromWindow", "Ptr")
	;~ static ReadProcessMemoryProc:=DllCall("ReadProcessMemory", Ptr, DllCall("GetModuleHandle", Str, "Kernel32", "Ptr"), AStr, "AccessibleChildren", "Ptr")
	;~ msgbox % AccessibleObjectFromWindowProc
	;~ static idObject:=-4
	loop,parse,list,`n
	{
		SendMessage,%getName%,%bufSize%,%otherMem%,,ahk_id %a_loopfield%
        DllCall("ReadProcessMemory","UInt",hProcess,"UInt",otherMem,"Str",var1,"UInt",bufSize,"UInt *",0)

		;~ acc:=acc_objectfromwindow2(a_loopfield)

		;~ if !DllCall(AccessibleObjectFromWindowProc, "Ptr", a_loopfield, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)
			;~ acc:=ComObjEnwrap(9,pacc,1)
		;~ else
			;~ acc:=""


	;&&(accParentHwnd=""||acc_windowfromobject(acc.accParent)=accParentHwnd)
		if ((var1&&var1=controlName)&&(accName=""||(acc:=Acc_ObjectFromWindow(a_loopfield)).accName=accName)){
			WinGetClass,cl,ahk_id %a_loopfield%
			if(instr(cl,classNN)=1&&(accHelp=""||acc.accHelp=accHelp)) {
				ret:=a_loopfield
				break
			}
		}

		var1:=""
	}

    DllCall("VirtualFreeEx","Ptr", hProcess,"UInt",otherMem,"UInt", 0, "UInt", 0x8000)
	DllCall("CloseHandle","Ptr",hProcess)
	DllCall("FreeLibrary", "Ptr", hModule)
	return ret

}

LoadScriptString(scriptResource) {		;--

	;   Type: MAKEINTRESOURCE(10)   RT_RCDATA/Application-defined resource (raw data).
	;https://autohotkey.com/board/topic/102445-how-to-modify-files-compiled-inside-exe-without-exporting-them/
	; scriptResource = a text file stored in RCDATA
	; if 0
	;   FileInstall, script.ahk, Ignore
	; LoadScriptString("script.ahk")

    lib := DllCall("GetModuleHandle", "ptr", 0, "ptr")
    res := DllCall("FindResource", "ptr", lib, "str", scriptResource, "ptr", Type := 10, "ptr")
    DataSize := DllCall("SizeofResource", "ptr", lib, "ptr", res, "uint")
    hresdata := DllCall("LoadResource", "ptr", lib, "ptr", res, "ptr")
    if (data := DllCall("LockResource", "ptr", hresdata, "ptr"))
        return StrGet(data, DataSize, "UTF-8")    ; Retrieve text, assuming UTF-8 encoding.
    else return 0

}

LoadScriptResource(Name, ByRef DataSize = 0, Type = 10) {		;--

	;Lexikos Original
	lib := DllCall("GetModuleHandle", "ptr", 0, "ptr")
    res := DllCall("FindResource", "ptr", lib, "str", Name, "ptr", Type, "ptr")
    DataSize := DllCall("SizeofResource", "ptr", lib, "ptr", res, "uint")
    hresdata := DllCall("LoadResource", "ptr", lib, "ptr", res, "ptr")
    return DllCall("LockResource", "ptr", hresdata, "ptr")

}

ResourceHackerIcons(dotIcoFile) {		;--

	;https://autohotkey.com/board/topic/102445-how-to-modify-files-compiled-inside-exe-without-exporting-them/
	;Resource hacker needs to be executed with admin privileges as well.

	if !A_IsCompiled
		return
	msgbox This will attempt to change the included icons inside the binary file.`n`nThis may not work!`n`nOnly .ico files are compatible.`n`nThe program will close and attempt the operation. This will take around 10 seconds.
	FileCreateDir, %A_Temp%\Resource Hacker
	FileInstall, Included Files\Resource Hacker\ResHacker.exe, %A_Temp%\Resource Hacker\ResHacker.exe, 1

	Rscript := "[FILENAMES]"
			.	"`nExe= " A_ScriptFullPath
			. "`nSaveAs= " A_ScriptFullPath
			. "`n[COMMANDS]"
		;	. "`n-addoverwrite " dotIcoFile ", ICONGROUP,MAINICON,0"
			. "`n-addoverwrite " dotIcoFile ", icon, 159,"
			. "`n-addoverwrite " dotIcoFile ", icon, 160,"
			. "`n-addoverwrite " dotIcoFile ", icon, 206,"
			. "`n-addoverwrite " dotIcoFile ", icon, 207,"
			. "`n-addoverwrite " dotIcoFile ", icon, 208,"
			. "`n-addoverwrite " dotIcoFile ", icon, 228,"
			. "`n-addoverwrite " dotIcoFile ", icon, 229,"
			. "`n-addoverwrite " dotIcoFile ", icon, 230,"

	FileDelete, %A_Temp%\Resource Hacker\Rscript.txt
	FileAppend, %Rscript%, %A_Temp%\Resource Hacker\Rscript.txt

	AhkScript := "#NoEnv"
		. "`n#SingleInstance force"
		. "`nSetWorkingDir %A_ScriptDir%"
		. "`nsleep 4000" ;give time for macro trainer to close so can open in reshackers
		. "`nRun,  %A_Temp%\Resource Hacker\ResHacker.exe -script Rscript.txt"
		. "`nRun,  ResHacker.exe -script Rscript.txt, %A_Temp%\Resource Hacker\"
		. "`nmsgbox I just tried to change the included icon files``nDon't know if it worked.``n``nPress ok to re-launch the macro-trainer to find out"
		. "`nrun, " A_ScriptFullPath ;attempt to launch the original program
		. "`nExitapp"

		DynaRun(AhkScript, "ChangeIcon.AHK", A_Temp "\AHK.exe")
		ExitApp
}


;{Scite4AHK options

	;{ Toggle All Fold RightContextMenu
# 23 Un/Fold #Region
command.name.23.$(ahk)=Toggle Fold #Region
command.23.*.ahk=dostring local text = editor:GetText() tReg = {} pos, iEnd = text:find('#[Rr][Ee][Gg][Ii][Oo][Nn]') \
if pos ~= nil then table.insert(tReg, pos) while true do \
pos, iEnd = text:find('#[Rr][Ee][Gg][Ii][Oo][Nn]', iEnd) \
if pos == nil then break end table.insert(tReg, pos) end \
for i=1, #tReg do editor:GotoPos(tReg[i]) editor.CurrentPos = tReg[i] \
scite.MenuCommand(IDM_EXPAND) end end
command.mode.23.*=subsystem:lua
command.shortcut.23.*.ahk=Ctrl+Alt+F12
		;}

;}

