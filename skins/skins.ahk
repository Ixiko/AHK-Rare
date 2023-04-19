; place this anywhere
; uncomment to set or use in another file
; setTheme(theme := "aero.she")

ahkexe := A_ScriptDir "\AutoHotkey32UIA.exe"

; if not 32 bit, launch 32bit ahk
if !(1 = 1 and A_PtrSize = 4)
{
	try {
		if FileExist(ahkexe) {
		Run(ahkexe " `"" A_ScriptFullPath "`"") ;Must run 32bit
		; Run either 32bit AHKV2
		ExitApp()
		}
	}
	catch {
		msgbox("Failed to load at 32 bit and couldn't find an AHK32.exe file. Please check the skins.ahk file and set the ahkexe path")
		ExitApp()
	}
}

setTheme(theme := "aero.she") {
	try {
		hSkinH := DllCall("LoadLibrary", "Str", "skins\SkinHu.dll")
		changeSkin(A_ScriptDir "\skins\" theme)
	}
	catch {
		MsgBox("Couldnt load the skin for the GUI. Your skinhu dll is missing.")
	}
}

changeSkin(skinPath) {
	try {
		DllCall("SkinHu\SkinH_AttachEx", "Str", skinPath, "Str", "mhgd")
	}
	catch {
		MsgBox("Couldnt load the skin for the GUI. Your *.she file is missing.")
	}
}

lookIn(dir, what){
	SplitPath(what,&fname, , &ext)
	dir := dir "\*." ext
	Loop files, dir, "R" {
		if A_LoopFileName == what {
			return A_LoopFilePath
		}
	}
}